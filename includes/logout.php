<?php

    include_once 'sessioncontrol.php';

    $userSession = new SESSIONCONTROLLER();
    $userSession->closeSession();

    header("location: ../index.php");

?>