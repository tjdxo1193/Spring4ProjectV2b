<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 로그인하지 않았으면 list페이지로 강제 전환 --%>
<c:if test="${empty UID}">
    <%--    <c:redirect url="/pds/list?cp=1" />--%>
</c:if>
<script src="https://www.google.com/recaptcha/api.js"></script>
<div id="main" class="margin30">
    <div class="margin30">
        <h3><i class="bi bi-cloud-download"></i> 자료실</h3>
        <hr>
    </div>

    <form id="newpdfrm" class="margin1050">
        <div class="row margin30">
            <div class="col-6">
                <h4><i class="bi bi-plus-circle bidragup"></i> 새글쓰기</h4>
            </div>
            <div class="col-6 text-right">
                <button class="btn btn-dark">
                    <i class="bi bi-collection"></i> 목록으로
                </button>
            </div>
        </div> <!-- 상단 버튼 -->
        <div class="card card-body bg-light">
            <div class="form-group row">
                <label for="title" class="col-form-label col-2 text-right">제목</label>
                <input type="text" id="title" name="title" class="form-control col-9" value="${pvo.title}">
            </div>
            <div class="form-group row">
                <label for="uid" class="col-form-label col-2 text-right">작성자</label>
                <input type="text" id="uid" name="userid" class="form-control col-9" readonly value="${UID}">
            </div>
            <div class="form-group row">
                <label for="contents" class="col-form-label col-2 text-right">내용</label>
                <textarea type="text" id="contents" name="contents"
                          class="form-control col-9" rows="15" style="resize:none">${pvo.contents}</textarea>
            </div>

            <%-- 파일첨부 시작 --%>
            <div class="form-group row">
                <label for="file1" class="col-form-label col-2 text-right">파일첨부</label>
                <div class="custom-file col-9">
                    <input type="file" id="file1" name="file1" class="custom-file-input">
                    <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file2" name="file2" class="custom-file-input">
                    <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                </div>
                <div class="custom-file col-9 offset-2">
                    <input type="file" id="file3" name="file3" class="custom-file-input">
                    <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                </div>
            </div>
            <%— 파일첨부 끝 —%>

            <div class="form-group row">
                <label class="col-2 col-form-label text-right">자동입력방지</label>
                <div class="g-recaptcha"
                     data-sitekey="6LfF1joaAAAAAO7Wi8mu7OMAPgC37LqlS6EsPYdb"></div>
                <input type="hidden" name="g-recaptcha" id="g-recaptcha">
                <span style="color: red">${checkCaptcha}</span>
            </div> <!— 자동입력방지 —>
        </div> <!— 새글쓰기 폼 —>
        <div class="row margin30">
            <div class="col-12 text-center">
                <button type="button" id="newpdbtn" class="btn btn-success">
                    <i class="bi bi-check"></i>
                    등록하기
                </button>
                <button type="button" id="cancelbtn" class="btn btn-danger">
                    <i class="bi bi-x"></i>
                    취소하기
                </button>
            </div>
        </div> <!— 버튼들 —>
    </form>
</div>