<?php
include '../config/database.php';
include '../includes/header.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $prn = htmlspecialchars($_POST['prn']);
    $password = htmlspecialchars($_POST['password']);
    $name = htmlspecialchars($_POST['name']);
    $email = htmlspecialchars($_POST['email']);
    $address = htmlspecialchars($_POST['address']);


    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = "Invalid email format";
    } else {
        
        $query = "SELECT * FROM students WHERE prn = :prn AND password = :password";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':prn', $prn);
        $stmt->bindParam(':password', $password);
        $stmt->execute();

        
        if ($stmt->rowCount() > 0) {
            
            $updateQuery = "UPDATE students SET name = :name, email = :email, address = :address WHERE prn = :prn";
            $updateStmt = $pdo->prepare($updateQuery);
            $updateStmt->bindParam(':name', $name);
            $updateStmt->bindParam(':email', $email);
            $updateStmt->bindParam(':address', $address);
            $updateStmt->bindParam(':prn', $prn);
            
            if ($updateStmt->execute()) {
                $success = "Your details have been updated successfully.";
            } else {
                $error = "An error occurred while updating your details.";
            }
        } else {
            $error = "Invalid PRN or password.";
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> 

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>

<div class="container">
    <h1>Edit Your Details</h1>


    <?php if (isset($success)): ?>
        <div class="alert alert-success"><?= $success ?></div>
    <?php elseif (isset($error)): ?>
        <div class="alert alert-danger"><?= $error ?></div>
    <?php endif; ?>


    <form action="" method="POST" class="mt-4">
        <div class="form-group">
            <label for="prn">PRN:</label>
            <input type="text" class="form-control" name="prn" id="prn" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" name="password" id="password" required>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" name="name" id="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" name="email" id="email" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea class="form-control" name="address" id="address" rows="4" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update Details</button>
    </form>
</div>



</body>
</html>
<?php include '../includes/footer.php'; ?>
