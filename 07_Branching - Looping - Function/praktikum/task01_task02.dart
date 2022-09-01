void main() {
  // Task 01
  print('Task 01');
  decisionValue(79);
  decisionValue(46);
  decisionValue(1);
  decisionValue(-1);
  print('');
  print('Task 02');
  //Task 02
  calculateFactorial(10);
  calculateFactorial(20);
  calculateFactorial(30);
}

// Fungsi menentukan nilai
void decisionValue(n) {
  var value = '';
  if (n > 70) {
    value = 'A';
  } else if (n > 40) {
    value = 'B';
  } else if (n > 0) {
    value = 'C';
  } else {
    value = 'kosong';
  }
  print('jika nilai $n, akan mendapatkan $value');
}

// Fungsi menghitung faktorial
void calculateFactorial(n) {
  double faktorial = 1;
  for (int i = 1; i <= n; i++) {
    faktorial *= i;
  }
  print("faktorial dari $n = $faktorial ");
}
