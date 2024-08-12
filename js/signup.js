$(document).ready(function() {
    $("#signup").click(function(){
        let name = $("#name").val();
        let email = $("#email").val();
        let phone = $("#phone").val();
        let address = $("#address").val();
        let password = $("#password").val();
        let Cpassword = $("#confirmPassword").val();
        var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

        var valid = true;

        if (name.trim().length == ""){
            $("#l_name").show();
            valid = false;
        } else {
            $("#l_name").hide();
        }

        if (!email.match(regex)){
            $("#l_email").show();
            valid = false;
        } else {
            $("#l_email").hide();
        }

        if (phone.trim().length == 0 || phone.length < 10 || isNaN(parseInt(phone))){
            $("#l_phone").show();
            valid = false;
        } else {
            $("#l_phone").hide();
        }

        if (address.trim().length == ""){
            $("#l_address").show();
            valid = false;
        } else {
            $("#l_address").hide();
        }

        if (password.trim().length < 7){
            $("#l_passowrd").show();
            valid = false;
        } else {
            $("#l_passowrd").hide();
        }

        if (Cpassword.trim().length < 7){
            $("#l_cpassword").show();
            valid = false;
        } else {
            $("#l_cpassword").hide();
        }

        if (Cpassword != password){
            $("#l_cpassword2").show();
            valid = false;
        } else {
            $("#l_cpassword2").hide();
        }
        
        return valid;
    })

})