<?php
include_once 'db.php';
class SESSIONCONTROLLER extends DB
{
    
    public function __construct()
    {
        session_start();
    }
    public function __initsession(){
        session_start();
    }

    public function setCurrentUser($user){
        $_SESSION['user'] = $user;
    }

    public function getCurrentUser(){
        return $_SESSION['user'];
    }

    public function closeSession(){
        session_unset();
        session_destroy();
    }
}

?>