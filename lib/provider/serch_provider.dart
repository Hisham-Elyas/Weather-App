import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/search.dart';

class SerchProvider extends ChangeNotifier {
  claerSearch() {
    searchController.text = '';
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();
  bool isSearchController() {
    return searchController.text.isNotEmpty;
  }

  String? searchValue;
  List<Search> searchlist = [];
  Future<void> searchData(BuildContext context, searchValue) async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    notifyListeners();
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/search.json?key=bd4c80d2417e4738b33152837232409&q=$searchValue');
    // List<Searchmodel> searchlist = [];

    try {
      // print('str');
      final response = await http.get(url);
      searchlist.clear();
      final eData = jsonDecode(response.body) as List<dynamic>;
      for (var element in eData) {
        searchlist.add(Search.fromJson(element));
      }
      if (searchlist.isEmpty) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,

          content: AwesomeSnackbarContent(
            title: 'On Snap!',
            message: 'Search results are empty!',

            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.warning,
          ),
        ));
      }
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        // duration: const Duration(seconds: 10),

        content: AwesomeSnackbarContent(
          title: 'On Snap!',
          message: 'Something went wrong Ckeck the internet!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      ));
    }
    // print(searchController.text);
    // print(searchValue);
  }

  Future<Position> getPosition(BuildContext context) async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // ignore: body_might_complete_normally_catch_error
    return await Geolocator.getCurrentPosition();
  }
}
