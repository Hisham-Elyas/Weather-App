import 'dart:async';
import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/alerts.dart';
import '../model/current.dart';

import '../model/forecastday.dart';
import '../model/location.dart';
import '../model/weather_model.dart';
import '../screens/home_scrren/start_scren.dart';
import '../shared/sharedpref.dart';

class WeatherProvider extends ChangeNotifier {
  late Uri api;
  Location? location;
  Current? current;
  List<Forecastday>? forecastday;
  Alerts? alerts;

  apiUrl({required dynamic contry, String days = '7'}) {
    api = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=bd4c80d2417e4738b33152837232409&q=$contry&days=$days&aqi=yes&alerts=yes');
  }

  Future<void> fetchData(
      {dynamic contry = 'atbara-airport-atbara-sudan',
      String days = '7',
      required BuildContext context}) async {
    apiUrl(contry: contry);

    try {
      final response = await http.get(api);

      final data = WeatherData.fromJson(jsonDecode(response.body));
      SharedPrrf.sharedPreferences!.setString('contry', contry);
      SharedPrrf.sharedPreferences!.setString('data', response.body);

      location = data.location;
      current = data.current;
      forecastday = data.forecast!.forecastday;

      alerts = data.alerts;

      notifyListeners();

      // debugPrint(data.location!.localtime);

      // console.log();
      //////////////////////
    } catch (e) {
      debugPrint(e.toString());
      if (SharedPrrf.sharedPreferences!.containsKey('data')) {
        final data = WeatherData.fromJson(
            jsonDecode(SharedPrrf.sharedPreferences!.getString('data')!));
        location = data.location;
        current = data.current;
        forecastday = data.forecast!.forecastday;
        alerts = data.alerts;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          duration: const Duration(seconds: 10),

          content: AwesomeSnackbarContent(
            title: 'On Snap!',
            message: 'Something went wrong Ckeck the internet!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.failure,
          ),
        ));
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          duration: const Duration(seconds: 5),

          content: AwesomeSnackbarContent(
            title: 'On Snap!',
            message: 'Something went wrong Ckeck the internet!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.failure,
          ),
        ));

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const StartScren()));
        notifyListeners();
      }
    }
  }

  String hapmformat({required bool isTap, required String day}) {
    String timeHM =
        DateFormat.jz().format(DateFormat('yyyy-MM-dd hh:mm').parse(day));

    //////////////
    String now = DateFormat.jz().format(DateTime.now());

    if (timeHM == now && isTap) {
      return timeHM = 'Now';
    }
    return timeHM;
  }

  String mmmedformat() {
    return DateFormat.MMMEd()
        .format(DateFormat('yyyy-MM-dd hh:mm').parse('${location!.localtime}'));
  }

  final currentday = DateFormat.EEEE().format(DateTime.now());
  final tomorrow =
      DateFormat.EEEE().format(DateTime.now().add(const Duration(days: 1)));

  String dayformat({required day}) {
    final nextday = DateFormat.EEEE()
        .format(DateFormat('yyyy-MM-dd').parse('${forecastday![day].date}'));

    if (nextday == currentday) {
      return 'Today';
    } else if (nextday == tomorrow) {
      return 'Tomorrow';
    }
    return nextday;
  }

  // late WeatherData weatherData;
  Forecastday? tommorowDay() {
    Forecastday? current;
////////////  next day not currntday
    final tommorow =
        DateFormat.EEEE().format(DateTime.now().add(const Duration(days: 1)));

    ///
    for (var element in forecastday!) {
      final nextday = DateFormat.EEEE()
          .format(DateFormat('yyyy-MM-dd').parse('${element.date}'));
      if (nextday == tommorow) {
        current = element;
      }
    }
    return current;
  }

  mySnackBar(BuildContext context) {
    if (forecastday!.length != 7) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Future.delayed(
          Duration.zero,
          () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                /// need to set following properties for best effect of awesome_snackbar_content
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                duration: const Duration(seconds: 10),

                content: AwesomeSnackbarContent(
                  title: 'On Snap!',
                  message:
                      'Only ${forecastday!.length} day weather forecast is available!',

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.warning,
                ),
              )));
    }
  }
}
