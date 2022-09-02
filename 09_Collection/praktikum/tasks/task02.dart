void main () async{
  List<List<String>> foods = [
    ["Daerah Khusus Indonesia Jakarta", "Kerak Telor"],
    ["Tegal", "Nasi Lengko"]
  ];
  Map<String, String> newList = {};
  for (List<String> food in foods) {
    newList[food[0]] = food[1];
  }
  print(newList);
}