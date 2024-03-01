// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pillcart_website/models/categories_model.dart';
import 'package:pillcart_website/models/medicines_model.dart';
import 'package:pillcart_website/utils/api_endpoints.dart';
import 'package:pillcart_website/widgets/custom_snackbar.dart';

class MedicinesController extends GetxController {
  RxBool isInStockLoading = true.obs;
  RxBool isCategoriesLoading = true.obs;
  RxBool isCompaniesLoading = true.obs;
  RxBool isDrugByCategoryLoading = true.obs;
  RxBool isDrugByCompanyLoading = true.obs;

  List<Categories> companies = [];
  List<Medicines> drugByCategory = [];
  List<Medicines> drugByCompany = [];
  List<Medicines> medicines = [];
  List<Categories> categories = [];

  late TextEditingController tradeNameController, genericNameController, companyController, categoryController, priceController, amountController, expiringYearController, expiringMonthController, expiringDayController;

  @override
  void onInit() {
    super.onInit();

    tradeNameController = TextEditingController();
    genericNameController = TextEditingController();
    companyController = TextEditingController();
    categoryController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();
    expiringYearController = TextEditingController();
    expiringMonthController = TextEditingController();
    expiringDayController = TextEditingController();
  }

  void clearFields() {
    tradeNameController.clear();
    genericNameController.clear();
    companyController.clear();
    categoryController.clear();
    priceController.clear();
    amountController.clear();
    expiringYearController.clear();
    expiringMonthController.clear();
    expiringDayController.clear();
  }

  @override
  void onClose() async {
    super.onClose();
    medicines = [];
    categories = [];
    companies = [];
    await getAlldrugs();
    await getAllCategory();
    await getAllCompanies();
  }

  addMedicine() async {
    try {
      http.Response response = await http.post(
        Uri.parse(baseUrl + 'store'),
        body: {
          'tradeName': tradeNameController.text,
          'genericName': genericNameController.text,
          'company': companyController.text,
          'category': categoryController.text,
          'price': priceController.text,
          'amount': amountController.text,
          'expiringYear': expiringYearController.text,
          'expiringMonth': expiringMonthController.text,
          'expiringDay': expiringDayController.text,
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $adminToken',
          'tokenDevice': 'dkbQJ8wVSXudjXDBjxhJg6:APA91bErho8YWqE7wKLObggmLWUtDLeOJ1V48tm3CkdXJOgk1UVkUPEOYqDarEecT2Sg7irGZSo4RTXbb-rlAT9SBTusUIPwTHvQupHEnNOgZTWf-aE6nTUT928i0p3WyZd4loG0j50k',
        },
      );

      if (response.statusCode == 201) {
        tradeNameController.clear();
        genericNameController.clear();
        companyController.clear();
        categoryController.clear();
        priceController.clear();
        amountController.clear();
        expiringYearController.clear();
        expiringMonthController.clear();
        expiringDayController.clear();
        Get.back();
        customSnackbar("Done!", "Done.", "su", 1300, Colors.green[400]?.withOpacity(0.7));
      } else {
        tradeNameController.clear();
        genericNameController.clear();
        companyController.clear();
        categoryController.clear();
        priceController.clear();
        amountController.clear();
        expiringYearController.clear();
        expiringMonthController.clear();
        expiringDayController.clear();
        customSnackbar("error!", "error.", "error", 1300, Colors.green[400]?.withOpacity(0.7));
      }
    } catch (e) {
      print(e);
    }
  }

  getAlldrugs() async {
    try {
      isInStockLoading(true);
      http.Response response = await http.get(
        Uri.parse(baseUrl + 'index'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $adminToken',
          'tokenDevice': 'dkbQJ8wVSXudjXDBjxhJg6:APA91bErho8YWqE7wKLObggmLWUtDLeOJ1V48tm3CkdXJOgk1UVkUPEOYqDarEecT2Sg7irGZSo4RTXbb-rlAT9SBTusUIPwTHvQupHEnNOgZTWf-aE6nTUT928i0p3WyZd4loG0j50k',
        },
      );

      if (response.statusCode == 200) {
        medicines = medicinesFromJson(response.body);
        isInStockLoading(false);
        update();
      } else {}
      isInStockLoading(false);
    } catch (e) {
      print(e);
    } finally {
      isInStockLoading(false);
    }
  }

