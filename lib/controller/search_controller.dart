// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pillcart_website/models/medicines_model.dart';
import 'package:pillcart_website/utils/api_endpoints.dart';

class CustomSearchController extends GetxController {
  RxBool isSearchResultsLoading = true.obs;
  RxBool isSearchResultsEmpty = false.obs;
  List<Medicines> searchResults = [];

  searcsh(String key) async {
    if (key != null) {
      try {
        isSearchResultsLoading(true);
        http.Response response = await http.get(
          Uri.parse(baseUrl + 'search/$key'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $adminToken',
            'tokenDevice': 'dkbQJ8wVSXudjXDBjxhJg6:APA91bErho8YWqE7wKLObggmLWUtDLeOJ1V48tm3CkdXJOgk1UVkUPEOYqDarEecT2Sg7irGZSo4RTXbb-rlAT9SBTusUIPwTHvQupHEnNOgZTWf-aE6nTUT928i0p3WyZd4loG0j50k',
          },
        );
        var data = jsonDecode(response.body);
        if (data[0] == null) {
          isSearchResultsLoading(false);
          isSearchResultsEmpty(true);
          update();
        }
        searchResults = medicinesFromJson(response.body);
        isSearchResultsEmpty(false);
        isSearchResultsLoading(false);
        update();
        if (response.statusCode == 200) {
        } else {
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
