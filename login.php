<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/loginStyle.css">
    <link rel="stylesheet" href="css/GoogleSans.css">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Last-Modified" content="0">
    <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
    <meta http-equiv="Pragma" content="no-cache">  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="Vos Dale Developers S.A | vosdaledevs@gmail.com | support@vosdaledevelopers.com">
    <meta name="description" content="Sofi Web Site for Statistics">
    <title>Welcome to Sofi</title>
</head>
<body id="body">
    <div class="main">
        <div class="login">
            <img src="img/Colgate_logo2019.png" alt="login image" id="loginimage">
            <form id="loginform" action="login.php" method="POST">
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