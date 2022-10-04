class Contact {
  String name;
  String noTelp;

  Contact({this.name = '', this.noTelp = ''});

  @override
  String toString() {
    return '''Nama : $name, No.Telp : $noTelp''';
  }
}
