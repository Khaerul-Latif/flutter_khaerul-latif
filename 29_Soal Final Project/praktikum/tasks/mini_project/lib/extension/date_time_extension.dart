extension DateTimeExtension on DateTime {
  String formatSaving() {
    return '${this.year}-${this.getMonth()}-${this.getDate()}';
  }

  String getMonth() {
    if (this.month < 10) {
      return '0${this.month.toString()}';
    }
    return this.month.toString();
  }

  String getDate() {
    if (this.day < 10) {
      return '0${this.day}';
    }
    return this.day.toString();
  }

  String getYearMonth() {
    return '${this.year}-${this.month}';
  }

  String getShortDay() {
    switch (this.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
      default:
        return 'Sun';
    }
  }
    String toMonth() {
    switch (this.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
      default:
        return 'Dec';
    }
  }

  String getMyDate() {
    return "${this.day} ${this.toMonth()}, ${this.year} | ${this.hour}:${this.minute}";
  }

  String getDateOnly() {
    return "${this.day} ${this.toMonth()}, ${this.year}";
  }

  String getFullMonth() {
    switch (this.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
      default:
        return 'December';
    }
  }


}