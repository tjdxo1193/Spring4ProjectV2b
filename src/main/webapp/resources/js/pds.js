// write

$('#newpdbtn').on('click', function(){
    if( $('#title').val() == '') {
        alert('제목을 작성하세요.');
    } else if ($('#contents').val() == ''){
        alert('내용을 작성하세요.');
    } else if ( $('#fname1').val() == '') {
        alert('첨부파일을 작성하세요.');
    } else {
        $('#newpdfrm').attr('method', 'post');
        $('#newpdfrm').attr('enctype', 'multipart/form-data');
        $('#newpdfrm').attr('action', '/pds/writeok');
        $('#newpdfrm').submit();

    }
});