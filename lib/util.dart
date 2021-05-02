import 'dart:math';

var days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
var cities = ['Paris', 'Tokyo', 'Dubai', 'London', 'Madrid', 'Cairo', 'Mumbai',  'Beijing', 'NYC', 'Moscow'];
var weather = ['rain', 'sun'];

T getRandomElement<T>(List<T> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  return list[i];
}

int randomNumber() {
  final random = new Random();
  return 15 + random.nextInt(35 - 15);
}

List<Map<String, Object>> generateDailyWeather(String city) {
  List<Map<String, Object>> dailyWeather = [];
  if (cities.indexOf(city) >= 0) {
    for (var i = 0; i < 7; i++) {
      dailyWeather.add({
        'day': days[i],
        'weather': getRandomElement(weather),
        'temperature': randomNumber().toString(),
      });
    }
  }
  return dailyWeather;
}

List<Map<String, Object>> generateFiveDaysWeather(String city) {
  List<Map<String, Object>> dailyWeather = [];
  if (cities.indexOf(city) >= 0) {
    for (var i = 0; i < 5; i++) {
      String day = days[i];
      dailyWeather.add({
        'day': (i == 0) ? 'Today' : (i == 1) ? 'Tomorrow' : day,
        'weather': getRandomElement(weather),
        'temperature': randomNumber().toString(),
      });
    }
  }
  return dailyWeather;
}

List<Map<String, Object>> generateHourlyWeather(String city) {
  List<Map<String, Object>> dailyWeather = [];
  if (cities.indexOf(city) >= 0) {
    for (var i = 0; i < 24; i++) {
      dailyWeather.add({
        'time': i,
        'weather': getRandomElement(weather),
        'temperature': randomNumber().toString(),
      });
    }
  }
  return dailyWeather;
}