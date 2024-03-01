// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, avoid_types_as_parameter_names, non_constant_identifier_names

/// This file defines the `CustomSearchBar` widget, which is a customizable search bar component used in the PillCart application.
/// It is designed to provide a visually appealing and interactive way for users to search for medicines or other items within the application.
/// The search bar includes features like custom styling, real-time search functionality, and integration with the GetX package for state management.
///
/// Key sections of the code include:
/// - The `CustomSearchBar` class: This widget displays a search bar with customizable properties such as controller, prefix icon, and onTapOutside callback.
/// - The `TextFormField` widget: Utilizes the Flutter framework to create the search bar. It includes properties for customization and appearance.
/// - The `onFieldSubmitted` and `onChanged` callbacks: Triggered when the user submits the search query or changes the input, allowing for real-time search functionality.
/// - The `prefixIcon` widget: Displays an icon next to the search bar, providing visual cues to the user about the type of search being performed.
/// - The `GetX` package integration: Utilizes the GetX package for state management, allowing for dynamic updates to the search bar based on user input or other application states.
///
/// This file is crucial for providing a consistent and customizable way to display search bars in the PillCart application, enhancing the overall user experience.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/utils/theme.dart';

class CustomSearchBar extends StatelessWidget {
  MedicinesController medicinesController = Get.find();
  TextEditingController? textController;
  bool isSuffix;
  bool isPrefix;
  IconData? preIcon;
  bool isScure;
  Function(PointerDownEvent) onTapOutside;
  Function(String)? onChanged;

  CustomSearchBar({
    super.key,
    required this.textController,
    required this.isSuffix,
    required this.isPrefix,
    required this.preIcon,
    required this.isScure,
    required this.onTapOutside,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            blurRadius: 8,
            spreadRadius: -8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        onFieldSubmitted: (Value) async {
          await medicinesController.search(Value);
          Get.toNamed('/search_result');
          textController!.clear();
        },

        onChanged: (value) {
          medicinesController.search(value);
        },
        onTapOutside: onTapOutside,
        style: customLightTheme.textTheme.bodySmall?.copyWith(
          color: Colors.black,
          height: 1.4,
        ),
        obscureText: false,
        cursorColor: kBrand800,
        cursorHeight: 24,
        cursorOpacityAnimates: true,
        controller: textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          prefixIcon: isPrefix
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      preIcon,
                      size: 24,
                      color: kBrand800,
                    ),
                  ),
                )
              : null,

          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintText: 'Search...',
          hintStyle: customLightTheme.textTheme.labelMedium?.copyWith(
            color: kBrand800,
          ),
          filled: true,
          hoverColor: Colors.grey[100],
          fillColor: Colors.white,
          errorStyle: customLightTheme.textTheme.labelSmall?.copyWith(
            color: red,
            height: 1,
          ),
          errorMaxLines: 2,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: kBrand800,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
