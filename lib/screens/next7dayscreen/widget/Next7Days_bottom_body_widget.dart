import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/glassbox.dart';

class Next7DaysWidget extends StatelessWidget {
  final String day;
  final String degree;
  final String img;
  final double? imgSisz;
  const Next7DaysWidget({
    super.key,
    required this.day,
    required this.degree,
    required this.img,
    this.imgSisz = 45,
  });

  @override
  Widget build(BuildContext context) {
    return GlassBox(
      height: 60.h,
      width: double.maxFinite,
      borderRadius: 15.r,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: TextStyle(
                    color: const Color(0xFF303345),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp),
              ),
              Expanded(child: Container()),
              Text(degree,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff303345),
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: imgSisz,
                height: imgSisz,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
