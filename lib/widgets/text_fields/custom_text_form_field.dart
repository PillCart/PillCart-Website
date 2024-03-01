// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_typing_uninitialized_variables

/// This file defines the `CustomTextField` widget, which is a customizable text form field component used in the PillCart application.
/// It is designed to provide a visually appealing and interactive way for users to input text, such as names, email addresses, or passwords.
/// The text form field includes features like custom styling, validation, prefix and suffix icons, and integration with the GetX package for state management.
///
/// Key sections of the code include:
/// - The `CustomTextField` class: This widget displays a text form field with customizable properties such as label, validation message, controller, obscureText, and icon visibility.
/// - The `TextFormField` widget: Utilizes the Flutter framework to create the text form field. It includes properties for customization and appearance.
/// - The `validator` function: Validates the input based on the specified label, such as checking if the input is empty or if a phone number has the correct length.
/// - The `prefixIcon` and `suffixIcon` widgets: Display icons next to the text form field, providing visual cues to the user about the type of information being inputted.
/// - The `GetX` package integration: Utilizes the GetX package for state management, allowing for dynamic updates to the text form field based on user input or other application states.
///
/// This file is crucial for providing a consistent and customizable way to display text form fields in the PillCart application, enhancing the overall user experience.
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/utils/theme.dart';

class CustomTextField extends StatelessWidget {
  var controller;
  String validateMessage;
  TextEditingController textController;
  bool isSuffix;
  bool isPrefix;
  IconData? preIcon;
  bool isScure;

  String label;

  CustomTextField({
    super.key,
    this.controller,
    required this.validateMessage,
    required this.textController,
    required this.isSuffix,
    required this.isPrefix,
    required this.preIcon,
    required this.isScure,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: customLightTheme.textTheme.bodySmall?.copyWith(
        color: Colors.black,
      ),
      obscureText: isScure,
      cursorColor: kBrand800,
      cursorHeight: 24,
      cursorOpacityAnimates: true,
      validator: label == 'Phone Number'
          ? (value) {
              if (value == null || value.isEmpty) {
                return validateMessage;
              } else if (value.length != 10) {
                return 'The phone number must be ten digits long';
              }
              return null;
            }
          : (value) {
              if (value == null || value.isEmpty) {
                return validateMessage;
              }
              return null;
            },
      controller: textController,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 100),
        contentPadding: isPrefix ? const EdgeInsets.symmetric(horizontal: 16, vertical: 0) : const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        prefixIcon: isPrefix
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  height: 24,
                  width: 24,
                  alignment: Alignment.center,
                  child: FaIcon(
                    preIcon,
                    size: 24,
                    color: kBrand800,
                  ),
                ),
              )
            : null,
        suffixIcon: isSuffix
            ? IconButton(
                splashRadius: 1,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                onPressed: () {
                  controller.visiblPassword();
                },
                icon: isScure
                    ? const Icon(
                        Icons.visibility,
                        size: 24,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        size: 24,
                      ),
                focusColor: kBrand200,
                color: kBrand800,
              )
            : null,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: label,
        labelStyle: customLightTheme.textTheme.labelSmall?.copyWith(
          color: kBrand800,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        errorStyle: customLightTheme.textTheme.labelSmall?.copyWith(
          color: red,
          height: 1,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: kBrand800,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
