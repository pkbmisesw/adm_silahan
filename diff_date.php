<?php
// //default time zone
date_default_timezone_set("Asia/Jakarta");

$start_date = '2021-03-19';
$end_date = '2021-03-24';

echo "Tanggal Mulai : " . $start_date . "<br>";
echo "Tanggal Akhir : " . $end_date . "<br>";
echo "Selisih : " . selisih_hari($start_date, $end_date) . " Hari <br>";
echo "Selisih hari dengan tidak menghitung hari Sabtu, Minggu, dan Libur Nasional";


//fungsi check tanggal merah
function selisih_hari($start_date, $end_date)
{
    $total_hari = 0;
    $period = new DatePeriod(
        new DateTime($start_date),
        new DateInterval('P1D'),
        new DateTime(date('Y-m-d', strtotime('+1 day', strtotime($end_date))))
    );

    foreach ($period as $period) {
        $date = $period->format('Y-m-d');
        $array = json_decode(file_get_contents("https://raw.githubusercontent.com/guangrei/Json-Indonesia-holidays/master/calendar.json"), true);

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