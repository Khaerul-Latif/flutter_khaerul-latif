import 'main.dart';

class Kubus extends BangunRuang {
  int sisi;

  Kubus(this.sisi);

  double volume() {
      return (sisi*sisi).toDouble();
  }
}

void main (){
  BangunRuang kubus = Kubus(10);
  print(kubus.volume());
}