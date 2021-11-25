<html> 
<head> 
<h2>LEMP Stack Test</h2> 
</head> 
<body> 
<?php echo '<p>Hello,</p>'; // Define PHP variables for the MySQL connection.  
$servername = "192.168.0.13"; $username = "root"; $password = "123"; // Create a MySQL connection.  
$conn = mysqli_connect($servername, $username, $password); // Report if the connection fails or is successful.  

if (!$conn) { 
exit('<p>Your connection has failed.<p>' . mysqli_connect_error()); 
} 
echo '<p>You have connected successfully.</p>'; ?> 


</body> 
</html>