import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/glassbox.dart';

// ignore: must_be_immutable
class CustomButtom extends StatelessWidget {
  void Function()? onPressed;
  final String title;
  Widget? child;
  CustomButtom(
      {super.key, required this.title, required this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style:
          const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.all(5))),
      child: GlassBox(
          height: 50.h,
          width: 250.w,
          borderRadius: 25.r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      )),
                  Container(child: child),
                ],
              )
            ],
          )),
    );
  }
}
