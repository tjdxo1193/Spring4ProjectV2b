<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%--
    // 게시판 네비게이션
    // 현재 페이지에 따라 보여줄 페이지 블록을 결정
    // ex) 총 페이지수pages가 27일 때
    // cp = 1 : 1 2 3 4 5 6 7 8 9 10
    // cp = 3 : 1 2 3 4 5 6 7 8 9 10
    // cp = 9 : 1 2 3 4 5 6 7 8 9 10
    // cp = 11 : 11 12 13 14 15 16 17 18 19 20
    // cp = 17 : 11 12 13 14 15 16 17 18 19 20
    // cp = 23 : 21 22 23 24 25 26 27
    startPage = floor((cp - 1) / 10) * 10 + 1
    endPage = startPage + 9
--%>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="pp" value="10" />
<fmt:parseNumber var="bdcnt" value="${bdcnt}" />

<fmt:parseNumber var="sp" integerOnly="true" value="${((cp - 1) / pp)}" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${sp + 9}"/>

<fmt:parseNumber var="tp" value="${bdcnt / pp}" integerOnly="true" />
<c:if test="${(bdcnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<%-- 검색여부에 따라 네비게이션 링크 출력을 다르게 함--%>

<%--일반 목록 출력: /board/list?cp=--%>
<%--검색후 목록 출력: /board/find?findtype=???&findkey=???&cp=??--%>
<c:set var="navlnk" value="/board/list?cp=" />
<c:if test="${not empty param.findkey}">
    <c:set var="navlnk" value="/board/find?findtype=${param.findtype}&findkey=${param.findkey}&cp=" />
</c:if>
<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i> 게시판</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-6">
            <div class="form-group row">
                <select name="findtype" id="findtype" class="form-control col-4">
                    <option value="title">제목</option>
                    <option value="ticon">제목 + 내용</option>
                    <option value="contents">내용</option>
                    <option value="userid">작성자</option>
                </select>&nbsp;
                <input type="text" name="findkey" id="findkey" class="form-control col-5">&nbsp;
                <button type="button" id="bdfindbtn" class="btn btn-dark"><i class="bi bi-search"> </i>검색</button>
            </div>
        </div>
        <div class="col-12 text-right">
<%--            <c:if test="${not empty UID}">--%>
                <button type="button" id="newbd"
                    class="btn btn-info">
                    <i class="bi bi-plus-circle bidragup"></i> 새글쓰기</button>
<%--            </c:if>--%>
        </div>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <table class="table table-striped tblines text-center table-hover">
                <thead style="background: #dff0d8">
                <tr><th style="width: 7%">번호</th>
                    <th>제목</th>
                    <th style="width: 12%">작성자</th>
                    <th style="width: 10%">작성일</th>
                    <th style="width: 7%">추천</th>
                    <th style="width: 7%">조회</th></tr>
                </thead>
                <tbody>
                <tr class="text-danger"><th>공지</th>
                    <th><span class="badge badge-danger">Hot</span>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    </th>
                    <th>운영자</th>
                    <th>2021.01.15</th>
                    <th>10</th>
                    <th>128</th></tr>

                <c:forEach var="b" items="${bds}">
                    <tr><td>${b.bno}</td>
                        <td><a href="/board/view?bno=${b.bno}&cp=${cp}">${b.title}</a></td>
                        <td>${b.userid}</td>
                        <td>${fn:substring(b.regdate,0,10)}</td>
                        <td>${b.thumbs}</td><td>${b.views}</td></tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div><!-- 게시판 테이블 -->

    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">
                <%-- '이전'이 표시되어야 할때는 sp > 10  --%>
                <li class="page-item <c:if test="${sp lt 11}">disabled</c:if>">
                        <a href="${navlnk}${sp-10}" class="page-link">이전</a></li>

                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <c:if test="${i le tp}">
                        <c:if test="${i ne cp}">
                            <li class="page-item">
                                <a href="${navlnk}${i}"
                                    class="page-link font-weight-bold">${i}</a></li>
                        </c:if>

                        <c:if test="${i eq cp}">
                            <li class="page-item active">
                                <a href="${navlnk}${i}"
                                    class="page-link font-weight-bold">${i}</a></li>
                        </c:if>
                    </c:if>
                </c:forEach>

                <%-- '다음'이 표시되어야 할때는 ???  --%>
                <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                    <a href="${navlnk}${sp+10}" class="page-link">다음</a></li>
            </ul>
        </div>
    </div><!-- 페이지네이션 -->

</div>