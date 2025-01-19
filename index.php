<?php
include 'config/database.php';
include 'includes/header.php';
?>
<header class="bg-light py-3 shadow-sm">
        <div class="container text-center">
            <h1 class="display-5 text-primary">Welcome to the College Management System</h1>
            <p class="lead text-secondary">Streamlining your academic journey with efficiency and ease.</p>
        </div>
    </header>
<div class="container" style="background-image: url('../collegerecordms/assets/images/college.jpg'); background-size: cover; background-position: center; height: 48vh;">
    
    <a href="display/courses.php" class="btn btn-primary">Courses</a>
    <a href="display/student_course.php" class="btn btn-info">Students</a>
    <a href="display/toppers.php" class="btn btn-secondary">Toppers</a>
    <a href="display/students_result.php" class="btn btn-info">Results</a>
    <a href="display/search_result.php" class="btn btn-info">Search Result</Search></a>
    <a href="display/edit.php" class="btn btn-info">Edit Profile</a>
</div>

<?php include 'includes/footer.php'; ?>