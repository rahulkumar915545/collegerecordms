<?php
include '../config/database.php';
include '../includes/header.php';
?>

<div class="container">
    <h1>Courses and Subjects</h1>
    <form method="POST" action="../api/get_subjects.php">
        <label for="courseDropdown">Select Course:</label>
        <select id="courseDropdown" name="course" class="form-control">
            <option value="" disabled selected>-- Select a Course --</option>
            <option value="1">Computer Science</option>
            <option value="2">Mechanical Engineering</option>
            <option value="3">Civil Engineering</option>
            <option value="4">Electrical Engineering</option>
            <option value="5">Mathematics</option>
        </select>
    </form>

    <div id="subjectList" class="mt-3">
       
    
    </div>
</div>

<script>

document.getElementById('courseDropdown').addEventListener('change', function() {
    const courseId = this.value;
    const subjectList = document.getElementById('subjectList');

    fetch(`../api/get_subjects.php?course_id=${courseId}`)
        .then(response => response.json())
        .then(data => {
            subjectList.innerHTML = '';

            if (data.subjects && data.subjects.length > 0) {
                const ul = document.createElement('ul');
                data.subjects.forEach(subject => {
                    const li = document.createElement('li');
                    li.textContent = `${subject.name}`;
                    ul.appendChild(li);
                });
                subjectList.appendChild(ul);
            } else {
                subjectList.textContent = 'No subjects available for this course.';
            }
        })
        .catch(error => {
            console.error('Error fetching subjects:', error);
            subjectList.textContent = 'An error occurred while fetching subjects.';
        });
});
</script>

<?php include '../includes/footer.php'; ?>

