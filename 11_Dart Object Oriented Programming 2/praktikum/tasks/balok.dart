import 'bangun_ruang.dart';

class Balok extends bangunRuang {
  int panjang;
  int lebar;
  int tinggi;

  Balok(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return (panjang * lebar * tinggi).toDouble();
  }
}

void main() {
  bangunRuang balok = Balok(15, 5, 5);
  print('Volume balok dengan panjang 10 m, lebar 5 m dan tinggi 5 m adalah ${balok.volume()} m');
}