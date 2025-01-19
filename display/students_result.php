<?php
include '../config/database.php';
include '../includes/header.php';  

$query = "
    SELECT c.course_name, s.name, s.roll, s.prn, s.email, s.address,
           SUM(CASE WHEN m.semester_id = 1 THEN m.marks_received ELSE 0 END) AS semester_1_marks,
           SUM(CASE WHEN m.semester_id = 1 THEN m.total_marks ELSE 0 END) AS semester_1_total,
           SUM(CASE WHEN m.semester_id = 2 THEN m.marks_received ELSE 0 END) AS semester_2_marks,
           SUM(CASE WHEN m.semester_id = 2 THEN m.total_marks ELSE 0 END) AS semester_2_total,
           (SUM(CASE WHEN m.semester_id = 1 THEN m.marks_received ELSE 0 END) / SUM(CASE WHEN m.semester_id = 1 THEN m.total_marks ELSE 0 END)) * 100 AS semester_1_percentage,
           (SUM(CASE WHEN m.semester_id = 2 THEN m.marks_received ELSE 0 END) / SUM(CASE WHEN m.semester_id = 2 THEN m.total_marks ELSE 0 END)) * 100 AS semester_2_percentage
    FROM students s
    LEFT JOIN marks m ON s.prn = m.prn
    LEFT JOIN enrollment e ON s.prn = e.prn
    LEFT JOIN courses c ON e.course_id = c.course_id
    GROUP BY c.course_id, s.prn
    ORDER BY FIELD(c.course_name, 'Computer Science', 'Mechanical Engineering', 'Civil Engineering', 'Electrical Engineering', 'Mathematics'),
             s.roll ASC";

$stmt = $pdo->prepare($query);
$stmt->execute();

$students = $stmt->fetchAll(PDO::FETCH_ASSOC);

function getStudentStatus($marks_received, $total_marks) {
    if ($marks_received === null || $total_marks === null) {
        return 'Absent';
    }
    return ($marks_received / $total_marks) * 100 >= 40 ? 'Pass' : 'Fail';
}
?>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>

<div class="container">
    <h1>Results</h1>

    <?php
    $currentCourse = '';
    foreach ($students as $student):
        if ($student['course_name'] !== $currentCourse):
            if ($currentCourse !== ''):
                echo '</tbody></table>';
            endif;

            $currentCourse = $student['course_name'];
            echo "<h2>$currentCourse</h2>";
            echo "<table class='table table-striped' id='" . strtolower(str_replace(" ", "_", $currentCourse)) . "_table'>
                    <thead class='sticky-header'>
                        <tr>
                            <th onclick='sortTable(0, \"$currentCourse\")'>Roll No <i class='bi bi-sort'></i></th>
                            <th onclick='sortTable(1, \"$currentCourse\")'>Name <i class='bi bi-sort'></i></th>
                            <th>PRN</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th onclick='sortTable(2, \"$currentCourse\")'>Semester 1 Total Marks <i class='bi bi-sort'></i></th>
                            <th onclick='sortTable(3, \"$currentCourse\")'>Semester 1 Percentage <i class='bi bi-sort'></i></th>
                            <th onclick='sortTable(4, \"$currentCourse\")'>Semester 2 Total Marks <i class='bi bi-sort'></i></th>
                            <th onclick='sortTable(5, \"$currentCourse\")'>Semester 2 Percentage <i class='bi bi-sort'></i></th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>";
        endif;

        $semester_1_status = getStudentStatus($student['semester_1_marks'], $student['semester_1_total']);
        $semester_2_status = getStudentStatus($student['semester_2_marks'], $student['semester_2_total']);
        $statusColor1 = $semester_1_status === 'Pass' ? 'green' : 'red';
        $statusColor2 = $semester_2_status === 'Pass' ? 'green' : 'red';
        ?>

        <tr>
            <td><?= htmlspecialchars($student['roll']) ?></td>
            <td><?= htmlspecialchars($student['name']) ?></td>
            <td><?= htmlspecialchars($student['prn']) ?></td>
            <td><?= htmlspecialchars($student['email']) ?></td>
            <td><?= htmlspecialchars($student['address']) ?></td>
            <td><?= htmlspecialchars($student['semester_1_marks']) ?> / <?= htmlspecialchars($student['semester_1_total']) ?></td>
            <td><?= number_format($student['semester_1_percentage'], 2) ?>%</td>
            <td><?= htmlspecialchars($student['semester_2_marks']) ?> / <?= htmlspecialchars($student['semester_2_total']) ?></td>
            <td><?= number_format($student['semester_2_percentage'], 2) ?>%</td>
            <td>
                <span style="color: <?= $statusColor1 ?>;"><?= $semester_1_status ?></span><br>
                <span style="color: <?= $statusColor2 ?>;"><?= $semester_2_status ?></span>
            </td>
        </tr>

    <?php endforeach; ?>
    </tbody>
    </table>
</div>

<script>
let sortOrder = {};

function sortTable(columnIndex, courseName) {
    const tableId = courseName.toLowerCase().replace(/\s+/g, '_') + '_table';
    const table = document.getElementById(tableId);
    const rows = Array.from(table.rows).slice(1);

    if (!sortOrder[tableId]) sortOrder[tableId] = {};
    sortOrder[tableId][columnIndex] = !sortOrder[tableId][columnIndex];

    rows.sort((a, b) => {
        const aText = a.cells[columnIndex].innerText.trim();
        const bText = b.cells[columnIndex].innerText.trim();
        const aValue = isNaN(aText) ? aText : parseFloat(aText);
        const bValue = isNaN(bText) ? bText : parseFloat(bText);

        return (aValue < bValue ? -1 : aValue > bValue ? 1 : 0) * (sortOrder[tableId][columnIndex] ? 1 : -1);
    });

    rows.forEach(row => table.tBodies[0].appendChild(row));

    updateArrows(columnIndex, tableId);
}

function updateArrows(columnIndex, tableId) {
    const headers = document.querySelectorAll(`#${tableId} th`);
    headers.forEach((header, idx) => {
        const arrow = header.querySelector('i');
        if (arrow) {
            if (idx === columnIndex) {
                arrow.className = sortOrder[tableId][columnIndex] ? 'bi bi-sort-up' : 'bi bi-sort-down';
            } else {
                arrow.className = 'bi bi-sort';
            }
        }
    });
}
</script>

<style>
    .sticky-header {
        position: sticky;
        top: 0;
        background-color: #fff;
        z-index: 1;
    }
</style>

<?php include '../includes/footer.php'; ?>
