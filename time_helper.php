<?php

function timeAgo($datetime)
{
    date_default_timezone_set("Asia/Ho_Chi_Minh");

    $time = strtotime($datetime);
    $current = time();

    $diff = $current - $time;

    if ($diff < 60) {
        return "Vừa xong";
    }

    if ($diff < 3600) {
        return floor($diff / 60) . " phút trước";
    }

    if ($diff < 86400) {
        return floor($diff / 3600) . " giờ trước";
    }

    if ($diff < 2592000) {
        return floor($diff / 86400) . " ngày trước";
    }

    return date(
        "d/m/Y H:i",
        $time
    );
}