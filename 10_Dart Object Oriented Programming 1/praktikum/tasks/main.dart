import 'hewan.dart';
import 'kendaraan.dart';

void main() {
  Hewan kambing = Hewan();
  kambing.beratHewan = 50;

  Hewan sapi = Hewan();
  sapi.beratHewan = 100;

  Hewan ayam = Hewan();
  ayam.beratHewan = 10;

  Mobil mobilPengangkut = Mobil();
  mobilPengangkut.kapasitas = 3;

  if (mobilPengangkut.kapasitas! > 1) {
    mobilPengangkut.tambahMuatan(kambing);
    mobilPengangkut.tambahMuatan(sapi);
    mobilPengangkut.tambahMuatan(ayam);
  }

  mobilPengangkut.totalMuatan();
}