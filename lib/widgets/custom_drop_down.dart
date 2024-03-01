// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

/// This file defines the `CustomDropDown` widget, which is a customizable dropdown menu component used in the PillCart application.
/// It is designed to provide a visually appealing and interactive way for users to select from a list of options, such as categories or filters.
/// The dropdown menu includes features like a loading indicator, customizable appearance, and integration with the GetX package for state management.
///
/// Key sections of the code include:
/// - The `CustomDropDown` class: This widget displays a dropdown menu with customizable properties such as icon, label, items, and onChanged callback.
/// - The `DropdownButtonFormField` widget: Utilizes the Flutter framework to create the dropdown menu. It includes properties for customization and appearance.
/// - The `loader` value: Determines whether to display a loading indicator or the actual dropdown menu. It is used in conjunction with the `GetX` package for state management.
/// - The `Shimmer.fromColors` widget: Displays a shimmer effect as a loading indicator, providing visual feedback while the data is being fetched.
///
/// This file is crucial for providing a consistent and customizable way to display dropdown menus in the PillCart application, enhancing the overall user experience.
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/utils/theme.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/models/categories_model.dart';

class CustomDropDown extends StatelessWidget {
  MedicinesController medicinesController = Get.find();
  RxBool loader;
  IconData icon;
  String lable;
  var items;
  Function(Categories?) onChanged;
  CustomDropDown({
    Key? key,
    required this.loader,
    required this.icon,
    required this.lable,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        child: loader.value == true
            ? Stack(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      filled: true,
                      fillColor: Colors.grey[100],
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[200]!.withOpacity(0.9),
                    highlightColor: Colors.white.withOpacity(0.9),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: -8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        color: Colors.grey[300]!.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      height: 50,
                    ),
                  ),
                ],
              )
            : Container(
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      blurRadius: 8,
                      spreadRadius: -8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: DropdownButtonFormField<Categories>(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(8),
                  iconSize: 20,
                  enableFeedback: false,
                  menuMaxHeight: height * 0.4,
                  icon: const Icon(
                    FontAwesomeIcons.angleDown,
                    color: kBrand800,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(
                        icon,
                        size: 18,
                        color: kBrand800,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    filled: true,
                    fillColor: Colors.grey[100],
                    label: Text(
                      lable,
                      style: customLightTheme.textTheme.labelMedium?.copyWith(
                        color: kBrand800,
                      ),
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  dropdownColor: Colors.white,
                  style: customLightTheme.textTheme.labelMedium?.copyWith(
                    color: kBrand950,
                  ),
                  items: items,
                  onChanged: onChanged,
                ),
              ));
  }
}
