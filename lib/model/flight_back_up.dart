class Flight {
  final String airline;
  final String flight;
  final String terminal;
  final String status;
  final String city;
  final String? country;
  final String? statusColor;
  final String scheduledDate;
  final String scheduledTime;
  final String? updatedDate;
  final String? updatedTime;
  final String currentCultureName;

  Flight({
    required this.airline,
    required this.flight,
    required this.terminal,
    required this.status,
    required this.city,
    this.country,
    required this.statusColor,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.updatedDate,
    required this.updatedTime,
    required this.currentCultureName,
  });

  // Method to create a Flight object from a JSON map
  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      airline: json['Airline'],
      flight: json['Flight'],
      terminal: json['Terminal'],
      status: json['Status'],
      city: json['City'],
      country: json['Country'] ?? 'לא ידוע',
      statusColor: json['StatusColor'] ?? 'לא סופי',
      scheduledDate: json['ScheduledDate'],
      scheduledTime: json['ScheduledTime'],
      updatedDate: json['UpdatedDate'] ?? '',
      updatedTime: json['UpdatedTime'] ?? '',
      currentCultureName: json['CurrentCultureName'],
    );
  }

  // Method to convert a Flight object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'Airline': airline,
      'Flight': flight,
      'Terminal': terminal,
      'Status': status,
      'City': city,
      'Country': country,
      'StatusColor': statusColor,
      'ScheduledDate': scheduledDate,
      'ScheduledTime': scheduledTime,
      'UpdatedDate': updatedDate,
      'UpdatedTime': updatedTime,
      'CurrentCultureName': currentCultureName,
    };
  }

  // Example method to print flight details
  String getFlightDetails() {
    return 'Flight $flight by $airline to $city at $terminal. Status: $status';
  }
}