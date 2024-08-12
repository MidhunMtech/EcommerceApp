$(document).ready(function() {
    $("#login").click(function(){
        let email = $("#email").val();
        let password = $("#password").val();
        var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var valid = true;
        console.log("midhun");
        

        if (!email.match(regex)){
            $("#l_email").show();
            valid = false;
        } else {
            $("#l_email").hide();
        }

        if (password.trim().length < 7){
            $("#l_passowrd").show();
            valid = false;
        } else {
            $("#l_passowrd").hide();
        }

        return valid;
    })

})