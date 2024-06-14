<?php

function selisih_hari($start_date, $end_date)
{
    $total_hari = 0;
    $period = new DatePeriod(
        new DateTime($start_date),
        new DateInterval('P1D'),
        new DateTime(date('Y-m-d', strtotime('+1 day', strtotime($end_date))))
    );

    foreach ($period as $p) {
        $date = $p->format('Y-m-d');
        $array = json_decode(file_get_contents("https://raw.githubusercontent.com/guangrei/APIHariLibur_V2/main/calendar.json"), true);

        if (isset($array[$date])) {
            //jika tanggal merah berdasarkan libur nasional
        } else if (date("D", strtotime($date)) === "Sun") {
            //jika Hari Minggu
        } else if (date("D", strtotime($date)) === "Sat") {
            //jika Hari Sabtu
        } else {
            //jika Bukan Tanggal Merah dan Libur Nasional
            $total_hari++;
        }
    }

    return $total_hari;
}