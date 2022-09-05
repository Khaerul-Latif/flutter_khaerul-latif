void main(List<String> args) {
  List data = [1,2,3,4,5];
  num result = 0;
  for (int j = 0; j < data.length; j++) {
    result += data[j];
  }
  print('Total Rata Rata $data adalah ${result / data.length}');
}