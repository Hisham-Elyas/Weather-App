import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/screens/next7dayscreen/widget/next7bays_bottom_body_widget.dart';
import 'package:weather_app/screens/next7dayscreen/widget/top_body_betils_widget.dart';
import 'package:weather_app/screens/widget/glassbox.dart';

import '../../model/forecastday.dart';
import '../../provider/weather_provider.dart';

class Next7DaysScrren extends StatelessWidget {
  final List<Forecastday>? forecastday;
  const Next7DaysScrren({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    final wprov = Provider.of<WeatherProvider>(context, listen: false);
    wprov.mySnackBar(context);
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 55),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    // size: 24.h,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 25.w),
                    child: Center(
                      child: Text(
                        'Next 7 Days',
                        style: TextStyle(
                            color: const Color(0xFF313341),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        // width: double.infinity,
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlassBox(
                    height: 190.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    width: double.maxFinite,
                    borderRadius: 20.r,
                    child: Column(children: [
                      SizedBox(
                        height: 70.h,
                        child: Row(
                          children: [
                            Text('Tommorow ',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: const Color(0xFF303345),
                                    fontWeight: FontWeight.bold)),
                            Expanded(child: Container()),
                            Text(
                                // '22 °',

                                '${wprov.tommorowDay()!.day!.maxtempC}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF303345),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 75.w,
                              height: 75.h,
                              child:
                                  //  Image.asset(
                                  //   'images/page2_icon.png',

                                  CachedNetworkImage(
                                imageUrl:
                                    "http:${wprov.tommorowDay()!.day!.condition!.icon}",
                                // placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error,
                                        color: Color(0xfff39876)),
                              ),
                              //     Image.network(
                              //   'http:${wprov.currentfday()!.day!.condition!.icon}',
                              //   fit: BoxFit.cover,
                              // ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 28.w, vertical: 8.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TopBodyDetils(
                                    imgSisz: 40.h,
                                    img: 'images/unbrellaicon.png',
                                    title:
                                        '${wprov.tommorowDay()!.day!.avgvisMiles!.toInt()} cm'),
                                TopBodyDetils(
                                    imgSisz: 40.h,
                                    img: 'images/wind_icon.png',
                                    title:
                                        '${wprov.tommorowDay()!.day!.maxwindKph!.toInt()} km/h'),
                                TopBodyDetils(
                                  imgSisz: 40.h,
                                  img: 'images/humidity_icon.png',
                                  title:
                                      '${wprov.tommorowDay()!.day!.avghumidity!.toInt()} %',
                                ),
                              ]),
                        ),
                      )
                    ]),
                  ),

                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: forecastday!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Next7DaysWidget(
                              day: wprov.dayformat(day: index),
                              degree: '${forecastday![index].day!.maxtempC} °',
                              img:
                                  'http:${forecastday![1].day!.condition!.icon}',
                            ),
                            SizedBox(height: 10.h),
                          ],
                        );
                      },
                    ),
                  )
                  // const Next7DaysWidget(
                  //   day: 'Friday',
                  //   degree: '24 °',
                  //   img: 'images/sun1_icon_bar.png',
                  // ),
                  // SizedBox(height: 10.h),
                  // const Next7DaysWidget(
                  //   day: 'Saturday',
                  //   degree: '18 °',
                  //   img: 'images/page2_icon.png',
                  // ),
                  // SizedBox(height: 10.h),
                  // const Next7DaysWidget(
                  //   day: 'Sunday',
                  //   degree: '12 °',
                  //   img: 'images/clud2.png',
                  // ),
                  // SizedBox(height: 10.h),
                  // const Next7DaysWidget(
                  //   day: 'Monday',
                  //   degree: '16 °',
                  //   img: 'images/clud_raining_icon.png',
                  // ),
                  // SizedBox(height: 10.h),
                  // const Next7DaysWidget(
                  //   day: 'Tuesday',
                  //   degree: '18 °',
                  //   img: 'images/clud_raining_icon.png',
                  // ),
                ]),
          ),
        ),
      ),
    );
  }
}
