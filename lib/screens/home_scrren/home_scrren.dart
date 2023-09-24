import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/app_bar.dart';
import 'widget/DaysWearbar_widget.dart';
import 'widget/rowHolderBodyDetels_widget.dart';

class HomeScrren extends StatelessWidget {
  HomeScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 55.h),
          child: MyAppbar(),
        ),
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
            child: Column(
              children: [
                Container(
                    height: 120.h,
                    // height: 81,
                    // width: 218,
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 5.h),
                    ////////// body 1 title
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          //  Khartoum
                          'Atbara,',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp,
                              color: const Color(0xff313341)),
                        ),
                        Text('Al Sudan',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                                color: const Color(0xff313341))),
                        Text('Tue, Jun 30',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff9a938c))),
                      ],
                    )),
                /////////////// body 2 degree  درجة الحرارة

                Container(
                  // height: 95.h,
                  // height: 88,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),

                  // width: 218,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 85.w,
                            height: 85.h,
                            child: Image.asset(
                              'images/cludy.png',
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 90.h,
                          // height: 64,
                          width: 65.w,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '19',
                                      style: TextStyle(
                                          color: const Color(0xff303345),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.sp),
                                    ),
                                    Text(
                                      'Rainy',
                                      style: TextStyle(
                                          color: const Color(0xff303345),
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  '° c',
                                  style: TextStyle(
                                      color: const Color(0xff303345),
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                )
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
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  child: Column(
                    children: [
                      const rowHolderBody(
                        img: 'images/unbrellaicon.png',
                        title: 'RainFall',
                        lasttitle: '3cm',
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const rowHolderBody(
                        img: 'images/wind_icon.png',
                        title: 'Wind',
                        lasttitle: '19km/h',
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const rowHolderBody(
                        img: 'images/humidity_icon.png',
                        title: 'Humidity',
                        lasttitle: '64%',
                      ),
                    ],
                  ),
                ),
                ///////////      body 4  Next 7 Days weather
                const DaysWearbar(),
              ],
            ),
          ),
        ));
  }
}
