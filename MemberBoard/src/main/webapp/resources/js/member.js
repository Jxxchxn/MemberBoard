function passwordCheck(){
    var mPW01 = $("#mPW01").val();
    var mPW02 = $("#mPW02").val();
    if(mPW01 != mPW02){
        $("#pwCheck").html("비밀번호가 서로 일치하지 않습니다.");
    } else {
        $("#pwCheck").html("");
        $("#mPW").val(mPW01);
    }   	
}
function goInsert(){
    var mAge = $("#mAge").val();
    if(mAge == null || mAge == "" || mAge == 0) {
        alert("나이를 확인해주세요.");
        return false;
    }
    document.frm.submit();
}