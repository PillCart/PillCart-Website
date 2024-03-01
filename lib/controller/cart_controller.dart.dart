// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pillcart_website/models/AddToCartModel.dart';
import 'package:pillcart_website/models/MyOrderModel.dart';
import 'package:pillcart_website/models/detailsForOrderModel.dart';
import 'package:pillcart_website/models/medicines_model.dart';
import 'package:pillcart_website/utils/api_endpoints.dart';
import 'package:pillcart_website/widgets/custom_snackbar.dart';

class CartController extends GetxController {
  RxBool isOrdersLoading = true.obs;
  RxBool isOrderDetailesLoading = true.obs;
  RxBool isMyOrdersEmpty = true.obs;
  RxBool isCartEmpty = true.obs;

  List<Medicines> medicinsInCart = [];
  List<int> amount = [];
  List<int> inCart = [];

  Map<int, int> medInCart = {};

  List<MyOrderElement>? myOrders = [];
  DetailsForOrderModel? detailsOrder;

  Order? adminOrder;



  @override
  void onReady() {
    update();
    super.onReady();
  }


  List<int> ids = [];

  Map<String, dynamic> data = {};
  List<Map<dynamic, dynamic>> myMap = [];
  List<AddToCartModel> CartModel = [];

  Future<void> cleanCart() async {
    inCart = [];
    medicinsInCart = [];
    amount = [];
    CartModel = [];
  }

  ShowOrderForAdmin() async {
    isOrdersLoading(true);
    http.Response response = await http.get(Uri.parse(baseUrl + 'allOrders'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $adminToken',
      'Lan_Token': 'en',
    });
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonData["Order"] == []) {
        isMyOrdersEmpty(true);
        update();
      } else {
        adminOrder = myOrderFromJson(response.body);
        isMyOrdersEmpty(false);
        isOrdersLoading(false);
        update();
      }
    }
  }

  ShowdetailesOfOrder(int id) async {
    try {
      isOrderDetailesLoading(true);
      http.Response response = await http.get(Uri.parse(baseUrl + 'detailsForOrder/$id'), headers: {'Content-Type': 'application/json', 'Accept': 'application/json', 'Authorization': 'Bearer $adminToken', 'Lan_Token': 'ar'});
      if (response.statusCode == 200) {
        detailsOrder = detailsForOrderModelFromJson(response.body);
        isOrderDetailesLoading(false);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  changeDeliveryStatusToSent(int id) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl + 'sendOrder/$id'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $adminToken',
        'Lan_Token': 'en',
      });
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsonData['message'] == 'the Order is already sented') {
          customSnackbar('Again?', 'This order is already sent', 'error', 1300, Colors.white);
        } else {
          update();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  changeDeliveryStatusToRecived(int id) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl + 'orderReceived/$id'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $adminToken',
        'Lan_Token': 'en',
      });
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsonData['message'] == 'the order is already received') {
          customSnackbar('Again?', 'This order is already received', 'error', 1300, Colors.white);
        } else {
          update();
        }
      }
    } catch (e) {
      print(e);
    }
  }

  changePaymentStatusToPaid(int id) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl + 'receiveMoney/$id'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $adminToken',
        'Lan_Token': 'en',
      });
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (jsonData['message'] == 'the money is already received') {
          customSnackbar('Again?', 'Money of this order are already received', 'error', 1300, Colors.white);
        } else {
          update();
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
