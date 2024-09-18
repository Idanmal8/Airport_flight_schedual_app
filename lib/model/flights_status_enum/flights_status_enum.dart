import 'package:flutter/material.dart';

enum FlightStatus {
  landed,
  delay,
  finalUpdate,
  notFinalUpdate,
  canceled,
  early,
}

//write an extension on FlightStatus
extension FlightStatusExtension on FlightStatus {
  Color get color {
    switch (this) {
      case FlightStatus.landed:
      case FlightStatus.early:
      case FlightStatus.finalUpdate:
        return Colors.green;
      case FlightStatus.delay:
      case FlightStatus.canceled:
        return Colors.red;
      case FlightStatus.notFinalUpdate:
        return Colors.orange;
    }
  }

  static FlightStatus fromString(String status){
    switch (status) {
      case 'נחתה':
        return FlightStatus.landed;
      case 'עיכוב':
        return FlightStatus.delay;
      case 'סופי':
        return FlightStatus.finalUpdate;
      case 'לא סופי':
        return FlightStatus.notFinalUpdate;
      case 'מבוטלת':
        return FlightStatus.canceled;
      case 'הוקדמה':
        return FlightStatus.early;
      default:
        return FlightStatus.notFinalUpdate;
    }
  }
}