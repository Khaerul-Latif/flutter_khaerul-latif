void main() {
  decisionValue(79);
  decisionValue(46);
  decisionValue(1);
  decisionValue(-1);
}

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
