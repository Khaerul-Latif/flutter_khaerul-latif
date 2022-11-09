extension StringExtension on String {
  String caseCamel() {
    String first = this.split(' ')[0].toLowerCase();
    String firstUpper = first.split('')[0].toUpperCase();
    String result = firstUpper +
        first.replaceFirst(firstUpper.toLowerCase(), '').toLowerCase();
    return result;
  }

  String getHour() {
    String result = (this.split(' ')[0].split(':')[0].toString());
    if (result.length == 1) {
      if ((int.tryParse(result) ?? 0) < 10) {
        result = '0$result';
      }
    }

    return result;
  }

  String getMinute() {
    return (this.split(' ')[0].split(':')[1].toString());
  }

  String getPeriod() {
    return (this.split(' ')[1].toString());
  }

  String formatSaving() {
    return getHour() + ':' + getMinute() + ' ' + getPeriod();
  }
}
