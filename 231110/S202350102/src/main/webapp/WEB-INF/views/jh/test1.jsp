<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- REVIEWS -->
    <section class="pt-9 pb-11" id="reviews">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Heading -->
            <h4 class="mb-10 text-center">Customer Reviews</h4>

            <!-- Header -->
            <div class="row align-items-center">
              <div class="col-12 col-md-auto">

                <!-- Dropdown -->
                <div class="dropdown mb-4 mb-md-0">

                  <!-- Toggle -->
                  <a class="dropdown-toggle text-reset" data-bs-toggle="dropdown" href="#">
                    <strong>Sort by: Newest</strong>
                  </a>

                  <!-- Menu -->
                  <div class="dropdown-menu mt-3">
                    <a class="dropdown-item" href="#!">Newest</a>
                    <a class="dropdown-item" href="#!">Oldest</a>
                  </div>

                </div>

              </div>
              <div class="col-12 col-md text-md-center">

                <!-- Rating -->
                <div class="rating text-dark h6 mb-4 mb-md-0" data-value="4">
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="rating-item">
                    <i class="fas fa-star"></i>
                  </div>
                </div>

                <!-- Count -->
                <strong class="fs-sm ms-2">Reviews (3)</strong>

              </div>
              <div class="col-12 col-md-auto">

                <!-- Button -->
                <a class="btn btn-sm btn-dark" data-bs-toggle="collapse" href="#reviewForm">
                  Write Review
                </a>

              </div>
            </div>

            <!-- New Review -->
            <div class="collapse" id="reviewForm">

              <!-- Divider -->
              <hr class="my-8">

              <!-- Form -->
              <form>
                <div class="row">
                  <div class="col-12 mb-6 text-center">

                    <!-- Text -->
                    <p class="mb-1 fs-xs">
                      Score:
                    </p>

                    <!-- Rating form -->
                    <div class="rating-form">

                      <!-- Input -->
                      <input class="rating-input" type="range" min="1" max="5" value="5">

                      <!-- Rating -->
                      <div class="rating h5 text-dark" data-value="5">
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                        <div class="rating-item">
                          <i class="fas fa-star"></i>
                        </div>
                      </div>

                    </div>

                  </div>
                  <div class="col-12 col-md-6">

                    <!-- Name -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewName">Your Name:</label>
                      <input class="form-control form-control-sm" id="reviewName" type="text" placeholder="Your Name *" required>
                    </div>

                  </div>
                  <div class="col-12 col-md-6">

                    <!-- Email -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewEmail">Your Email:</label>
                      <input class="form-control form-control-sm" id="reviewEmail" type="email" placeholder="Your Email *" required>
                    </div>

                  </div>
                  <div class="col-12">

                    <!-- Name -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewTitle">Review Title:</label>
                      <input class="form-control form-control-sm" id="reviewTitle" type="text" placeholder="Review Title *" required>
                    </div>

                  </div>
                  <div class="col-12">

                    <!-- Name -->
                    <div class="form-group">
                      <label class="visually-hidden" for="reviewText">Review:</label>
                      <textarea class="form-control form-control-sm" id="reviewText" rows="5" placeholder="Review *" required></textarea>
                    </div>

                  </div>
                  <div class="col-12 text-center">

                    <!-- Button -->
                    <button class="btn btn-outline-dark" type="submit">
                      Post Review
                    </button>

                  </div>
                </div>
              </form>

            </div>

          

          </div>
        </div>
      </div>
    </section>
</body>
</html>