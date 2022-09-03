import 'main.dart';

class Balok extends BangunRuang {
  int panjang;
  int lebar ;
  int tinggi;

  Balok(this.panjang, this.lebar, this.tinggi);

  double volume() {
      return (panjang*lebar*tinggi).toDouble();
  }
}

void main (){
  BangunRuang balok = Balok(10, 8, 6);
  print(balok.volume());
}