<?php 
    include_once 'includes/user.php';
    include_once 'includes/sessioncontrol.php';
    $userSession = new SESSIONCONTROLLER();
    $user= new User();
    if (isset($_SESISON['user'])) 
    {
        $user->setUser($userSession->getCurrentUser());
        include_once '/view/dashboard.php';
    }
    elseif (isset($_POST['user']) && isset($_POST['pass'])) 
    {
        $userForm = $_POST['user'];
        $passForm = $_POST['pass'];
        if($user->login($userForm,$passForm))
        {
            //echo "Existe el usuario";
            $userSession->setCurrentUser($userForm);
            $user->setUser($userForm);
            include_once 'view/dashboard.php';
        }else{
            //echo "No existe el usuario";
            $errorLogin = "Nombre de usuario y/o password incorrecto <br> <br>";
            include_once 'view/login.php';
        }          
    }
    else
    {
        include_once 'view/login.php';
    }
?>
