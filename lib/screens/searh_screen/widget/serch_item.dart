import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/search.dart';
import '../../home_scrren/home_scrren.dart';

class SerchItime extends StatelessWidget {
  final Search searchdata;
  const SerchItime({super.key, required this.searchdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScrren(city: searchdata.url!)));
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${searchdata.region!} ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Theme.of(context).primaryColor),
              ),
              Text(
                searchdata.name!,
                style: TextStyle(
                    fontSize: 14.sp, color: Theme.of(context).primaryColor),
              ),
              Text(
                ' Country : ${searchdata.country!}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
