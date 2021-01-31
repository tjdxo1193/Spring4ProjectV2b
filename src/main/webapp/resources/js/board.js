// list
$('#newbd').on('click', function (){
   location.href = "/board/write";
});
// view
$('#listbdbtn').on('click', function (){
    // location.href = '/board/list?cp=1';
    location.href = '/board/list?cp=' + $('#cp').val();
    // history.back();
});
$('#thumbbtn').on('click', function (){});

$('#upbdbtn').on('click', function (){
    if (confirm('정말로 이글을 수정하시겠습니까?'))
        let param = '?bno=' + $('#bno').val();
        param += "&cp=" + $('#cp').val();
        param += "&userid=" + $('#userid').val();
        location.href = '/board/update' + param;
});
$('#rmbdbtn').on('click', function (){
    if (confirm('정말로 이글을 삭제하시겠습니까?'))
        let param = '?bno=' + $('#bno').val();
        param += "&cp=" + $('#cp').val();
        param += "&userid=" + $('#userid').val();
        location.href = '/board/delete' + param;
});

// write
$('#newbdbtn').on('click', function (){
    if ($('#title').val() == '') alert('제목 작성하세요!')
    else if ($('#contents').val() == '') alert('본문 작성하세요!')
    else {
        $('#newbdfrm').attr("method", "post");
        $('#newbdfrm').attr("action", "/board/write");
        $('#newbdfrm').submit();
    }
});

//update
$('#upbdokbtn').on('click', function (){
    if (confirm('정말로 수정하시겠습니까?')) {
        $('#upbdfrm').attr('method', 'post');
        $('#upbdfrm').attr('action', '/board/update');
        $('#upbdfrm').submit();
    }
});