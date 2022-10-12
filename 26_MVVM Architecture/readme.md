# (26) MVVM Architecture
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Summary
Section 26 ini saya belajar tentang MVVM Architecture, diantaranya: 
1. REST API, singlkatan dari Representational State Transfer Application Programming Interface. merupakan arsitektural yang memisahkan tampilan dengan proses bisnis dan bagian tampilan dengan proses bisnis berkirim data melalui HTTP request

2. HTTP, merupakan protokol yang digunakan untuk berkirim data melalui internet, biasanya data tersebut berbentuk media web. adapun pola komunikasi HTTP dengan cara 1. client mengirim request, 2. Server mengolah dan membalas dengan memberi response. HTTP dibagi menjadi dua struktur yaitu:
- Struktur Request
   terdiri dari
   - URL, alamat halaman yang akan diases
   - Method(GET, POST, PUT, DELETE), Menunjukan aksi yang diinginkan
   - Header, Informasi tambahan terkait request yang dikirmkan
   - Body, Data yang disertakan bersama request
-  Struktur Response
   - Status Code, Kode yang mewakili keseluruhan response, baik sukses maupun gagal
   - Header, Informasi tambahan terkait response yang diberikan
   - Body, Data yang disertakan bersama response

3. Dio, sebagai HTTP client dan dimanfaatkan untuk melakukan REST API
seriaslisasi JSON
JSON merupakan singkatan dari JavaScript Object Notation. JSON adalah cara penulisan data dan umum digunakan pada REST API. JSON dibagi menjadi dua yaitu : 
- Serialisasi JSON
   mengubah struktur data ke bentuk JSON dan menggunakan fungsi jsonEncode dari package dart:convert
- Deserialisasi JSON
   mengubah bentuk JSON ke struktur data dan menggunakan fungis jsonDecode dari package dart:convert