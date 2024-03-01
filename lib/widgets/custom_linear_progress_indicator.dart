/// This file defines the `CustomLinearProgressIndicator` and `CustomCircularProgressIndicator` widgets, which are customizable progress indicators used in the PillCart application.
/// These indicators are designed to provide visual feedback during asynchronous operations, such as loading data or processing requests, in a visually appealing and consistent manner.
/// The progress indicators are customizable, allowing for changes in color, stroke width, and background color to match the application's theme.
///
/// Key sections of the code include:
/// - The `CustomLinearProgressIndicator` class: This widget displays a linear progress indicator with customizable properties such as background color, color, minHeight, and borderRadius.
/// - The `CustomCircularProgressIndicator` class: This widget displays a circular progress indicator with customizable properties such as strokeCap, strokeWidth, backgroundColor, and color.
/// - The `LinearProgressIndicator` and `CircularProgressIndicator` widgets: Utilize the Flutter framework to create the progress indicators. They include properties for customization and appearance.
/// - The `kBrand300` and `kBrand500` constants: Used for setting the background and foreground colors of the progress indicators, ensuring a consistent color scheme across the application.
///
/// This file is crucial for providing a consistent and customizable way to display progress indicators during asynchronous operations, enhancing the overall user experience of the PillCart application.
import 'package:flutter/material.dart';
import 'package:pillcart_website/helper/constant.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: kBrand300,
      borderRadius: BorderRadius.circular(16),
      minHeight: 6,
      color: kBrand500,
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeCap: StrokeCap.round,
      strokeWidth: 6,
      backgroundColor: kBrand300,
      color: kBrand500,
    );
  }
}
