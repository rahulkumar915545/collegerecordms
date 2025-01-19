<?php
include '../config/database.php';
include '../includes/header.php';
?>

<div class="container">

    <?php

    $query = "
        SELECT 
            e.course_id,
            c.course_name,
            s.prn,
            s.name AS student_name,
            SUM(m.marks_received) AS total_marks
        FROM 
            students s
        JOIN 
            enrollment e ON s.prn = e.prn
        JOIN 
            marks m ON s.prn = m.prn
        JOIN 
            subjects sub ON m.subject_id = sub.subject_id
        JOIN 
            courses c ON e.course_id = c.course_id
        WHERE 
            m.semester_id IN (1, 2)
        GROUP BY 
            s.prn, s.name, e.course_id
        ORDER BY 
            e.course_id, total_marks DESC
    ";

    
    $stmt = $pdo->query($query);

    if ($stmt) {
        $students = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $course_id = $row['course_id'];
            if (!isset($students[$course_id])) {
                $students[$course_id] = [];
            }
            
            if (count($students[$course_id]) < 3) {
                $students[$course_id][] = $row;
            }
        }

        
        foreach ($students as $course_id => $topStudents) {
            echo "<h2>Top 3 Students for Course: {$topStudents[0]['course_name']}</h2>";
            echo "<table border='1'>";
            echo "<tr><th>PRN</th><th>Name</th><th>Total Marks</th></tr>";
            foreach ($topStudents as $student) {
                echo "<tr>
                    <td>{$student['prn']}</td>
                    <td>{$student['student_name']}</td>
                    <td>{$student['total_marks']}</td>
                </tr>";
            }
            echo "</table><br>";
        }
    } else {
        echo "Error: " . $pdo->errorInfo();
    }
    ?>
</div>

<?php include '../includes/footer.php'; ?>
