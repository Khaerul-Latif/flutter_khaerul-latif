import 'matematika.dart';

class lowestCommonMultiple implements Matematika {
  int x, y;

  lowestCommonMultiple(this.x, this.y);

  @override
  hasil() {
    var hasil;
    if (x > y) {
      hasil = x;
      x = y;
      y = hasil;
    }
    for (hasil = y; hasil % x != 0 || hasil % y != 0; hasil++) {
      return hasil;
    }
    print('Kelipatan Persekutuan Terkecil dari bilangan $x dan bilangan $y adalah $hasil');
  }
}
void main(List<String> args) {
  Matematika operation = lowestCommonMultiple(5, 20);
  print(operation.hasil());
}