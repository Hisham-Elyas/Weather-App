import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppbar extends StatelessWidget {
  MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return

        // height: 48,
        // width: 218,
        SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 35.h,
                    width: 35.w,
                    child:
                        Image.asset('images/srch_icon.png', fit: BoxFit.fill)),
                SizedBox(
                  height: 8.h,
                  width: 70.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Dot(height: 6.h, width: 6.w, borderRadius: 4.r),
                      Dot(height: 6.h, width: 6.w, borderRadius: 4.r),
                      Dot(height: 6.h, width: 28.w, borderRadius: 4.r),
                      Dot(height: 6.h, width: 6.w, borderRadius: 4.r),
                    ],
                  ),
                ),
                SizedBox(
                    height: 35.h,
                    width: 35.w,
                    child:
                        Image.asset('images/menu_icon.png', fit: BoxFit.fill)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  const Dot({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xff303344),
          borderRadius: BorderRadius.circular(borderRadius)),
    );
  }
}
