<?php
// Initialize the session
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
 header("location: Facultypage.html");
  exit;
}
 
// Include config file
require_once "config.php";
 
// Define variables and initialize with empty values
$username = $password = "";
$username_err = $password_err = "";
$cisca="1234";
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    // Check if username is empty
    if(empty(trim($_POST["username"]))){
        $username_err = "Please enter username.";
    } else{	
        $username = trim($_POST["username"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";
    } else{
        $password = trim($_POST["password"]);
    }
    
    // Validate credentials
    if(empty($username_err) && empty($password_err)){
        // Prepare a select statement
        $sql = "SELECT Username,Password FROM login WHERE Username = ?";
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt,"s", $param_username);
            
            // Set parameters
            $param_username = $username;
          // echo $cisca;
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                // Store result
				// echo $cisca;
                mysqli_stmt_store_result($stmt);
                // Check if username exists, if yes then  verify password
				// echo $cisca;
                if(mysqli_stmt_num_rows($stmt) == 1){                    
                    // Bind result variables
					// echo $cisca;
                   mysqli_stmt_bind_result($stmt,$username,$hashed_password);
                    if(mysqli_stmt_fetch($stmt)){
                        if($password===$hashed_password){
                            // Password is correct, so start a new session
							
                            session_start();
                            
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
							//$_SESSION["Index"] = $Index;
                            $_SESSION["username"] = $username;                            
                            // Redirect user to welcome page
                          header("location: Facultypage.html");
                        } 
						else{
                            $password_err = "<br>The password you entered was not valid.";
                        }
                    }
                } else{
                    $username_err = "<br>No account found with that username.";
                }
            } else{
                echo "<br>Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }
    
    // Close connection
    mysqli_close($link);
}
?>
