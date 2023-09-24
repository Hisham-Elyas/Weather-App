import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const GlassBox(
      {super.key,
      required this.child,
      required this.height,
      required this.width,
      required this.borderRadius,
      this.padding,
      this.margin});

  @override
  Widget build(BuildContext context) {
    // print(1.sh);
    // print(1.sw);
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container()),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    // color: Colors.transparent,

                    color: Colors.white.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Color(0xFFFFFFFF).withOpacity(0.4),
                        // Color(0xFFFFFFFF).withOpacity(0.1),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.2),
                      ])),
            ),
            Container(
              padding: padding,
              margin: margin,
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
