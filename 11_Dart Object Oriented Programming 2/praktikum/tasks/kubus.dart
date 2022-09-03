import 'bangun_ruang.dart';

class Kubus extends bangunRuang {
  int sisi;

  Kubus(this.sisi);

  double volume() {
    return (sisi * sisi).toDouble();
  }
}

void main() {
  bangunRuang kubus = Kubus(10);
  print('Volume kubus dengan sisi 10 m adalah ${kubus.volume()} m');
}