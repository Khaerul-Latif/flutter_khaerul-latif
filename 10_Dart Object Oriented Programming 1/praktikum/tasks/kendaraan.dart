import 'hewan.dart';

class Mobil {
  int? kapasitas;
  List<Hewan> muatan = [];

  void tambahMuatan(Hewan hewan) {
    muatan.add(hewan);
  }

  void totalMuatan() {
    print(muatan.length);
  }
}