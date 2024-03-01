// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:pillcart_website/controller/cart_controller.dart.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    CartController cartController = Get.put(CartController(), permanent: true);
      MedicinesController medicinesController = Get.put(MedicinesController(), permanent: true);

    
  }
}
