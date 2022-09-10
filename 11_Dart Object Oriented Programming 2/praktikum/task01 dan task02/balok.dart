import 'bangun_ruang.dart';

class Balok extends bangunRuang {
  int panjang, lebar, tinggi;

  Balok(this.panjang, this.lebar, this.tinggi);

  @override
  double volume() {
    return (panjang * lebar * tinggi).toDouble();
  }
}

void main() {
  bangunRuang balok = Balok(15, 5, 5);
  print(balok.volume());
}
