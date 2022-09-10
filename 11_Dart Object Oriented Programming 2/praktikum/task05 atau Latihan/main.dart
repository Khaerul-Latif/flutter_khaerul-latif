class Hewan {
  String nama, jenis;
  Hewan(this.nama, this.jenis);

  void suara() {}
}

class Unggas extends Hewan {
  String keluarga;
  Unggas(super.nama, super.jenis, this.keluarga){
    print(
        '$nama termasuk unggas berjenis $jenis dan termasuk dalam keluarga $keluarga');
  }
}

class Kucing extends Hewan {
  Kucing(super.nama, super.jenis);

  void lari() {
    print(
        'Nama Kucing adalah $nama, kucing tersebut berjenis $jenis. sedang berjalan-jalan di area komplek');
  }

  @override
  void suara() {
    print('$nama bersuara meow. $nama kucing berjenis $jenis');
  }
}

class Burung extends Unggas {
  Burung(super.nama, super.jenis, super.keluarga);

  @override
  void suara() {
    print(
        '$nama sering berkicau. $nama termasuk burung berjenis $jenis dan termasuk dalam keluarga $keluarga');
  }
}

void main(List<String> args) {
  print('============ Objek Kucing============');
  var kucing = Kucing('Rio', 'Persia');
  kucing.suara();
  kucing.lari();
  
  print('============Objek Unggas============');
  var unggas = Unggas('Sri', 'Angsa', 'anatidae');

  print('============Objek Burung============');
  var burung = Burung('Chelsea', 'Cendrawasih', 'Paradisaeidae');
  burung.suara();
}
