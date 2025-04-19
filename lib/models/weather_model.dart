class WeatherModel {
  final String location;
  final double temperature;
  final String condition;
  final String icon;
  final double humidity;
  final double windSpeed;
  final DateTime date;

  WeatherModel({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.date,
  });

  // Mock data for testing
  static WeatherModel mock() {
    return WeatherModel(
      location: 'New York',
      temperature: 22.5,
      condition: 'Sunny',
      icon: 'sunny',
      humidity: 65.0,
      windSpeed: 5.2,
      date: DateTime.now(),
    );
  }
} 