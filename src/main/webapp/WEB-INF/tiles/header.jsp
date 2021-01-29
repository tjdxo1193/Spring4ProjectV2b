<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="row">
    <div class="col-6">
        <h1>Lorem Inpsum</h1>
    </div>
    <div class="col-6 text-right">
        <%--  세션변수 UID에 값이 존재하지 않는다면 (즉, 로그인하지 않았다면) --%>
        <c:if test="${empty UID}">
            <h1>
                <button type="button" class="btn btn-danger"
                        data-toggle="modal" data-target="#loginmodal">로그인</button>
                <button type="button" id="join2btn" class="btn btn-primary">회원가입</button>
            </h1>
        </c:if>
            <%--  세션변수 UID에 값이 존재하지 않는다면 (즉, 로그인했다면) --%>
        <c:if test="${not empty UID}">
            <h1>
                <button type="button" class="btn btn-dark" id="logoutbtn">로그아웃</button>
            </h1>
        </c:if>
    </div>
</header>

<nav class="nav navbar-expand navbar-dark bg-dark">
    <ul class="navbar-nav nav-fill w-100">
        <li class="nav-item"><a class="nav-link" href="/intro">프로젝트 소개</a></li>
        <%-- 로그인 여부에 따라 메뉴 표시를 다르게 함 --%>
        <c:if test="${empty UID}">
            <li class="nav-item"><a class="nav-link" href="/join/agree">회원가입</a></li>
        </c:if>
        <c:if test="${not empty UID}">
        <li class="nav-item"><a class="nav-link disabled">회원가입</a></li>
        </c:if>
        <li class="nav-item"><a class="nav-link" href="/board/list">게시판</a></li>
        <li class="nav-item"><a class="nav-link" href="/pds/list">자료실</a></li>
        <li class="nav-item"><a class="nav-link" href="/gallery/list">갤러리</a></li>
        <li class="nav-item"><a class="nav-link" href="/admin">관리자</a></li>
    </ul>
</nav>
