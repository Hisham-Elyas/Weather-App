import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/screens/next7dayscreen/widget/Next7Days_bottom_body_widget.dart';
import 'package:weather_app/screens/next7dayscreen/widget/TopBodyDetils_widget.dart';
import 'package:weather_app/widget/glassbox.dart';

class Next7DaysScrren extends StatelessWidget {
  const Next7DaysScrren({super.key});

  @override
  Widget build(BuildContext context) {
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
                            Text('Tommorow',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: const Color(0xFF303345),
                                    fontWeight: FontWeight.bold)),
                            Expanded(child: Container()),
                            Text('22 °',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF303345),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 75.w,
                              height: 75.h,
                              child: Image.asset(
                                'images/page2_icon.png',
                                fit: BoxFit.cover,
                              ),
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
                                    title: '1 cm'),
                                TopBodyDetils(
                                    imgSisz: 40.h,
                                    img: 'images/wind_icon.png',
                                    title: '15 km/h'),
                                TopBodyDetils(
                                    imgSisz: 40.h,
                                    img: 'images/humidity_icon.png',
                                    title: '50 %'),
                              ]),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(height: 20.h),
                  const Next7DaysWidget(
                    day: 'Thursday',
                    degree: '21 °',
                    img: 'images/sun1_icon_bar.png',
                  ),
                  SizedBox(height: 10.h),
                  const Next7DaysWidget(
                    day: 'Friday',
                    degree: '24 °',
                    img: 'images/sun1_icon_bar.png',
                  ),
                  SizedBox(height: 10.h),
                  const Next7DaysWidget(
                    day: 'Saturday',
                    degree: '18 °',
                    img: 'images/page2_icon.png',
                  ),
                  SizedBox(height: 10.h),
                  const Next7DaysWidget(
                    day: 'Sunday',
                    degree: '12 °',
                    img: 'images/clud2.png',
                  ),
                  SizedBox(height: 10.h),
                  const Next7DaysWidget(
                    day: 'Monday',
                    degree: '16 °',
                    img: 'images/clud_raining_icon.png',
                  ),
                  SizedBox(height: 10.h),
                  const Next7DaysWidget(
                    day: 'Tuesday',
                    degree: '18 °',
                    img: 'images/clud_raining_icon.png',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
