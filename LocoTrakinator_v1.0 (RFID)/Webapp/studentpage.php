<?php
error_reporting(0);
$conn = mysqli_connect("localhost","root","","test");
$error=" ";
if(count($_POST)>0){
$id_no=$_POST[ID];
$sql="SELECT * FROM login where ID='$id_no'";
$result = mysqli_query($conn,$sql);
 if(mysqli_num_rows($result) > 0)
		$row = mysqli_fetch_array($result);  
 else 
		$error="Username Not Found";
}
?>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!--  CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

  <title>Loco Trackinator</title>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Loco Tracinator</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/about.html">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/contact.html">Contact-us</a>
        </li>
		<div class="mx-2">
        <a href="logout.php" type="button.php" class="btn btn-outline-success" >Log Out</a>		
      </div>
      </ul>
    </div>
  </nav>

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
          <h2>Know Students Location</h2>
        </div>
      </div>
      <div class="carousel-item">
        <img src="faculty.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h2>Know Faculty Location</h2>
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
  <div class="container marketing my-5 border rounded" style="background-color:rgba(124, 3, 30, 0.973)">
      <h3 style="color:white">Know Students Location</h3>
 <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <div class="form-row">
        <div class="form-group col-md-6">
        <input class="form-control mr-sm-2" name="ID" type="text" placeholder="Enter ID" aria-label="Search" value="<?php echo $error;?>">
        </div>
        <div class="form-group col-md-6">
        <button  class="btn btn-outline-light my-2 my-sm-0" style="color:white" type="submit">Search</button >
        </div>
    </div>
    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="name" style="color:white">Name</label>
      <input type="text" class="form-control" id="name" placeholder="Name" value="<?php echo $row["Username"]; ?>" readonly>
      </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
      <label for="ID" style="color:white">ID Number</label>
      <input type="text" class="form-control" id="ID" placeholder="1234" value="<?php echo $row["ID"]; ?>" readonly>
      </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
      <label for="Location" style="color:white">Location</label>
      <input type="text" class="form-control" id="Location" placeholder="block name or room number" value="<?php echo $row["Location"]; ?>" readonly>
    </div>
    </div>
  </form>
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