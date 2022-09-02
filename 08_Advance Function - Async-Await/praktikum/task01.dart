Future<Map> soal(List listNusantara) {
  int i = 0;
  var capital = new Map();

  do {
    capital[i] = {listNusantara[i][0], listNusantara[i][0]};
    i++;
  } while (i < listNusantara.length);
  return Future.delayed(Duration(seconds: 1), () {
    return capital;
  });
}

void main() async {
  var listNusantara = [
    ["Aceh", "Banda Aceh"],
    ["Sumatera Utara", "Medan"],
    ["Sumatera Barat", "Padang"],
    ["Riau", "Pekanbaru"],
    ["Sumatera Selatan", "Palembang"],
    ["Bengkulu", "Kota Bengkulu"],
    ["Lampung", "Bandar Lampung"],
    ["Kepulauan Bangka Belitung", "PangkalPinang"],
    ["Kepulauan Riau", "Palembang"],
    ["Daerah Khusus Ibukota Jakarta", "Jakarta"]
  ];

  var newList = await soal(listNusantara);

  print('Banyaknya List Nusantara = ${listNusantara.length}');
  print('Isi dari List Nusantara = $listNusantara');
  print('Banyaknya List Baru Nusantara = ${newList.length}');
  print('Isi dari List baru Nusantara yang sudah di sub-element = $newList');
}
