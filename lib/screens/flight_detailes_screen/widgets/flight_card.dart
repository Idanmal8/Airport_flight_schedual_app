import 'package:ben_gurion_flights/model/flight_back_up.dart';
import 'package:ben_gurion_flights/model/flights_status_enum/flights_status_enum.dart';
import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final Flight flight;

  const FlightCard({
    required this.flight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final FlightStatus status = FlightStatusExtension.fromString(flight.status);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(flight.flight,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20)),
                    Text(flight.city,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(flight.scheduledTime,
                        style: const TextStyle(fontSize: 20)),
                    Text(flight.scheduledDate,
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(flight.terminal,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20)),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: double.infinity, // Take up all available width
                  child: Chip(
                    color: WidgetStateProperty.all(status.color),
                    label: Center(
                      child: Text(
                        flight.status,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
