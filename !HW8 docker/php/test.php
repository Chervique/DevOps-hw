<html> 
<head> 
<h2>LEMP Stack Test</h2> 
</head> 
<body> 
<?php echo '<p>Hello,</p>';   
$servername = "192.168.0.13"; $username = "root"; $password = "123"; 

$conn = mysqli_connect($servername, $username, $password);  
if (!$conn) { 
exit('<p>Your connection has failed.<p>' . mysqli_connect_error()); 
} 
echo '<p>You have connected successfully.</p>'; ?> 


</body> 
</html>