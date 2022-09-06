# (09) Collection

## Data diri

Nomor Peserta : 1_013FLB_50 <br />
Nama : Khaerul Latif

## Summary

Section 9 ini saya belajar tentang Collection, diantaranya:

1. List digunakan untuk menyimpan banyak data. Data pada List disusun secara berurutan dan diakses menggunakan index.
2. Set digunakan untuk menyimpan banyak data secara unik, tidak ada duplikasi, tidak berurutan, dan tidak diindeks.
3. Map menyimpan banyak data dengan format pasangan key-value

## Task

### Task 01

1. Membuat sebuah fungsi dengan spesifikasi berikut:

- menerima 2 parameter, yaitu list data dan pengali,
- lakukan perulangan pada list data secara asynchronous,
- tiap perulangan, kalikan elemen list data dengan pengali,
- return list baru yang berisi hasil proses di atas.

![imgTask01](/09_Collection/praktikum/screenshoot/task01.png)

### Task 02

2. Membuat sebuah list dengan spesifikasi berikut & Membuat sebuah Map dengan menggunakan list tersebut!:

- tiap element-nya berupa list juga,
- tiap element wajib terdapat 2 data (sub-element).

![imgTask02](/09_Collection/praktikum/screenshoot/task02.png)

## 3 Latihan dari mentor

### Latihan 1

```dart
List data = [1,2,3,4,5]
```

variable data menyimpan 5 list

```dart
num result = 0;
for (int j = 0; j < data.length; j++) {
    result += data[j];
}
```

proses dimana mencari rata rata dari list yang ada di variable data, variable result menjadi penyimpan proses tersebut

### Latihan 2

```dart
List matrix = [
    [1, 2, 3, 4],
    [6, 7, 8, 9],
    [10, 11, 12, 13],
    [14, 15, 16, 17],
    [18, 19, 20, 21]
  ];
```
variable martix menyimpan list 5 x 4

```dart
(var i = 0; i < matrix.length; i++)
```
berikut adalah proses menghitung banyaknya list 1 dimensi pada variabel matrix

```dart
var sum = matrix[i][0];
var min = matrix[i][0];
var max = matrix[i][0];
```
varibale sum, min dan max bernilai 0 pada list 2 dimensi

```dart
(var j = 1; j < matrix[i].length; j++)
```
berikut adalah proses menghitung banyaknya list 2 dimensi pada variabel matrix
 ```dart
sum += matrix[i][j];
 ```
 proses menjumlahkan semua angka pada variabel matrix
```dart
(min > matrix[i][j])
```
proses mencari nilai minimum pada variabel matrix dengan membandingkan setiap barisnya

```dart
(max < matrix[i][j])
```
proses mencari nilai maksimal pada variabel matrix dengan membandingkan setiap barisnya

```dart
${sum / matrix[i].length}
```
proses mencari nilai rata rata dengan cara, jumlah setiap baris di bagi panjangnya  list pada variabel matrix

### Latihan 2
```dart
(args.length > 2)
```
proses dimana jika panjangnya args jika lebih dari 2 makan akan masuk ke proses berikutnya
```dart
final arg1 = double.tryParse(args[0]);
    final arg2 = double.tryParse(args[2]);
```
menetapkan variabel arg1 dan arg2 menjadi tipe data konstanta dan nilai dari 
- arg1 adalah args[0](arguments dengan index 0) lalu di konversi ke dalam tipe data double
- arg2 adalah args[2](arguments dengan index 2) lalu di konversi ke dalam tipe data double
```dart
(arg1 != null && arg2 != null)
```
proses dimana jika variabel arg1 dan arg2 tidak null(kosong)
```dart
if (args[1] == '+') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 + arg2}');
      } else if (args[1] == '-') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 - arg2}');
      } else if (args[1] == '/') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 / arg2}');
      } else if (args[1] == 'x') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 * arg2}');
```
proses dimana, jika args[1](arguments dengan index 1) di isi dengan string +, -, /, x