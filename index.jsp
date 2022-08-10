

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 
	
        
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <section class="vh-100" style="background-color:lightslategray;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                  <h3>E-shop</h3><br>

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                <form action="confirm.jsp" class="mx-1 mx-md-4" method="post">
                    
                    <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-0">
                         <label class="form-label" for="form3Example1c">Enter the  User Name</label>
                      <input type="text" name="username" placeholder=" UserName" id="username" class="form-control" />
                     
                        </div>
                    </div>

                 
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                         <label class="form-label" for="form3Example3c">Enter Email</label>
                      <input type="email" name="email" placeholder="Email" id="email" class="form-control" />
                     
                    </div>
                  </div>
                     <h6 class="mb-0 me-4">Gender: </h6>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input class="form-check-input" type="radio" name="gender" id="femaleGender"
                      value="option1" />
                    <label class="form-check-label" for="femaleGender">FEMALE</label>
                  </div>

                  <div class="form-check form-check-inline mb-0 me-4">
                    <input class="form-check-input" type="radio" name="gender" id="maleGender"
                      value="option2" />
                    <label class="form-check-label" for="maleGender">MALE</label>
                  </div>
                     
                     <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                        <div class="form-outline flex-fill mb-0">
                         <label class="form-label" for="form3Example1c">Enter Location</label>
                      <input type="text" name="location" placeholder=" location" id="location" class="form-control" />
                        </div>
                    </div>
                    
                    <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                         <label class="form-label" for="form3Example4c">Enter Password</label>
                         <input type="password" name="password" placeholder="Password" id="password" class="form-control" />
                     
                    </div>
                    
                    <div class="form-outline flex-fill mb-0">
                         <label class="form-label" for="form3Example4c">Confirm Password</label>
                         <input type="confirm" name="confirm" placeholder="confirm" id="confirm" class="form-control" />
                     
                    </div>
                  </div>
                     
                     
                    
                   
                   
                 
                    <p class="text-center text-muted mt-5 mb-0">Have an account already ? <a href="Login.jsp"
                    class="fw-bold text-body"><u>Login here</u></a></p>

                    <br>

                 
                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                      <button><input type="submit" name="register" value="Register"  class="btn btn-primary btn-lg"></button>
                  </div>

                </form>

              </div>
                
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                 
              

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
        <!--Script Link  put before end of </body> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    </body>
</html>
