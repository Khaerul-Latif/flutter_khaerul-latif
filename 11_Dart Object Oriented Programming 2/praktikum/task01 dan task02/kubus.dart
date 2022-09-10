import 'bangun_ruang.dart';

class Kubus extends bangunRuang {
  int sisi;

  Kubus(this.sisi);

  @override
  double volume() {
    return (sisi * sisi).toDouble();
  }
}

void main() {
  bangunRuang kubus = Kubus(10);
  print(kubus.volume());
}