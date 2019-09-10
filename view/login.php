<?php
    header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1 
    header("Expires: Sat, 1 Jul 2000 05:00:00 GMT"); // Fecha en el pasado
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Last-Modified" content="0">
    <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
    <meta http-equiv="Pragma" content="no-cache">  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="Vos Dale Developers S.A | vosdaledevs@gmail.com | support@vosdaledevelopers.com">
    <meta name="description" content="Sofi Web Site for Statistics">
    <link rel="stylesheet" href="../css/GoogleSans.css">
    <link rel="stylesheet" href="../css/loginStyle.css">
    <title>Welcome to Sofi</title>
</head>
<body id="body">
    <div class="main">
        <div class="login">
            <img src="../img/Colgate_logo2019.png" alt="login image" id="loginimage">
            <form id="loginform" action="" method="POST">
            <label id="errormsg">
            <?php
                if(isset($errorLogin)) 
                {
                    echo $errorLogin;
                }
            ?>
            </label>
                <div>
                    <input class="tflogin" type="text" name="user" id="" placeholder="Username" required oninvalid="this.setCustomValidity('Please, enter a valid username.')"
                    oninput="setCustomValidity('')"><br> <br>
                </div> 
                <div>
                    <input class="tflogin" type="password" name="pass" id="" placeholder="Password" required oninvalid="this.setCustomValidity('Please, check your password is not wrong.')"
                    oninput="setCustomValidity('')"> <br> <br>
                    <input id="btnLogin" type="submit" value="Sign In">
                </div>
            </form>
            <label > <a  id="recover" href="">Recover Password</a></label>
        </div>
    </div>
</body>
</html>