<?php
include '../config/database.php';
include '../includes/header.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $prn = htmlspecialchars($_POST['prn']);
    $roll = htmlspecialchars($_POST['roll']);
    
    $query = "
    SELECT s.name, s.roll, s.prn, c.course_name, sub.subject_name, 
           m.marks_received, m.total_marks, m.semester_id,
           (m.marks_received / m.total_marks) * 100 AS percentage
    FROM students s
    LEFT JOIN marks m ON s.prn = m.prn
    LEFT JOIN enrollment e ON s.prn = e.prn
    LEFT JOIN courses c ON e.course_id = c.course_id
    LEFT JOIN subjects sub ON m.subject_id = sub.subject_id
    WHERE s.prn = :prn AND s.roll = :roll
    ORDER BY m.semester_id, c.course_name, sub.subject_name;
    ";

    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':prn', $prn);
    $stmt->bindParam(':roll', $roll);
    $stmt->execute();
    
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $semester1Results = [];
    $semester2Results = [];
    $totalMarksSemester1 = 0;
    $totalMarksObtainedSemester1 = 0;
    $totalMarksSemester2 = 0;
    $totalMarksObtainedSemester2 = 0;

    foreach ($results as $result) {
        if ($result['semester_id'] == 1) {
            $semester1Results[] = $result;
            $totalMarksSemester1 += $result['total_marks'];
            $totalMarksObtainedSemester1 += $result['marks_received'];
        } elseif ($result['semester_id'] == 2) {
            $semester2Results[] = $result;
            $totalMarksSemester2 += $result['total_marks'];
            $totalMarksObtainedSemester2 += $result['marks_received'];
        }
    }

    $percentageSemester1 = $totalMarksSemester1 ? ($totalMarksObtainedSemester1 / $totalMarksSemester1) * 100 : 0;
    $percentageSemester2 = $totalMarksSemester2 ? ($totalMarksObtainedSemester2 / $totalMarksSemester2) * 100 : 0;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <h1>Enter Student Details</h1>
    
    <form action="" method="POST" enctype="multipart/form-data">
        <div class="form-group">
            <label for="prn">PRN:</label>
            <input type="text" class="form-control" name="prn" id="prn" required>
        </div>
        <div class="form-group">
            <label for="roll">Roll Number:</label>
            <input type="text" class="form-control" name="roll" id="roll" required>
        </div>
        <div class="form-group">
            <label for="photo">Upload Photo:</label>
            <input type="file" class="form-control" name="photo" id="photo" accept="image/*">
        </div>
        <br>
        <button type="submit" class="btn btn-primary">View Results</button>
    </form>

    <?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
        <?php if (!empty($semester1Results)): ?>
            <h2>Semester 1 Results for PRN: <?= htmlspecialchars($prn) ?>, Roll: <?= htmlspecialchars($roll) ?></h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Subject Name</th>
                        <th>Marks Received</th>
                        <th>Total Marks</th>
                        <th>Percentage</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($semester1Results as $result): ?>
                        <tr>
                            <td><?= htmlspecialchars($result['course_name']) ?></td>
                            <td><?= htmlspecialchars($result['subject_name']) ?></td>
                            <td><?= htmlspecialchars($result['marks_received']) ?></td>
                            <td><?= htmlspecialchars($result['total_marks']) ?></td>
                            <td><?= number_format($result['percentage'], 2) ?>%</td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            
            <h3>Total Marks Obtained in Semester 1: <?= $totalMarksObtainedSemester1 ?> / <?= $totalMarksSemester1 ?> (<?= number_format($percentageSemester1, 2) ?>%)</h3>
        <?php endif; ?>

        <?php if (!empty($semester2Results)): ?>
            <h2>Semester 2 Results for PRN: <?= htmlspecialchars($prn) ?>, Roll: <?= htmlspecialchars($roll) ?></h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Subject Name</th>
                        <th>Marks Received</th>
                        <th>Total Marks</th>
                        <th>Percentage</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($semester2Results as $result): ?>
                        <tr>
                            <td><?= htmlspecialchars($result['course_name']) ?></td>
                            <td><?= htmlspecialchars($result['subject_name']) ?></td>
                            <td><?= htmlspecialchars($result['marks_received']) ?></td>
                            <td><?= htmlspecialchars($result['total_marks']) ?></td>
                            <td><?= number_format($result['percentage'], 2) ?>%</td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            
            <h3>Total Marks Obtained in Semester 2: <?= $totalMarksObtainedSemester2 ?> / <?= $totalMarksSemester2 ?> (<?= number_format($percentageSemester2, 2) ?>%)</h3>
        <?php endif; ?>

        <h2>Overall Results</h2>
        <h3>Total Marks Obtained: <?= $totalMarksObtainedSemester1 + $totalMarksObtainedSemester2 ?> / <?= $totalMarksSemester1 + $totalMarksSemester2 ?> (<?= number_format(($totalMarksObtainedSemester1 + $totalMarksObtainedSemester2) / ($totalMarksSemester1 + $totalMarksSemester2) * 100, 2) ?>%)</h3>
    <?php endif; ?>
</div>

</body>
</html>

<?php include '../includes/footer.php'; ?>