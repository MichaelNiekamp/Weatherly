import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rain/model/weather_model.dart';
import 'package:rain/services/weather_api_client.dart';
import 'package:rain/views/additional_information.dart';
import 'package:rain/views/current_weather.dart';

Future main() async {
  await dotenv.load(fileName: "dotenv");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  Future<void> getData(String cityName) async {
    setState(() {
      data = null; // Clear previous data while fetching new data
    });
    Weather? newData = await client.getCurrentWeather(cityName);
    setState(() {
      data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 140, 147),
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentWeather(Icons.wb_sunny_rounded, "${data?.temp ?? ''}",
              "${data?.cityName ?? ''}"),
          const SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'Enter city name',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String cityName = cityController.text.trim();
                  if (cityName.isNotEmpty) {
                    getData(cityName);
                  }
                },
                child: Text('Search'),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Additional Information",
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(
            height: 20.0,
          ),
          additionalnformation(
            "${data?.wind ?? ''}",
            "${data?.humidity ?? ''}",
            "${data?.pressure ?? ''}",
            "${data?.feels_like ?? ''}",
          ),
        ],
      ),
    );
  }
}
