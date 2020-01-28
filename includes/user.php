<?php
include_once 'db.php';
class User extends DB
{
    private $user="NaN"; 
    private $pass="NaN";
    private $Name="NaN";
    private $LastName="NaN";
    private $role="NaN";

    public function login($userForm,$passForm)
    {
        $this->user=$userForm;
        $this->pass=$passForm;
        $this->ValidateCon($this->user,$this->pass);
        $query = $this->connect()->prepare('CALL AskUser(:user,:pass);');
        $query->execute([':user' => $userForm, ':pass' => $passForm]);

        if($query->rowCount()){
            return true;
        }else{
            return false;
        }
    }
    public function setUser($user)
    {
        $query = $this->connect()->prepare('Select Users.FirstName, Users.LastName, Role.NameRole from Users INNER JOIN UserRole on Users.Username=UserRole.FKUsername INNER JOIN Role on UserRole.FKRole=Role.PKRole WHERE Users.Username=:user;');
        $query->execute([':user' =>$user]);
        
        foreach ($query as $currentUser) {
            $this->Name = $currentUser['FirstName'];
            $this->LastName= $currentUser['LastName'];
            $this->role=$currentUser['NameRole'];
        }
    }
    public function getNombre(){
        return $this->Name;
    }
}
?>                  