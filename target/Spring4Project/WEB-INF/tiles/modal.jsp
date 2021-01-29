<%@ page pageEncoding="UTF-8" %>

<div id="loginmodal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">로그인</h3>
                <button class="btn btn-light"
                        type="button"
                        data-dismiss="modal">닫기</button>
            </div><!-- 헤더 -->
            <div class="modal-body">
                <form id="loginfrm">
                    <div class="form-group row text-center">
                        <label for="userid"
                               class="col-form-label col-4">아이디</label>
                        <input type="text" id="userid" name="userid"
                               class="form-control col-6">
                    </div>
                    <div class="form-group row text-center">
                        <label for="passwd"
                               class="col-form-label col-4">비밀번호</label>
                        <input type="password" id="passwd" name="passwd"
                               class="form-control col-6">
                    </div>
                    <div class="form-group row">
                        <div class="col-4"></div>
                        <div class="form-check">
                            <input type="checkbox"
                                   class="form-check-input">
                            <label class="form-check-label">
                                로그인 상태 유지</label>
                        </div>
                    </div>
                </form>
            </div><!-- 본문 -->
            <div class="modal-footer justify-content-center">
                <button type="button" id="loginbtn" class="btn btn-danger">로그인</button>
                <button type="button" class="btn btn-success">
                    아이디/비밀번호찾기</button>
            </div><!-- 푸터 -->
        </div>
    </div>
</div>