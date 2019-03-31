


function userValid()
 {
    var Name, pass, gender, conpass, EmailId, emailExp;

    Name = document.getElementById("txtUserId").value;
    gender = document.getElementById("ddlType").value;
    pass = document.getElementById("txtPass1").value;
    conpass = document.getElementById("txtPass2").value;
    EmailId = document.getElementById("txtmail").value;

    emailExp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;

    if (Name == '' && gender == 0 && pass == '' && conpass == '' && EmailId == '') 
    {

        alert( "Enter All Fields");
        return false;

    }
    if (Name == '')
     {
        alert( "Please Enter Login ID");

        return false;
    }
    if (gender == 0) 
    {

        alert( "Please Select gender");

        return false;
    }
    if (pass == '')
    {
        alert( "Please Enter Password");

        return false;
    }
    if (pass != '' && conpass == '') 
    {
        alert( "Please Confirm Password");

        return false;

    }
    if (pass != conpass) {
        alert( "Password not match");

        return false;

    }
    if (EmailId == '') {
alert( "Email Id Is Required");

        return false;
    }
    if (EmailId != '')
     {


        if (!EmailId.match(emailExp))
        {
            alert( "Invalid Email Id");

            return false;
        }
    }
    return true;
}

