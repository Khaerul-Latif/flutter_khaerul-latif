import 'task01_hewan.dart';
import 'task01_kendaraan.dart';

void main() {
  Hewan kambing = new Hewan();
  kambing.beratHewan = 10;

  Hewan sapi = new Hewan();
  sapi.beratHewan = 100;

  Hewan ayam = new Hewan();
  ayam.beratHewan = -1;

  Hewan domba = new Hewan();
  domba.beratHewan = 12;

  Mobil mobilPengangkut = new Mobil();
  mobilPengangkut.kapasitas = 4;

  if (mobilPengangkut.kapasitas! > 1) {
    mobilPengangkut.tambahMuatan(kambing);
    mobilPengangkut.tambahMuatan(sapi);
    mobilPengangkut.tambahMuatan(ayam);
    mobilPengangkut.tambahMuatan(domba);
  }
  mobilPengangkut.totalMuatan();
}
