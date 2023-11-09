<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <!-- Favicon -->
    <link rel="shortcut icon" href="./assets/favicon/favicon.ico" type="image/x-icon" />
    
    <!-- Libs CSS -->
    <link rel="stylesheet" href="./assets/css/libs.bundle.css" />
    
    <!-- Theme CSS -->
    <link rel="stylesheet" href="./assets/css/theme.bundle.css" />
    
    <!-- Title -->
    <title>Ssj</title>
</head>
<body class="bg-light">
 	<c:import url="/WEB-INF/views/header4.jsp"/>
 	
    <!-- MODALS -->
<!--     {{> partials/modals}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar-topbar classList="bg-light"}} -->

    <!-- NAVBAR -->
<!--     {{> navbars/navbar classList="bg-white"}} -->
 	
     <!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-6" style="float: none; margin:0 auto;">

            <!-- Card -->
            <div class="card card-lg mb-10 mb-md-0">
              <div class="card-body">

                <!-- Heading -->
                <h6 class="mb-7">로그인</h6>

                <!-- Form -->
                <form action="login" method="post">
                  <div class="row">
                    
                    <div class="col-12">
                      <!-- Email -->
                      <div class="form-group">
                        <label class="visually-hidden" for="loginEmail">
                         ID *
                        </label>
                        <input class="form-control form-control-sm" id="loginEmail" type="text"  name="user_id"  placeholder="ID *" required>
                      </div>
                    </div>
                   
					<div class="col-12">
                      <!-- Password -->
                      <div class="form-group">
                        <label class="visually-hidden" for="loginPassword">
                          Password *
                        </label>
                        <input class="form-control form-control-sm" id="loginPassword" type="password" name="user_pswd" placeholder="Password *" required>
                      </div>
                    </div>
                   
                    <div class="col-12 col-md">
                      <!-- Remember -->
                      <div class="form-group">
                        <div class="form-check">
                          <input class="form-check-input" id="loginRemember" type="checkbox">
                          <label class="form-check-label" for="loginRemember">
                            Remember me
                          </label>
                        </div>
                      </div>
                    </div>
                   
                    <div class="col-12 col-md-auto">

                      <!-- Link -->
                      <div class="form-group">
                        <a class="fs-sm text-reset" data-bs-toggle="modal" href="#modalPasswordReset">Forgot Password?</a>
                      </div>

                    </div>
                    <div class="col-12">

                      <!-- Button -->
                      <button class="btn btn-sm btn-dark" type="submit">
                        	로그인
                      </button>
					  
                    </div>
                  </div>
                </form>

              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
    <c:import url="/WEB-INF/views/footer.jsp"/>


    <!-- JAVASCRIPT -->
    {{> partials/scripts}}

  </body>
	
</html>