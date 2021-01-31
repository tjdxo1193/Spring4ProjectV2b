<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://www.google.com/recaptcha/api.js"></script>

<div id="main margin30">
    <div class="margin30">
        <h3><img src="/img/GLYPHICONS/glyphicons_043_group.png">회원가입</h3>
        <hr>
    </div>

    <ul class="breadcrumb">
        <li class="breadcrumb-item">
            <button type="button" class="btn btn-success btn-sm" disabled>
                이용약관</button> </li>
        <li class="breadcrumb-item">
            <button type="button" class="btn btn-success btn-sm" disabled>
                실명확인</button> </li>
        <li class="breadcrumb-item active">
            <button type="button" class="btn btn-success btn-sm" disabled>
                정보입력</button></li>
        <li class="breadcrumb-item">
            <button type="button" class="btn btn-light btn-sm" disabled>
                가입완료</button></li>
    </ul>

    <div class="margin100">
        <h2>회원정보 입력</h2>
        <small class="text-muted">
            회원정보는 개인정보 취급방침에 따라 안전하게 보호되며,
            회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.
        </small>
        <hr>
    </div><!-- 제목 -->

    <div class="card card-body bg-light margin1050">
        <h3 class="font-weight-bold">일반회원</h3>

        <form name="joinfrm" id="joinfrm">
            <div class="row margin30">
                <div class="col-11 offset-1">
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="name">이름</label>
                        <input type="text" name="name" id="name"
                               class="form-control col-2 border-info"
                               readonly value="${param.name}">
                    </div><!-- 이름 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="jumin1">주민등록번호</label>
                        <input type="text" name="jumin1" id="jumin1"
                               class="form-control col-2 border-info"
                               readonly value="${param.jumin1}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="password" name="jumin2" id="jumin2"
                               class="form-control col-2 border-info"
                               readonly value="${param.jumin2}">
                    </div><!-- 주민번호 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="newuid">아이디</label>
                        <input type="text" name="userid" id="newuid"
                               class="form-control col-2 border-info"
                               value="${mvo.userid}">
                        <span id="uidmsg" class="col-form-label text-danger">
                            &nbsp;&nbsp;7~16 자의 영문 소문자, 숫자와 특수기호(_)만
                            사용할 수 있습니다.
                        </span>
                    </div><!-- 아이디 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="newpwd">비밀번호</label>
                        <input type="password" name="passwd" id="newpwd"
                               class="form-control col-2 border-info">
                        <span class="col-form-label text-danger">
                            &nbsp;&nbsp;7~16 자의 영문 소문자, 숫자와 특수기호(_)만
                            사용할 수 있습니다.
                        </span>
                    </div><!-- 비밀번호 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="repwd">비밀번호 확인</label>
                        <input type="password" name="repwd" id="repwd"
                               class="form-control col-2 border-info">
                        <span class="col-form-label text-danger">
                            &nbsp;&nbsp;이전 항목에서 입력했던
                            비밀번호를 한번 더 입력하세요.
                        </span>
                    </div><!-- 비밀번호 확인 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="zip1">우편번호</label>
                        <input type="text" name="zip1" id="zip1" readonly
                               class="form-control col-1 border-info"
                               value="${fn:split(mvo.zipcode,'-')[0]}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" name="zip2" id="zip2" readonly
                               class="form-control col-1 border-info"
                               value="${fn:split(mvo.zipcode,'-')[1]}">
                        <span>
                            &nbsp;&nbsp;<button type="button" class="btn btn-dark"
                                data-toggle="modal" data-target="#zipmodal">
                                <i class="bi bi-question-circle"></i> 우편번호 찾기
                            </button>
                        </span>
                    </div><!-- 우편번호 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="addr1">주소</label>
                        <input type="text" name="addr1" id="addr1" readonly
                               class="form-control col-3 border-info"
                            value="${mvo.addr1}">
                        &nbsp;
                        <input type="text" name="addr2" id="addr2"
                               class="form-control col-3 border-info">
                    </div><!-- 주소 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="email1">이메일</label>
                        <input type="text" name="email1" id="email1"
                               class="form-control col-2 border-info igborder"
                               value="${mvo.email}">
                        <div class="input-group-append">
                            <span class="input-group-text igborder">@</span>
                        </div>
                        <input type="text" name="email2" id="email2" readonly
                               class="form-control col-2 border-info igborder"
                               value="${mvo.email}">&nbsp;
                        <select id="email3" class="form-control col-2 border-info">
                            <option>선택하세요</option>
                            <option value="naver.com">naver.com</option>
                            <option>gmail.com</option>
                            <option>daum.net</option>
                            <option>hotmail.com</option>
                            <option>직접 입력하기</option>
                        </select>
                    </div><!-- 이메일 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info"
                               for="hp1">개인 연락처</label>
                        <select id="hp1" name="hp1" style="width:85px"
                                class="form-control border-info">
                            <option>국번</option>
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                        </select>
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" name="hp2" id="hp2"
                               class="form-control col-1 border-info"
                               value="${mvo.phone}">
                        <label class="col-form-label">&nbsp;&ndash;&nbsp;</label>
                        <input type="text" name="hp3" id="hp3"
                               class="form-control col-1 border-info"
                               value="${mvo.phone}">
                    </div><!-- 전화번호 -->

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-info">자동가입방지</label>
                        <div class="g-recaptcha"
                             data-sitekey="6Lcv1zoaAAAAAP0i4cEE7tYXMFHembG94MSsWUEv"></div>
                        <input type="hidden" name="g-recaptcha" id="g-recaptcha">
                        <span style="color:red">${checkCaptcha}</span>
                    </div><!-- 자동가입방지 -->

                </div>
            </div>

            <div class="row margin30">
                <div class="col-12 text-center">
                    <button type="button" id="joinbtn"
                            class="btn btn-primary">
                        <i class="bi bi-check"></i> 입력완료</button>
                    <button type="button" id="cancelbtn"
                            class="btn btn-danger">
                        <i class="bi bi-x"></i> 취소하기</button>
                </div>
            </div><!-- 버튼들 -->

            <input type="hidden" name="jumin" id="jumin">
            <input type="hidden" name="zipcode" id="zipcode">
            <input type="hidden" name="email" id="email">
            <input type="hidden" name="phone" id="phone">

        </form>
    </div><!-- 정보입력 -->

