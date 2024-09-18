import 'package:ben_gurion_flights/model/flight_back_up.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BgaService {
  Future<List<Flight>?> getFlights(String option, String date) async {
    final Uri uri = Uri.parse(
        'https://www.iaa.gov.il/umbraco/surface/FlightBoardSurface/Search');

    final Map<String, String> payload = {
      "FlightType": "Incoming",
      "AirportId": "LLBG",
      "UICulture": "he-IL",
      "FromDate": date,
      "ToDate": date
    };

    final http.Response response = await http.post(
      uri,
      body: json.encode(payload),
      headers: {
        'Content-Type': 'application/json',
      },
    );


    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> flights = json.decode(response.body);
      print(flights);
      List<Flight> flightList = flights['Flights']
          .map<Flight>((flight) => Flight.fromJson(flight))
          .toList();
      //order the flights by time
      flightList.sort((a, b) => (a.updatedTime == '' ? a.scheduledTime : a.updatedTime)?.compareTo(b.updatedTime == '' ? b.scheduledTime : b.updatedTime ?? '') ?? 0);

      return flightList;
    } else {
      throw Exception('Failed to load flights');
    }
  }
}
