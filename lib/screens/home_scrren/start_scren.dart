// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../provider/serch_provider.dart';
import '../searh_screen/search_sereen.dart';
import 'home_scrren.dart';
import 'widget/custom_buttom.dart';

class StartScren extends StatelessWidget {
  const StartScren({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // height: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFFEE3BC).withOpacity(0.7),
          const Color(0xFFFEE3BC),
          const Color(0xFFF39876),
        ],
      )),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //     // height: 200,
          //     // width: 200,
          //     child: Image(image: AssetImage('images/clud_icon_bar.png'))),
          // Image.asset('images/clud_icon_bar.png'),
          Text('Welcome',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.sp,
                  color: const Color(0xfff39876))),
          Text('to Weather App',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.sp,
                  color: const Color(0xfff39876).withOpacity(0.7))),
          SizedBox(height: 20.h),
          CustomButtom(
            title: 'Used My location',
            onPressed: () async {
              final weatherdata =
                  Provider.of<SerchProvider>(context, listen: false);

              final Position position = await weatherdata.getPosition(context);
              Future.delayed(
                  Duration.zero,
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => HomeScrren(
                          city: "${position.latitude},${position.latitude}"))));
            },
          ),
          CustomButtom(
            title: 'Search',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 70.h),
        ],
      )),
    ));
  }
}
