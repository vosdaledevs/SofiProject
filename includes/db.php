<?php
class DB
{
    private $host;
    private $db;
    private $user;
    private $pass;
    private $charset;
    private $options = [
        \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
        \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
        \PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    public function __construct()
    {
        $this->host='127.0.0.1:3306';
        $this->db='vosdaled_BDColgatePalmolive';
        $this->charset='utf8mb4';
    }
    public function ValidateCon($username)
    {
        if ($username == 'admin') 
        {
            $this->user='vosdaled_admin';
	    $this->pass='Queserinda7um@dre';
        } else {
            $this->user='vosdaled_mobile';
	    $this->pass='alg0s1mple';
        }
    }
    public function connect()
    {
        try 
        {
            $connection="mysql:host=".$this->host.";dbname=".$this->db.";charset=".$this->charset;
            $pdo=new \PDO($connection,$this->user,$this->pass,$this->options);
            return $pdo;
        } catch (\PDOException $e) 
        {
            print_r("Error during connection: ".$e->getMessage());   
        }
    }
}
?>