import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(
    color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600);

TextStyle infoStyle = const TextStyle(
    color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w400);

Widget additionalnformation(
    String wind, String humidity, String pressure, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wind", style: titleFont),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "Pressure",
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$wind mph", style: infoStyle),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$pressure hPa",
                  style: infoStyle,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humidity", style: titleFont),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "Feels Like",
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(humidity, style: infoStyle),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "$feels_like °F",
                  style: infoStyle,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
