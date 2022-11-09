import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String formatSaving() {
    return '${this.getHour()}:${this.getMinute()} ${this.getPeriod().toUpperCase()}';
  }

  String getHour() {
    if (this.hour < 10) {
      return '0${this.hour}';
    }
    return '${this.hour}';
  }

  String getMinute() {
    if (this.minute < 10) {
      return '0${this.minute}';
    }
    return '${this.minute}';
  }

  String getPeriod() {
    return this.period.name;
  }
}
