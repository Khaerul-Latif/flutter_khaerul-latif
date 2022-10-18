# (27) Finite State Machine & Unit Testing
## Data diri 
Nomor Peserta : 1_013FLB_50  <br />
Nama Peserta : Khaerul Latif

## Summary 
Section 27 ini saya belajar tentang Finite State Machine & Unit Testing, diantaranya:
1. Finite State Machine, merupakan mesin yang memiliki jumlah state dan tiap statenya menunjukkan apa yang terjadi sebelumnya.
Contoh:
terdapat 3 state yang menunjukkan kejadian dalam suatu proses.

- IDDLE saat tidak terjadi proses
- RUNNING saat proses sedang berjalan
- ERROR saat proses gagal diselesaikan

Contoh sukses:

- IDDLE berubah menjadi RUNNING saat proses berjalans
- RUNNING kembali menjadi IDDLE saat proses selesai

Contoh gagal:

- IDDLE berubah menjadi RUNNING saat proses berjalan
- RUNNING menjadi ERROR saat terjadi kegagalan
- ERROR kembali menjadi IDDLE

2. Unit Test, merupakan salah satu jenis pengujian pada perangkat lunak, pengujian tersebut dilakukan pada unit dalam perangkat lunak. Unit yang dimaksud umummnya adalah fungsi atau method. tujuan unit test adalah untuk memastikkan fungsi dapat mengolah berbagai jenis input. memastikan hasil dari suatu fungsi atau method sudah sesuai

3. Mocking, merupakan proses yang terikat dengan sistem eksternal dapat mempengaruhi berjalannya pengujian, Pengaruh tersebut dapat menggangu proses pengujian. dilakukan mocking untuk menghindari masalah-masalh tersebut.
Cara kerja mocking:

- suatu objek dibuat bentuk tiruannya
- Bentuk tiruan tersebut memiliki input dan output yang sama dengan yang asli
- Bentuk tiruan menghilangkan ketergantungan pada sistem eksternal