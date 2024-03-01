/// This file defines the `Loader` class, which provides utility functions for displaying and hiding loading indicators in the PillCart application.
/// It uses the GetX package to create customizable loading dialogs that can be shown or hidden programmatically, enhancing the user experience by providing visual feedback during asynchronous operations.
/// The loading indicators are designed to be visually appealing and consistent with the application's theme, ensuring a smooth and efficient user experience.
///
/// Key sections of the code include:
/// - The `showLoading` method: Displays a customizable loading dialog with a circular progress indicator. It uses the `Get.dialog` method from the GetX package to show the dialog.
/// - The `hideLoading` method: Hides the currently displayed loading dialog. It checks if a dialog is open and uses the `Get.back` method to close it.
/// - The `Get.dialog` method: Utilizes the GetX package to display the loading dialog. It includes properties for barrier color, dismissibility, and the dialog's appearance.
/// - The `CircularProgressIndicator` widget: Represents the loading indicator, which is a circular progress indicator with customizable color and stroke width.
///
/// This file is crucial for providing a consistent and customizable way to display loading indicators during asynchronous operations, ensuring a smooth and efficient user experience.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/helper/constant.dart';

class Loader {
  static void showLoading() {
    Get.dialog(
      barrierColor: kBrand100.withOpacity(0.5),
      barrierDismissible: false,
      const Dialog(
        elevation: 0,
        shadowColor: null,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: kBrand800,
                strokeWidth: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
