import 'hewan.dart';
import 'mobil.dart';

void main() {
  Hewan kambing = new Hewan();
  kambing.beratHewan = 10;

  Hewan sapi = new Hewan();
  sapi.beratHewan = 100;

  Hewan ayam = new Hewan();
  ayam.beratHewan = 2;

  Hewan domba = new Hewan();
  domba.beratHewan = 12;

  Mobil mobilPengangkut = new Mobil();
  mobilPengangkut.kapasitas = 5;

  if (mobilPengangkut.kapasitas! > 1) {
    mobilPengangkut.tambahMuatan(kambing);
    mobilPengangkut.tambahMuatan(sapi);
    mobilPengangkut.tambahMuatan(ayam);
    mobilPengangkut.tambahMuatan(domba);
        mobilPengangkut.tambahMuatan(domba);
  } else {
    print('Muatan di tolak');
  }
  mobilPengangkut.totalMuatan();
}
