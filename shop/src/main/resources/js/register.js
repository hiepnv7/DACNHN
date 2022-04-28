$(document).ready(function () {

    $("#submit").click(function () {
        successRegitry();

    });

});
function successRegitry() {
    $.ajax({
        url: "${base}/register",
        data: $('#regForm').serialize(),
        type: "POST",
        success: function(data) {
            swal("Thành công", "Đăng ký thành công","success");
            /*setTimeout(function() {
                swal({
                    title: "Thành công!",
                    text: "Đăng ký thành công!",
                    type: "success"
                }, function() {
                    window.location = "back-end/user/login";
                });
            }, 1000);*/
        },
        error: function(XMLHttpRequest, textStatus, errorThrown){}
    });
}