  getAllDrugsByCategory(int id) async {
    try {
      isDrugByCategoryLoading(true);
      http.Response response = await http.get(
        Uri.parse(baseUrl + 'productsOfCategory/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $adminToken',
          'tokenDevice': 'dkbQJ8wVSXudjXDBjxhJg6:APA91bErho8YWqE7wKLObggmLWUtDLeOJ1V48tm3CkdXJOgk1UVkUPEOYqDarEecT2Sg7irGZSo4RTXbb-rlAT9SBTusUIPwTHvQupHEnNOgZTWf-aE6nTUT928i0p3WyZd4loG0j50k',
        },
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data.toString() == "{" "message" ":" " No products found" "}") {
          drugByCategory = [];
          isDrugByCategoryLoading(false);
          update();
        } else {
          drugByCategory = medicinesFromJson(response.body);
          isDrugByCategoryLoading(false);
          update();
        }
      } else {
      }
      isDrugByCategoryLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isDrugByCategoryLoading(false);
    }
  }

  getAllDrugsByCompany(int id) async {
    try {
      isDrugByCompanyLoading(true);
      http.Response response = await http.get(
        Uri.parse(baseUrl + 'productsOfCompany/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $adminToken',
          'tokenDevice': 'dkbQJ8wVSXudjXDBjxhJg6:APA91bErho8YWqE7wKLObggmLWUtDLeOJ1V48tm3CkdXJOgk1UVkUPEOYqDarEecT2Sg7irGZSo4RTXbb-rlAT9SBTusUIPwTHvQupHEnNOgZTWf-aE6nTUT928i0p3WyZd4loG0j50k',
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data.toString() == "{" "message" ":" " No products found" "}") {
          drugByCompany = [];
          isDrugByCompanyLoading(false);
          update();
        } else {
          drugByCompany = medicinesFromJson(response.body);
          isDrugByCompanyLoading(false);
          update();
        }
      } else {
      }
      isDrugByCompanyLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      isDrugByCompanyLoading(false);
    }
  }

  getAllCategory() async {
    try {
      isCategoriesLoading(true);
      http.Response response = await http.get(
        Uri.parse(baseUrl + 'category'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $adminToken',
          'tokenDevice': 'dkbQJ8wVSXudjXDBjxhJg6:APA91bErho8YWqE7wKLObggmLWUtDLeOJ1V48tm3CkdXJOgk1UVkUPEOYqDarEecT2Sg7irGZSo4RTXbb-rlAT9SBTusUIPwTHvQupHEnNOgZTWf-aE6nTUT928i0p3WyZd4loG0j50k',
        },
      );

      if (response.statusCode == 200) {
        categories = categoriesFromJson(response.body);
        isCategoriesLoading(false);
        update();
      } else {
      }
      isCategoriesLoading(false);
    } catch (e) {
      print(e);
    }
  }

  getAllCompanies() async {
    try {
      isCompaniesLoading(true);

      http.Response response = await http.get(
        Uri.parse(baseUrl + 'company'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $adminToken',
          'tokenDevice': 'dkbQJ8wVSXudjXDBjxhJg6:APA91bErho8YWqE7wKLObggmLWUtDLeOJ1V48tm3CkdXJOgk1UVkUPEOYqDarEecT2Sg7irGZSo4RTXbb-rlAT9SBTusUIPwTHvQupHEnNOgZTWf-aE6nTUT928i0p3WyZd4loG0j50k',
        },
      );

      if (response.statusCode == 200) {
        companies = categoriesFromJson(response.body);
        isCompaniesLoading(false);
        update();
      } else {
      }
      isCompaniesLoading(false);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReady() async {
    await getAlldrugs();
    await getAllCategory();
    await getAllCompanies();
  }

  RxBool isSearchResultsLoading = true.obs;
  RxBool isSearchResultsEmpty = false.obs;
  List<Medicines> searchResults = [];

  search(String key) async {
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
        } else {}
      } catch (e) {
        print(e);
      }
    }
  }
}
