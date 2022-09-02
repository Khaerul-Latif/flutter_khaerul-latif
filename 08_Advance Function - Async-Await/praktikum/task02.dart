Future<List> listCap(List listData, int kali) {
  var data = [];
  int i = 0;
  int perkalian;
  do {
    perkalian = listData[i] * kali;
    data.add(perkalian);
    i++;
  } while (i < listData.length);
  return Future.delayed(Duration(seconds: 1), () {
    return data;
  });
}

void main() async {
  int kali = 5;
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var newList = await listCap(list, kali);

  print('Banyaknya list = ${list.length}');
  print('isi dari list = $list');
  print('isi dari list yang sudah dikalikan = $newList');
}
