void main(List<String> args) {
  List matrix = [
    [1, 2, 3, 4],
    [6, 7, 8, 9],
    [10, 11, 12, 13],
    [14, 15, 16, 17],
    [18, 19, 20, 21]
  ];

  for (var i = 0; i < matrix.length; i++) {
    var sum = matrix[i][0];
    var min = matrix[i][0];
    var max = matrix[i][0];
    for (var j = 1; j < matrix[i].length; j++) {
      sum += matrix[i][j];
      if (min > matrix[i][j]) {
        min = matrix[i][j];
      }
      if (max < matrix[i][j]) {
        max = matrix[i][j];
      }
    }

    print('Total nilai pada baris ke-${i + 1} ${matrix[i]}: $sum');
    print('Rata-rata nilai pada baris ke-${i + 1} ${matrix[i]}: ${sum / matrix[i].length}');
    print('Nilai minimum pada baris ke-${i + 1} ${matrix[i]}: $min');
    print('Nilai maksimum pada baris ke-${i + 1} ${matrix[i]}: $max');
    print('============================================');
  }
}
