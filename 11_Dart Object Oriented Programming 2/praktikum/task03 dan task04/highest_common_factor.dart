import 'matematika.dart';

class highestCommonFactor implements Matematika {
  int x, y;

  highestCommonFactor(this.x, this.y);

  @override
  hasil() {
    var hasil;
    for (var z = 1; z <= x; z++) {
      if (x % z == 0 && y % z == 0) {
        hasil = z;
      }
    }
    print('Kelipatan Persekutuan Terbesar dari bilangan $x dan bilangan $y adalah $hasil');
  }
}

void main(List<String> args) {
  Matematika operation = highestCommonFactor(5, 20);
  print(operation.hasil());
}