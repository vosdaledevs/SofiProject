<?php
    http_response_code(404);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/GoogleSans.css">
    <link rel="stylesheet" href="css/404.css">
    <title>¡Algo ha salido mal!</title>
</head>
<body>
    <div class="container">
        <div class="inner-container">
            <form action="../index.php" id="form">
                <h1>Error 404</h1>
                <p>La pagina que estas buscando, no fue encontrada.</p>
                <input type="submit" value="Regresar a la pagina de inicio." class="back">
            </form>
        </div>
    </div>
</body>
</html>