abstract class Manusia {
  String nik, nama, alamat;
  Manusia(this.nik, this.nama, this.alamat);

  belajar();
}

class Mahasiswa extends Manusia {
  Mahasiswa(super.nik, super.nama, super.alamat);

  @override
  belajar() {
    print('Mahasiswa $nama dengan $nik beralamat di $alamat, sedang belajar');
  }

  void nikMhs() {
    print('12879173712893712');
  }

  void prodiMhs() {
    print('Teknik Informatika');
  }

  void ipkMhs() {
    print('3.1');
  }

  void jadwal() {
    print('senin - minggu');
  }

  void jadwalMhs() {
    print('Pemrograman Dasar');
  }
}

class Dosen extends Manusia {
  Dosen(super.nik, super.nama, super.alamat);

  @override
  belajar() {
    print('Dosen $nama dengan $nik beralamat di $alamat, sedang belajar');
  }

  void nidn() {
    print('12879173712893712');
  }

  void jabatanFung() {
    print('Asisten rektor');
  }

  void pangkat() {
    print('Epic');
  }

  void jadwalDsn() {
    print('Senin - Jumat');
  }
}

void main(List<String> args) {
  print('===============Object Mahasiswa===============');
  var mhs = Mahasiswa('31231231235321', 'Asep', 'Bekasi');
  mhs.nikMhs();
  mhs.ipkMhs();
  mhs.jadwal();
  mhs.prodiMhs();
  mhs.jadwalMhs();

  print('===============Object Dosen===============');
  var dsn = Dosen('321254663243', 'Budi', 'Jogja');
  dsn.jabatanFung();
  dsn.jadwalDsn();
  dsn.nidn();
  dsn.pangkat();

  List<Manusia> humans = [];
  humans.add(Mahasiswa('31231231235321', 'Asep', 'Bekasi'));
  humans.add(Dosen('321254663243', 'Budi', 'Jogja'));

  print('===============Object Dosen dan Mahasiswa===============');
  for (var human in humans) {
    human.belajar();
  }
}
