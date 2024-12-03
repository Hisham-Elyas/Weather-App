// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'widget/_hrowolder_body_betels_widget.dart';

import '../../provider/weather_provider.dart';
import '../widget/app_bar.dart';
import 'widget/days_wearbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class HomeScrren extends StatefulWidget {
  String? city;
  HomeScrren({super.key, this.city});

  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        await Provider.of<WeatherProvider>(context, listen: false)
            .fetchData(context: context, contry: widget.city);
        timer = Timer.periodic(const Duration(minutes: 10), (timer) async {
          await Provider.of<WeatherProvider>(context, listen: false)
              .fetchData(context: context, contry: widget.city);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeatherProvider>(context, listen: true);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 55.h),
          child: const MyAppbar(),
        ),
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
            child: RefreshIndicator(
              onRefresh: () {
                return Provider.of<WeatherProvider>(context, listen: false)
                    .fetchData(context: context);
              },
              child: data.location == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                              height: 120.h,
                              // height: 81,
                              // width: 218,
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.w, vertical: 5.h),
                              ////////// body 1 title
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    //  Khartoum
                                    // 'Atbara,',
                                    '${data.location!.name},',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26.sp,
                                        color: const Color(0xff313341)),
                                  ),
                                  Text(
                                      // 'Al Sudan',
                                      '${data.location!.country}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.sp,
                                          color: const Color(0xff313341))),
                                  Text(
                                      // 'Tue, Jun 30',
                                      data.mmmedformat(),
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: const Color(0xff9a938c))),
                                ],
                              )),
                          /////////////// body 2 degree  درجة الحرارة

                          Container(
                            // height: 95.h,
                            // height: 88,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 4.h),

                            // width: 218,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 85.w,
                                    height: 85.h,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "http:${data.current!.condition!.icon}",
                                      // placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                        Icons.error,
                                        color: Color(0xfff39876),
                                      ),
                                    ),

                                    // Image.network(
                                    //   // Image.asset(
                                    //   // 'images/cludy.png',
                                    //   // 'http://cdn.weatherapi.com/weather/64x64/day/113.png',
                                    //   'http:${data.current!.condition!.icon}',
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    height: 90.h,
                                    // height: 64,
                                    // width: 65.w,
                                    child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  // '19 ° c',
                                                  '${data.current!.tempC} °c',
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff303345),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30.sp),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  // 'Rainy',
                                                  '${data.current!.condition!.text}',
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff303345),
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),

                                          // SizedBox(
                                          //     height: 20.h,
                                          //     width: 20.w,
                                          //     child: Image.asset(
                                          //       'images/degree-sign.png',
                                          //       fit: BoxFit.cover,
                                          //     ))
                                        ]),
                                  )
                                ]),
                          ),
                          //////////////    body 3  row detlis
                          Container(
                            height: 254.h,
                            // height: 154,
                            // color: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 16.w),
                            child: Column(
                              children: [
                                RowHolderBody(
                                  img: 'images/unbrellaicon.png',
                                  title: 'RainFall',
                                  lasttitle:
                                      '${data.current!.visMiles!.toInt()} cm',
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                RowHolderBody(
                                  img: 'images/wind_icon.png',
                                  title: 'Wind',
                                  lasttitle: '${data.current!.windKph} km/h',
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                RowHolderBody(
                                  img: 'images/humidity_icon.png',
                                  title: 'Humidity',
                                  lasttitle: '${data.current!.humidity}%',
                                ),
                              ],
                            ),
                          ),
                          ///////////      body 4  Next 7 Days weather
                          DaysWearbar(forecastday: data.forecastday),
                        ],
                      ),
                    ),
            ),
          ),
        ));
  }
}
