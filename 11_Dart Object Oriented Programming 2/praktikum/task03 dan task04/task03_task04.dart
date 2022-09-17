abstract class Matematika {
  hasil();
}

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
    print(
        'Kelipatan Persekutuan Terbesar dari bilangan $x dan bilangan $y adalah $hasil');
  }
}

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
    print(
        'Kelipatan Persekutuan Terkecil dari bilangan $x dan bilangan $y adalah $hasil');
  }
}

void main(List<String> args) {
  List<Matematika> data = [];
  data.add(lowestCommonMultiple(5, 20));
  data.add(highestCommonFactor(5, 20));
  for (var operation in data) {
    print(operation.hasil());
  }
}
