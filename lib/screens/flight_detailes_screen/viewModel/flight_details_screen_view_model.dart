import 'package:flutter/material.dart';

import 'package:ben_gurion_flights/model/flight_back_up.dart';

import 'package:ben_gurion_flights/services/bga_service.dart';
import 'package:intl/intl.dart';

class FlightDetailsScreenViewModel extends ChangeNotifier {
  final List<Flight> _flightsList = [];
  double flightTitls = 17;
  double flightInfo = 15;
  bool _isLoading = false;
  bool _isTommorow = false;
  bool _isToday = true;

  bool get isLoading => _isLoading;
  List<Flight> get flightsList => _flightsList;
  bool get isTommorow => _isTommorow;
  bool get isToday => _isToday;

  FlightDetailsScreenViewModel() {
    _init();
  }

  void _init() {
    _isLoading = true;
    notifyListeners();

    // Get the current date and format it
    getTodayFlights();

    _isLoading = false;
    notifyListeners();
  }

  String formatDate(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  void getTommorowFlights() {
    _isTommorow = true;
    _isToday = false;
    DateTime tommorow = DateTime.now().add(const Duration(days: 1));
    String formattedDate = DateFormat('dd/MM/yyyy').format(tommorow);
    getFlights(formattedDate);
  }

  void getTodayFlights() {
    _isTommorow = false;
    _isToday = true;
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    getFlights(formattedDate);
  }

  void getFlights(String date) async {
    _isLoading = true;
    notifyListeners();

    final flights = await BgaService().getFlights('Incoming', date);
    if (flights != null) {
      _flightsList.clear();

      // Filter flights where the time (updatedTime) has not passed yet
      final validFlights = flights.where((flight) {
        // Parse the flight's updatedTime (HH:mm format)
        final TimeOfDay flightTime;
        if (flight.updatedTime == '') {
          flightTime = TimeOfDay(
            hour: int.parse(flight.scheduledTime.split(":")[0]),
            minute: int.parse(flight.scheduledTime.split(":")[1]),
          );
        } else {
          flightTime = TimeOfDay(
            hour: int.parse(flight.updatedTime!.split(":")[0]),
            minute: int.parse(flight.updatedTime!.split(":")[1]),
          );
        }

        // Get the current time
        final currentTime = TimeOfDay.now();

        // Compare the times: if flightTime is after or equal to the current time, keep it
        return flightTime.hour > currentTime.hour ||
            (flightTime.hour == currentTime.hour &&
                flightTime.minute >= currentTime.minute);
      }).toList();

      // Add the valid flights to the list
      _flightsList.addAll(validFlights);
    }

    _isLoading = false;
    notifyListeners();
    return;
  }

  void increaseFontSize() {
    if (flightTitls >= 25) return;
    flightTitls++;
    flightInfo++;
    notifyListeners();
  }

  void decreaseFontSize() {
    if (flightTitls <= 15) return;
    flightTitls--;
    flightInfo--;
    notifyListeners();
  }
}
