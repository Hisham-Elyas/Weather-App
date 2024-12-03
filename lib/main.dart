import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'screens/home_scrren/home_scrren.dart';

import 'provider/serch_provider.dart';
import 'provider/weather_provider.dart';
import 'screens/home_scrren/start_scren.dart';
import 'shared/sharedpref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ScreenUtil.ensureScreenSize();
  await SharedPrrf().initsharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 781),
        // designSize: const Size(360, 690),
        builder: (context, child) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => WeatherProvider(),
                ),
                ChangeNotifierProvider(
                  create: (context) => SerchProvider(),
                )
              ],
              child: MaterialApp(
                  title: 'weather_app',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: const Color(0xfff39876)),
                    useMaterial3: true,
                  ),
                  home: SharedPrrf.sharedPreferences!.containsKey('contry')
                      ? HomeScrren(
                          city:
                              SharedPrrf.sharedPreferences!.getString('contry'))
                      : const StartScren()

                  //     return StartScren();

                  // home: HomeScrren(),
                  ),
            ));
  }
}