</div><!-- main -->

<!-- 우편번호 찾기 모달 -->
<div id="zipmodal" class="modal"
     data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">우편번호 찾기</h3>
                <button type="button" class="close" id="modalx">&times;</button>
            </div>
            <div class="modal-body">
                <form id="zipfrm">
                    <div class="form-group row justify-content-center pushzip">
                        <label for="dong" class="text-primary text-right"
                               style="margin-top:-5px">
                            검색하실 주소의<br> 동이름을 입력하세요
                        </label> &nbsp;&nbsp;
                        <input type="text" id="dong" name="dong"
                               class="form-control col-4 border-primary">&nbsp;&nbsp;
                        <span>
                         <button type="button" id="findbtn" class="btn btn-primary">
                           <i class="bi bi-search"></i> 검색하기</button>
                        </span>
                    </div>

                    <div class="form-group row justify-content-center">
                        <div>
                            <hr>
                            <p class="text-warning">지역의 읍/면/동의 이름을 공백없이 입력하신 후,
                                [검색하기] 버튼을 클릭하세요</p>
                            <select id="addrlist" name="addrlist"
                                    class="form-control" size="10">
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                                <option>123-456 서울 종로구 창신동</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-end">
                <button type="button" class="btn btn-danger" id="sendbtn">
                    <i class="bi bi-check2-circle"></i> 선택하고 닫기
                </button>
            </div>
        </div>
    </div>
</div>
