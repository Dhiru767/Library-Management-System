<?php
// member_guard.php

// Checks if the member has unpaid fines
function hasUnpaidFine($conn, $member_id) {
    $stmt = $conn->prepare("
        SELECT SUM(amount) AS total_fine
        FROM fines
        WHERE member_id = ? AND status = 'unpaid'
    ");
    $stmt->bind_param("i", $member_id);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
    return ($result['total_fine'] ?? 0) > 0;
}

// Checks if member reached borrow limit
function borrowLimitReached($conn, $member_id, $limit = 3) {
    $stmt = $conn->prepare("
        SELECT COUNT(*) AS total
        FROM borrow_records
        WHERE member_id = ? AND return_date IS NULL
    ");
    $stmt->bind_param("i", $member_id);
    $stmt->execute();
    $count = $stmt->get_result()->fetch_assoc()['total'];
    return $count >= $limit;
}

// Checks if member already reserved the book
function alreadyReserved($conn, $member_id, $book_id) {
    $stmt = $conn->prepare("
        SELECT id FROM reservations
        WHERE member_id = ? AND book_id = ? AND status = 'pending'
    ");
    $stmt->bind_param("ii", $member_id, $book_id);
    $stmt->execute();
    return $stmt->get_result()->num_rows > 0;
}

// Sends notification to member
function sendNotification($conn, $member_id, $message) {
    $stmt = $conn->prepare("
        INSERT INTO notifications (member_id, message)
        VALUES (?, ?)
    ");
    $stmt->bind_param("is", $member_id, $message);
    $stmt->execute();
}
