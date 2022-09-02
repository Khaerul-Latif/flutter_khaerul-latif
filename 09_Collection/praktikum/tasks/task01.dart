void main() async{
  Future<List<int>> fungsiList(List <int> listDatas, int pengali) async{
    List <int> datas = [];  
    for (int listData in listDatas) {
      datas.add(listData * pengali);
    }
    return datas;
  }
  List<int> newList = await fungsiList([1, 2, 3, 4], 5);
  print("Isi dari list = $newList");
}