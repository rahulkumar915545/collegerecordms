<?php
include '../config/database.php'; 

$course_id = isset($_GET['course_id']) ? intval($_GET['course_id']) : 0;

$response = ['subjects' => []];

if ($course_id > 0) {
   
    $query = "SELECT subject_id AS id, subject_name AS name 
              FROM subjects 
              WHERE subject_id BETWEEN :start_id AND :end_id";
    
    
    $ranges = [
        1 => [1, 5], 
        2 => [6, 10], 
        3 => [11, 15],
        4 => [16, 20], 
        5 => [21, 25], 
    ];

    
    if (isset($ranges[$course_id])) {
    
        $stmt = $pdo->prepare($query);

        
        $stmt->bindParam(':start_id', $ranges[$course_id][0], PDO::PARAM_INT);
        $stmt->bindParam(':end_id', $ranges[$course_id][1], PDO::PARAM_INT);

        
        $stmt->execute();


        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $response['subjects'][] = $row;
        }
    }
}

header('Content-Type: application/json');
echo json_encode($response);
?>
