class ContactModel {
  String name;
  String noTelp;

  ContactModel({this.name = '', this.noTelp = ''});

  @override
  String toString() {
    return '''Nama : $name, No.Telp : $noTelp''';
  }
}
