<?php
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
 header("location: Facultypage.php");
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
		echo $username_err;
    } else{	
        $username = trim($_POST["username"]);
    }
    
    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $password_err = "Please enter your password.";
		echo $password_err;
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
                            // Redirect user to login page
                          header("location: Facultypage.php");
                        } 
						else{
                            $password_err = "The password you entered was not valid.";
							echo $password_err;
                        }
                    }
                } else{
                    $username_err = "No account found with that username.";
					echo $username_err;
                }
            } 
			else{
                echo "Oops! Something went wrong. Please try again later.";
            }

            // Close statement
            mysqli_stmt_close($stmt);
        }
    }
    // Close connection
    mysqli_close($link);
}
?>

<!--HTML-->
<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!--CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

  <title>Loco Trackinator</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="index.php">Loco Tracinator</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.html">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.html">Contact-us</a>
        </li>
      </ul>
      <div class="mx-2">
        <button class="btn btn-outline-success" data-toggle="modal" data-target="#loginmodal">Login</button>
      </div>
    </div>
  </nav>



<!-- Login Modal -->
<div class="modal fade" id="loginmodal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="loginmodalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginmodalLabel">Login to Loco-Trackinator</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
          <div class="form-group <?php echo (!empty($email_err)) ? 'has-error' : ''; ?>">
            <label for="exampleInputUsername">Username</label>
            <input type="text" class="form-control" name="username" id="exampleInputUsername" aria-describedby="UsernameHelp">
            <small id="UsernameHelp" class="form-text text-muted">We'll never share your Username with anyone else.</small>
          </div>
        <div class="form-group <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" name="password" id="exampleInputPassword1">
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="https://www.kluniversity.in/img/slider/NIRF-2020-Ranking.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h2 style="color:black;">Welcome to Loco-Trackinator</h2>
        </div>
      </div>
      <div class="carousel-item">
        <img src="students.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h2>Students Location</h2>
        </div>
      </div>
      <div class="carousel-item">
        <img src="faculty.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h2>Faculty Location</h2>
        </div>
      </div>
      <div class="carousel-item">
        <img src="map.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h2 style="color:black;">University Map</h2>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  <div class="container marketing my-5">
    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4" style="background-color:rgba(124, 3, 30, 0.973)">
        <img  src="girl.jpg" class="bd-placeholder-img rounded-circle mx-auto d-block" width="160" height="180">
        <h2 class="text-center" style="color:white">Students</h2>
        <p class="text-center" style="color:white">Students can find faculty location by entering respective ID</p>
      </div>
      <div class="col-lg-4" style="background-color:rgba(124, 3, 30, 0.973)">
        <img src="Teacher2.jpg" class="bd-placeholder-img rounded-circle mx-auto d-block" width="160" height="180">
        <h2 style="color:white" class="text-center">Faculty </h2>
        <p class="text-center" style="color:white">Faculty can find both students and faculty location by entering respective ID</p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4" style="background-color:rgba(124, 3, 30, 0.973)">
        <img src="management.jpg" class="bd-placeholder-img rounded-circle mx-auto d-block" width="160" height="180">
        <h2 style="color:white" class="text-center">Management</h2>
        <p class="text-center" style="color:white">Management can find both students and faculty location and can make required changes</p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
  </div>
    
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
    crossorigin="anonymous"></script>
</body>

</html>