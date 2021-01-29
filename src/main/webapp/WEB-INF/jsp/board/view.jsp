<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- 줄바꿈 문자를   newChar변수에 저장--%>
<%--<% String newChar = "블라블라"; %>--%>
<%--<c: set var="newChar" value="블라블라" />--%>
<%-- JSP 객체의 생존기간 : scope --%>
<%-- page : 현재페이지내에서만 객체 사용 --%>
<%-- request : 이전페이지(폼)에서 생성한 객체를 현재페이지(처리)에 요청을 통해 사용 --%>
<%-- session : 동일 브라우저내에서 공유할 수 있는 객체 --%>
<%-- application : 어플리케이션(프로젝트) 내에서 공유할 수 있는 객체 --%>

<c: set var="newChar" value="
" scope="application" />

<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i> 게시판</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-6">
            <button type="button" id="prevbtn"
                    class="btn btn-light">
                <i class="bi bi-chevron-left bidragup"></i>
                이전게시물</button>
            <button type="button" id="nextbtn"
                    class="btn btn-light">
                <i class="bi bi-chevron-right bidragup"></i>
                다음게시물</button>
        </div>
        <div class="col-6 text-right">
            <button type="button" id="newbdbtn"
                    class="btn btn-light">
                <i class="bi bi-plus-circle-fill bidragup"></i>
                새글쓰기</button>
        </div>
    </div><!-- 버튼들 -->

    <div class="row margin1050">
        <table class="table">
            <tr><th colspan="2" class="tblines2 tbbg1">
                <h2>${bd.title}</h2></th></tr><!-- 제목 -->
            <tr class="tbbg2"><td>${bd.userid}</td>
                <td class="text-right">${bd.regdate} / ${bd.thumbs} / ${bd.views}</td></tr><!-- 작성자,작성일,조회수 -->
            <tr><td colspan="2" class="tbbg3 tblines2">
                ${fn:replace(bd.contents, newChar, "<br>")}
            </td></tr><!-- 본문 -->
        </table>
    </div><!-- 본문글 -->

    <div class="row margin1050">
        <div class="col-6">
            <button type="button" id="upbdbtn"
                    class="btn btn-warning">
                <i class="bi bi-pencil-square bidragup"></i>
                수정하기</button>
            <button type="button" id="rmbdbtn"
                    class="btn btn-danger">
                <i class="bi bi-trash-fill bidragup"></i>
                삭제하기</button>
        </div>
        <div class="col-6 text-right">
            <button type="button" id="listbdbtn"
                    class="btn btn-light">
                <i class="bi bi-card-list bidragup"></i>
                목록으로</button>
        </div>
    </div><!-- 버튼들 -->

    <div class="row margin1050" style="margin-top: 100px;">
        <h3><i class="bi bi-chat-square-dots-fill bidragup"></i>
            나도 한마디</h3>

        <table class="table tblines tbwide">
            <tr><td><h4>zzyzzy</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-30 15:15:15</div>
                    <p>Nulla dui mauris, tempus at ornare eget, dapibus id diam. <br>
                        Etiam ac placerat risus, a aliquet nunc. <br>
                        Quisque id tortor ut ante auctor auctor. <br>
                        Maecenas sollicitudin risus mauris, a auctor leo lobortis ac. <br>
                        Sed luctus consequat ligula, vitae ultrices purus lobortis gravida.
                    </p><!-- 댓글 -->
                    <ul class="list-unstyled">
                        <li>
                            <div class="cmtbg2"><span class="h4">zzyzzy</span>
                                <span class="pushright">2021-01-30 16:16:16</span></div>
                            <p>Praesent metus ante, finibus vitae nibh in, consectetur dignissim eros.</p>
                        </li>
                    </ul><!-- 댓글의 댓글 -->
                </td></tr>
            <tr><td><h4>zzyzzy</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-30 15:15:15</div>
                    <p>Nulla dui mauris, tempus at ornare eget, dapibus id diam. <br>
                        Etiam ac placerat risus, a aliquet nunc. <br>
                        Quisque id tortor ut ante auctor auctor. <br>
                        Maecenas sollicitudin risus mauris, a auctor leo lobortis ac. <br>
                        Sed luctus consequat ligula, vitae ultrices purus lobortis gravida.
                    </p><!-- 댓글 -->
                </td></tr>
            <tr><td><h4>zzyzzy</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-30 15:15:15</div>
                    <p>Nulla dui mauris, tempus at ornare eget, dapibus id diam. <br>
                        Etiam ac placerat risus, a aliquet nunc. <br>
                        Quisque id tortor ut ante auctor auctor. <br>
                        Maecenas sollicitudin risus mauris, a auctor leo lobortis ac. <br>
                        Sed luctus consequat ligula, vitae ultrices purus lobortis gravida.
                    </p><!-- 댓글 -->
                </td></tr>
            <tr><td><h4>zzyzzy</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-30 15:15:15</div>
                    <p>Nulla dui mauris, tempus at ornare eget, dapibus id diam. <br>
                        Etiam ac placerat risus, a aliquet nunc. <br>
                        Quisque id tortor ut ante auctor auctor. <br>
                        Maecenas sollicitudin risus mauris, a auctor leo lobortis ac. <br>
                        Sed luctus consequat ligula, vitae ultrices purus lobortis gravida.
                    </p><!-- 댓글 -->
                </td></tr>
            <tr><td><h4>fdsfsdfsdfsdfs</h4></td>
                <td>
                    <div class="cmtbg1">2021-01-30 15:15:15</div>
                    <p>Nulla dui mauris, tempus at ornare eget, dapibus id diam. <br>
                        Etiam ac placerat risus, a aliquet nunc. <br>
                        Quisque id tortor ut ante auctor auctor. <br>
                        Maecenas sollicitudin risus mauris, a auctor leo lobortis ac. <br>
                        Sed luctus consequat ligula, vitae ultrices purus lobortis gravida.
                    </p><!-- 댓글 -->
                </td></tr>
        </table>
    </div><!-- 댓글목록 -->

    <div class="row margin1050">
        <form id="replyfrm" class="card card-body bg-light">
            <div class="form-group row justify-content-center">
                <label class="pushtop50 text-primary font-weight-bold">로그인하세요</label>&nbsp;
                <textarea id="comment" rows="5" class="form-control col-7"></textarea>&nbsp;
                <span><button id="bdcmtbtn" class="btn btn-dark pushtop50">
                        <i class="bi bi-chat-text-fill bidragup"></i>
                        댓글쓰기</button></span>
            </div>
        </form>
    </div><!-- 댓글폼 -->
</div>
