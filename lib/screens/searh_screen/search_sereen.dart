// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../provider/serch_provider.dart';
import '../home_scrren/home_scrren.dart';
import 'widget/serch_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final weatherdata = Provider.of<WeatherProvider>(context, listen: true);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Consumer<SerchProvider>(
                  builder: (context, weatherdata, child) => Column(
                    children: [
                      SearchBar(
                        controller: weatherdata.searchController,
                        hintText: 'Search',
                        leading: const Icon(
                          Icons.search,
                          color: Color(0xfff39876),
                        ),
                        padding:
                            WidgetStatePropertyAll(EdgeInsets.only(left: 25.w)),
                        trailing: [
                          if (weatherdata.isSearchController())
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                weatherdata.claerSearch();
                              },
                            ),
                        ],
                        onChanged: (value) {
                          weatherdata.searchData(context, value);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () async {
                                final Position position =
                                    await weatherdata.getPosition(context);
                                Future.delayed(
                                    Duration.zero,
                                    () => Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (ctx) => HomeScrren(
                                                city:
                                                    "${position.latitude},${position.latitude}"))));
                              },
                              child: const Text('Used My location',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  )))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<SerchProvider>(
                    builder: (context, data, child) => ListView.builder(
                      itemCount: data.searchlist.length,
                      itemBuilder: (context, index) {
                        return SerchItime(searchdata: data.searchlist[index]);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
