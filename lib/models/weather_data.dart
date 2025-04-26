// lib/models/weather_data.dart

class WeatherData {
  final String day;
  final String temperature;
  final String iconPath;

  WeatherData({
    required this.day,
    required this.temperature,
    required this.iconPath,
  });
}

List<WeatherData> mockWeatherData = [
  WeatherData(day: "Mon", temperature: "22°C", iconPath: "assets/images/sunny.png"),
  WeatherData(day: "Tue", temperature: "20°C", iconPath: "assets/images/cloudy.png"),
  WeatherData(day: "Wed", temperature: "18°C", iconPath: "assets/images/rainy.png"),
  WeatherData(day: "Thu", temperature: "24°C", iconPath: "assets/images/sunny.png"),
  WeatherData(day: "Fri", temperature: "19°C", iconPath: "assets/images/storm.png"),
];
