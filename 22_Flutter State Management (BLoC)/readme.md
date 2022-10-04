# (22) Flutter State Management (BLoC)
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Summary 
Section 22 ini saya belajar tentang Flutter State Management (BLoC), diantaranya:
1. Pertama kali untuk memahami Flutter BloC diharuskan untuk mengetahui apa itu BloC. BLOC (Business Logic Component) adalah suatu pattern architecture yang dikenalkan oleh Google pada tahun lalu. Dengan dimana ini merupakan cara untuk memisahkan bisnis components dengan logic yang memudahkan untuk membagi ke beberapa Dart aplikasi. Jadi dengan menggunakan architecture ini diharapkan dari sisi pengembangan akan lebih flexible bedasarkan kebutuhan masing – masing proses.
1. Declarative UI ialah UI Flutter yang bersifat declarative, Ui tersebut berfungsi untuk mencerminkan keadaan state saat ini.
2. State ialah perintah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori, ada 2 macam state yaitu
- Ephemeral state biasanya Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya.
- App state biasanya Digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget, contohnya: