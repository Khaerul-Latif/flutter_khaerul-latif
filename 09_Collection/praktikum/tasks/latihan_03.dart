void main(List<String> args) {
  if (args.length > 2) {
    final arg1 = double.tryParse(args[0]);
    final arg2 = double.tryParse(args[0]);
    if (arg1 != null && arg2 != null) {
      if (args[1] == '+') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 + arg2}');
      } else if (args[1] == '-') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 - arg2}');
      } else if (args[1] == '/') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 / arg2}');
      } else if (args[1] == 'x') {
        print('Hasil dari $arg1 ${args[1]} $arg2 adalah ${arg1 * arg2}');
      } else {
        print('Operator tidak dikenali');
      }
    } else {
      print('Angka yang ada masukkan tidak sesuai');
    }
  } else {
    print('Anda belum memberikan operasi yang sesuai');
  }
}
