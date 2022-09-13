abstract class bangunRuang {
  int panjang, lebar, tinggi;
  bangunRuang(this.panjang, this.lebar, this.tinggi);
  volume();
}

class Balok extends bangunRuang {
  Balok(super.panjang, super.lebar, super.tinggi);

  @override
  volume() {
    print('Hasil Volume Baloknya adalah ${panjang * lebar * tinggi}');
  }
}

class Kubus extends bangunRuang {
  int sisi;

  Kubus(this.sisi) : super(0, 0, 0);

  @override
  volume() {
    print('Hasil Volume Kubusnya adalah ${sisi * sisi * sisi}');
  }
}

void main(List<String> args) {
  List<bangunRuang> data = [];
  data.add(Balok(2, 4, 5));
  data.add(Kubus(6));
  for (var bangun in data) {
    print(bangun.volume());
  }
}
