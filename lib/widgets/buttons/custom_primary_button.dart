// ignore_for_file: must_be_immutable

/// This file defines the `CPrimaryButton` widget, which is a customizable primary button component used in the PillCart application.
/// It is designed to provide a visually appealing and interactive way for users to perform actions, such as submitting forms, navigating to different screens, or confirming actions.
/// The primary button includes features like custom styling, customizable text, and integration with the GetX package for state management.
///
/// Key sections of the code include:
/// - The `CPrimaryButton` class: This widget displays a primary button with customizable properties such as button text, onPressed callback, color, and enabled state.
/// - The `ElevatedButton` widget: Utilizes the Flutter framework to create the primary button. It includes properties for customization and appearance.
/// - The `onPressed` callback: Triggered when the user taps the button, allowing for the execution of specific actions based on the button's purpose.
/// - The `style` property: Customizes the appearance of the button, including background color, foreground color, elevation, shadow color, text style, and shape.
/// - The `GetX` package integration: Utilizes the GetX package for state management, allowing for dynamic updates to the button based on user input or other application states.
///
/// This file is crucial for providing a consistent and customizable way to display primary buttons in the PillCart application, enhancing the overall user experience.
import 'package:flutter/material.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/utils/theme.dart';

class CPrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final VoidCallback onPressed;
  bool isEnabled = true;
  bool inTable = false;
  CPrimaryButton({super.key, 
    required this.isEnabled,
    required this.inTable,
    required this.buttonText,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: inTable ? 24 : 40,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 0),
          backgroundColor: inTable
              ? buttonText == 'Sent'
                  ? kBrand600
                  : Colors.green[400]
              : color,
          foregroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.black26,
          textStyle: inTable ? customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12) : customLightTheme.textTheme.labelSmall,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: inTable
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttonText),
                  const SizedBox(
                    width: 8,
                  ),
                  buttonText == 'Sent'
                      ? const Icon(
                          Icons.send,
                          size: 10,
                        )
                      : const Icon(
                          Icons.check,
                          size: 10,
                        )
                ],
              )
            : Text(buttonText),
      ),
    );
  }
}
