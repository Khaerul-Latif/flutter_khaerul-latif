void main() {
  factorialValue(10);
  factorialValue(20);
  factorialValue(30);
}

void factorialValue(n) {
  int faktorial = 1;
  for (int i = 1; i <= n; i++) {
    faktorial *= i;
  }
  print("faktorial dari $n = $faktorial ");
}
