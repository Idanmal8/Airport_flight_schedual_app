class Flight {
  final String? airline;
  final String? flight;
  final String? city;
  final String? terminal;
  final String? scheduledTime;
  final String? updateTime;
  final String? status;

  Flight({
    required this.airline,
    required this.flight,
    required this.city,
    required this.terminal,
    required this.scheduledTime,
    required this.updateTime,
    required this.status,
  });

  // Method to format scheduledTime to DateTime object
  DateTime formatScheduledTime() {
    // Assuming scheduledTime is in a specific format like 'yyyy-MM-ddTHH:mm:ss' or similar
    return DateTime.parse(scheduledTime ?? '');
  }

  // Method to format updateTime to DateTime object
  DateTime formatUpdateTime() {
    // Assuming updateTime is in a specific format like 'yyyy-MM-ddTHH:mm:ss' or similar
    return DateTime.parse(updateTime ?? '');
  }

  // Example method to print flight details
  String getFlightDetails() {
    return 'Flight $flight by $airline to $city at $terminal. Status: $status';
  }

  // Factory method to create a Flight object from a JSON map
  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      airline: json['airline'] ?? 'לא ידוע',
      flight: json['flight'] ?? 'לא ידוע',
      city: json['city'] ?? 'לא ידוע',
      terminal: json['terminal'] ?? 'לא ידוע',
      scheduledTime: json['scheduledTime'] ?? 'לא ידוע',
      updateTime: json['updateTime'] ?? 'לא ידוע',
      status: json['status'] ?? 'לא ידוע', 
    );
  }

  // Method to convert a Flight object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'airline': airline,
      'flight': flight,
      'city': city,
      'terminal': terminal,
      'scheduledTime': scheduledTime,
      'updateTime': updateTime,
      'status': status,
    };
  }
}