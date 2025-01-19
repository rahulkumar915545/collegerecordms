<?php
include '../config/database.php';
include '../includes/header.php';  

$courseQuery = "SELECT course_id, course_name FROM courses ORDER BY course_name";
$courseStmt = $pdo->prepare($courseQuery);
$courseStmt->execute();
$courses = $courseStmt->fetchAll(PDO::FETCH_ASSOC);


function getStudentsByCourse($courseId, $pdo) {
    $query = "
        SELECT 
            s.roll, s.name, s.prn, sub.subject_name, m.semester_id,
            m.marks_received, m.total_marks
        FROM students s
        LEFT JOIN enrollment e ON s.prn = e.prn
        LEFT JOIN marks m ON s.prn = m.prn
        LEFT JOIN subjects sub ON m.subject_id = sub.subject_id
        WHERE e.course_id = :courseId
        ORDER BY s.roll ASC, sub.subject_name ASC, m.semester_id ASC";
    
    $stmt = $pdo->prepare($query);
    $stmt->execute(['courseId' => $courseId]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


$selectedCourseId = isset($_POST['course']) ? $_POST['course'] : null;
$students = [];
if ($selectedCourseId) {
    $students = getStudentsByCourse($selectedCourseId, $pdo);
}
?>

<div class="container" >
    <h1>Student Marks by Course</h1>
    

    <form method="post" class="mb-3">
        <label for="course">Select Course:</label>
        <select name="course" id="course" class="form-select" onchange="this.form.submit()">
            <option value="">-- Choose a Course --</option>
            <?php foreach ($courses as $course): ?>
                <option value="<?= $course['course_id'] ?>" <?= $selectedCourseId == $course['course_id'] ? 'selected' : '' ?>>
                    <?= htmlspecialchars($course['course_name']) ?>
                </option>
            <?php endforeach; ?>
        </select>
    </form>


    <?php if ($selectedCourseId && $students): ?>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Roll No</th>
                    <th>Name</th>
                    <th>PRN</th>
                    <th>Subject</th>
                    <th>Semester</th>
                    <th>Marks Received</th>
                    <th>Total Marks</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($students as $student): ?>
                    <tr>
                        <td><?= htmlspecialchars($student['roll']) ?></td>
                        <td><?= htmlspecialchars($student['name']) ?></td>
                        <td><?= htmlspecialchars($student['prn']) ?></td>
                        <td><?= htmlspecialchars($student['subject_name']) ?></td>
                        <td><?= $student['semester_id'] == 1 ? 'Semester 1' : 'Semester 2' ?></td>
                        <td><?= htmlspecialchars($student['marks_received']) ?></td>
                        <td><?= htmlspecialchars($student['total_marks']) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php elseif ($selectedCourseId): ?>
        <p>No students enrolled in this course.</p>
    <?php endif; ?>
</div>

<?php include '../includes/footer.php'; ?>
