<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
    // 게시판 네비게이션
    // 현재 페이지에 따라 보여줄 페이지 블록을 결정
    // ex) 총 페이지수pages가 27일때
    // cp = 1 : 1 2 3 4 5 6 7 8 9 10
    // cp = 3 : 1 2 3 4 5 6 7 8 9 10
    // cp = 9 : 1 2 3 4 5 6 7 8 9 10
    // cp = 11 : 11 12 13 14 15 16 17 18 19 20
    // cp = 17 : 11 12 13 14 15 16 17 18 19 20
    // cp = 23 : 21 22 23 24 25 26 27
    startPage = floor((cp-1) / 10) * 10 + 1
    endPage = startPage + 9
--%>

<%--
    // 글번호 재조정
    // 총게시물수 total : 150, 페이지당 게시물수 pp : 10
    // page 1 : 150~141
    // page 2 : 140~131
    // page 3 : 130~121
    // ........
    // page n : snum = total - ( n - 1 ) * 10

--%>

<fmt:parseNumber var="cp" value="${param.cp}" />
<fmt:parseNumber var="pp" value="10" />

<fmt:parseNumber var="sp" integerOnly="true" value="${((cp-1) / pp)}"/>
<fmt:parseNumber var="sp" value="${(sp * 10) + 1}"/>
<fmt:parseNumber var="ep" value="${(sp + 9)}"/>

<fmt:parseNumber var="tp" value="${pdcnt / pp}" integerOnly="true"/>
<c:if test="${(pdcnt % pp) > 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}" />
</c:if>

<fmt:parseNumber var="snum" integerOnly="true"
                 value="${pdcnt - (cp - 1) * pp}"/>

<%-- 검색여부에 따라 네비게이션 링크 출력을 다르게 함 --%>
<%-- 일반 목록 출력 : /pds/list?cp=--%>
<%-- 검색 목록 출력 : /pds/find?findtype=..&findkey=...&cp=..--%>

<c:set var="navlink" value="/pds/list?cp="/>
<c:if test="${not empty param.findkey}">
    <c:set var="navlink">
        /pds/find?findtype=${param.findtype}&findkey=${param.findkey}&cp=
    </c:set>
</c:if>

<div id="main" class="margin30">
    <div class="margin30">
        <h3><i class="bi bi-cloud-download-fill bidragup"></i> 자료실</h3>
        <hr>
    </div>
    <div class="row margin1050">
        <c:if test="${not empty UID}">
            <div class="col-6">
                <div class="form-group row">
                    <select name="findtype" id="findtype" class="form-control col-4">
                        <option value="title">제목</option>
                        <option value="ticon">제목 + 내용</option>
                        <option value="contents">내용</option>
                        <option value="userid">작성자</option>
                    </select>&nbsp;
                    <input type="text" name="findkey" id="findkey" class="form-control col-5">&nbsp;
                    <button type="button" id="pdfindbtn" class="btn btn-success">
                        <i class="bi bi-search"></i>
                        검색
                    </button>
                </div>
            </div>
            <div class="col-6 text-right">
                <button type="button" id="newpd" class="btn btn-light">
                    <i class="bi bi-pencil bidragup"></i> 새글쓰기
                </button>
            </div>
        </c:if>
    </div>

    <div class="row margin1050">
        <div class="col-12">
            <table class="table table-striped tblines text-center table-hover boardList_table">
                <thead style="background: lightgreen">
                <tr>
                    <th style="width: 7%">번호</th>
                    <th>제목</th>
                    <th style="width: 12%">작성자</th>
                    <th style="width: 11%">작성일</th>
                    <th style="width: 7%">추천</th>
                    <th style="width: 7%">조회</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-danger">
                    <th>공지</th>
                    <th><span class="badge-danger">HOT</span>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    </th>
                    <th>운영자</th>
                    <th>2021.01.15</th>
                    <th>100</th>
                    <th>9999</th>
                </tr>
                <c:forEach var="p" items="${pds}">
                    <tr>
                        <td>${snum}</td>
                        <td><a href="/pds/view?pno=${p.pno}&cp=${cp}">${p.title}</a></td>
                        <td>${p.userid}</td>
                        <td>${fn:substring(p.regdate, 0, 10)}</td>
                        <td>${p.thumbs}</td>
                        <td>${p.views}</td>
                        <c:set var="snum" value="${snum-1}"/>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div> <!-- 게시판테이블 -->
    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">
                <%-- '이전'이 표시되어야 할때는 cp > 10 --%>
                <li class="page-item <c:if test="${sp le 10}">disabled</c:if>">
                    <a href="${navlink}${sp-10}" class="page-link">이전</a>
                </li>

                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                    <c:if test="${i le tp}">
                        <c:if test="${i ne cp}">
                            <li class="page-item">
                                <a href="${navlink}${i}" class="page-link font-weight-bold">${i}</a>
                            </li>
                        </c:if>
                        <c:if test="${i eq cp}">
                            <li class="page-item active">
                                <a href="${navlink}${i}" class="page-link font-weight-bold">${i}</a>
                            </li>
                        </c:if>
                    </c:if>
                </c:forEach>

                <!—- '다음'이 표시되어야 할때는? -—>
                <li class="page-item <c:if test="${ep gt tp}">disabled</c:if>">
                    <a href="${navlink}${sp + 10}" class="page-link">다음</a>
                </li>
            </ul>
        </div>
    </div>
</div>