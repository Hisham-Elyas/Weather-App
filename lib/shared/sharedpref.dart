import 'package:shared_preferences/shared_preferences.dart';

class SharedPrrf {
  static SharedPreferences? sharedPreferences;

  Future<void> initsharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
    //  sharedPreferences.containsKey('contry');
    // if (sharedPreferences.containsKey('contry')) {
    //   // print(sharedPreferences.getString('contry'));
    //   return Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (ctx) =>
    //           HomeScrren(city: sharedPreferences.getString('contry'))));
    // } else {
    //   return Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (ctx) => const StartScren()));
    // }
  }
}
