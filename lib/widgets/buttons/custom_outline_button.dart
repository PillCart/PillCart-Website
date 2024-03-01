/// This file defines the `COutlineButton` widget, which is a customizable outline button component used in the PillCart application.
/// It is designed to provide a visually appealing and interactive way for users to perform secondary actions, such as canceling a form or navigating to a different screen.
/// The outline button includes features like custom styling, customizable text, and integration with the GetX package for state management.
///
/// Key sections of the code include:
/// - The `COutlineButton` class: This widget displays an outline button with customizable properties such as button text, onPressed callback, color, and enabled state.
/// - The `ElevatedButton` widget: Utilizes the Flutter framework to create the outline button. It includes properties for customization and appearance.
/// - The `onPressed` callback: Triggered when the user taps the button, allowing for the execution of specific actions based on the button's purpose.
/// - The `style` property: Customizes the appearance of the button, including background color, foreground color, elevation, shadow color, text style, and shape.
/// - The `GetX` package integration: Utilizes the GetX package for state management, allowing for dynamic updates to the button based on user input or other application states.
///
/// This file is crucial for providing a consistent and customizable way to display outline buttons in the PillCart application, enhancing the overall user experience.
import 'package:flutter/material.dart';
import 'package:pillcart_website/utils/theme.dart';

class COutlineButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final VoidCallback onPressed;

  const COutlineButton({super.key, 
    required this.buttonText,
    required this.onPressed,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 0),
          backgroundColor: Colors.white,
          foregroundColor: color,
          animationDuration: const Duration(milliseconds: 300),
          elevation: 6,
          side: BorderSide(
            width: 2,
            color: color,
          ),
          shadowColor: Colors.black26,
          padding: const EdgeInsets.all(20),
          textStyle: customLightTheme.textTheme.labelSmall,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          buttonText,
        ),
      ),
    );
  }
}
