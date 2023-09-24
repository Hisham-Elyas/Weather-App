import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/app_bar.dart';
import '../../../widget/glassbox.dart';
import '../../next7dayscreen/next7days_screen.dart';

class DaysWearbar extends StatefulWidget {
  const DaysWearbar({
    super.key,
  });

  @override
  State<DaysWearbar> createState() => _DaysWearState();
}

class _DaysWearState extends State<DaysWearbar> {
  List weaerlist = [
    {'time': '01:00', 'img': 'images/clud_icon_bar.png', 'degr': '20 °'},
    {'time': 'Now', 'img': 'images/clud2.png', 'degr': '19 °'},
    {'time': '03:00', 'img': 'images/clud_raining_icon.png', 'degr': '21 °'},
    {'time': '04:00', 'img': 'images/sun1_icon_bar.png', 'degr': '15 °'},
    {'time': '05:00', 'img': 'images/cludy.png', 'degr': '25 °'},
    {'time': '05:00', 'img': 'images/clud_icon_bar.png', 'degr': '22 °'},
  ];
  bool isTap = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(children: [
            TextButton(
              onPressed: () {
                if (isTap) {
                  return;
                }
                isTap = !isTap;
                setState(() {});
              },
              child: Text(
                'Today',
                style: TextStyle(
                    fontWeight: isTap ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18.sp,
                    color: isTap
                        ? const Color(0xFF313341)
                        : const Color(0xFFD6996B)),
              ),
            ),
            TextButton(
              onPressed: () {
                if (!isTap) {
                  return;
                }
                isTap = !isTap;
                setState(() {});
              },
              child: Text(
                'Tomorrow',
                style: TextStyle(
                    fontWeight: isTap ? FontWeight.normal : FontWeight.bold,
                    fontSize: 18.sp,
                    color: isTap
                        ? const Color(0xFFD6996B)
                        : const Color(0xFF313341)),
              ),
            ),
            Expanded(child: Container()),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Next7DaysScrren()));
              },
              child: Row(
                children: [
                  Text(
                    'Next 7 Days',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xFFD6996B),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    weight: 150.w,
                    size: 20.h,
                    color: const Color(0xFFD6996B),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Stack(
          children: [
            Divider(
              indent: 16.w,
              endIndent: 16.w,
              color: const Color(0xFFE2A272),
            ),
            AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.only(left: isTap ? 30.w : 105.w, top: 6.h),
                child: Dot(
                    height: 3.h,
                    width: isTap ? 45.w : 75.w,
                    borderRadius: 4.r)),
          ],
        ),
        SizedBox(
          height: 130.h,
          // width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: weaerlist.length,
              itemBuilder: (context, index) => Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                    child: GlassBox(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      height: 150.h,
                      width: 60.w,
                      borderRadius: 20.r,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              weaerlist[index]['time'],
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            SizedBox(
                                height: 40.h,
                                width: 40.w,
                                child: Image.asset(
                                  weaerlist[index]['img'],
                                  fit: BoxFit.cover,
                                )),
                            Text(
                              weaerlist[index]['degr'],
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
