/// This file defines the `customSnackbar` function, which is a utility function for displaying customized snackbars in the PillCart application.
/// It uses the GetX package to create snackbars with customizable properties such as title, message, type, duration, color, and dismissibility.
/// The snackbars are designed to provide feedback to the user in a visually appealing and informative manner, enhancing the user experience.
///
/// Key sections of the code include:
/// - The `customSnackbar` function: This function takes several parameters to customize the snackbar, including title, message, type, duration, color, and an optional isDismissible flag.
/// - The `Get.snackbar` method: Utilizes the GetX package to display the snackbar with the specified customizations. It includes properties for margin, animation duration, overlay blur, snack style, position, background color, and text color.
/// - The `SnackStyle.FLOATING` and `SnackPosition.BOTTOM`: These properties ensure that the snackbar appears in a floating style at the bottom of the screen, providing a modern and user-friendly interface.
/// - The conditional background color: Based on the type of the snackbar, it sets the background color to red for error messages and uses a custom color for other types, enhancing the visual feedback to the user.
///
/// This file is crucial for providing a consistent and customizable way to display feedback messages to the user, ensuring a smooth and efficient user experience.
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(title, message, type, duration, color, {isDismissible = true}) {
  Get.snackbar(
    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    isDismissible: isDismissible,
    animationDuration: const Duration(milliseconds: 200),
    overlayBlur: 4,
    duration: Duration(milliseconds: duration),
    snackStyle: SnackStyle.FLOATING,
    title,
    message,
    barBlur: 6,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == "error" ? Colors.red[400]?.withOpacity(0.7) : color,
    colorText: Colors.black,
  );
}
