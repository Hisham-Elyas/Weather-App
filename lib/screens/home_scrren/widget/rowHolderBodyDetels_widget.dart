import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/glassbox.dart';

class rowHolderBody extends StatelessWidget {
  final String img;
  final String title;
  final String lasttitle;
  const rowHolderBody({
    super.key,
    required this.img,
    required this.title,
    required this.lasttitle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassBox(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),

      height: 70.h,
      // height: 38,
      width: double.maxFinite,
      // width: 186,
      borderRadius: 20.r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              // color: Color(0xFFFFFFFF)
                              //     .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Image.asset(
                            img,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(width: 15.w),
                      Text(
                        title,
                        style: TextStyle(fontSize: 18.sp),
                      )
                    ]),
                Text(
                  lasttitle,
                  style: TextStyle(fontSize: 15.sp),
                )
              ]),
        ],
      ),
    );
  }
}
