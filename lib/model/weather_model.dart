class Weather {
  String? cityName;
  double? temp;
  double? wind;
  double? humidity;
  double? feels_like;
  int? pressure;
  String? desc;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure,
    this.desc,
  });

  // function to parse JSON data
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    humidity = json['main']['humidity'];
    feels_like = json['main']['feels_like'];
    pressure = json['main']['pressure'];
    desc = json['weather'][0]['main'];
  }
}
