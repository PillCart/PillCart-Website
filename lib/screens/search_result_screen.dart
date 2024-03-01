// ignore_for_file: must_be_immutable

/// This file defines the `SearchResultsScreen` widget, which displays a list of search results available in the PillCart application.
/// It shows a list of medicine tiles, each representing a medicine with its details. Users can tap on a medicine tile to view more details.
/// The screen includes a loading indicator while the search results are being fetched and displays a message if no results are found.
/// The list of search results is fetched from a backend service and displayed using a `ListView.separated` widget.
///
/// Key sections of the code include:
/// - The `SearchResultsScreen` class: This is the main widget for displaying the list of search results. It initializes the `MedicinesController` and defines the UI layout.
/// - The `GetBuilder` widget: Used to rebuild the UI when the list of search results changes. It wraps the `ListView.separated` widget that displays the search results.
/// - The `ListView.separated` widget: Dynamically generates a list of `CustomCard` widgets based on the search results fetched from the `MedicinesController`.
/// - The `CustomCard` widget: Represents a single medicine in the list. It displays the medicine's details and allows users to tap on it to view more details.
/// - The loading and empty state indicators: Displayed while the search results are being fetched or if no results are found, respectively.
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/models/medicines_model.dart';
import 'package:pillcart_website/widgets/custom_card.dart';
import 'package:pillcart_website/widgets/text_fields/custom_search_bar.dart';

class SearchResultsScreen extends StatelessWidget {
  List<Medicines> searchResults = [];
  TextEditingController searchController = TextEditingController();

  MedicinesController medicinesController = Get.find();

  SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    searchResults = medicinesController.searchResults;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leadingWidth: 32,
          foregroundColor: kBrand800,
          leading: IconButton(
              onPressed: () {
                Get.toNamed("/home");
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'Search Results',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomSearchBar(
                onTapOutside: (p0) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                isScure: true,
                textController: searchController,
                isSuffix: true,
                preIcon: FontAwesomeIcons.magnifyingGlass,
                isPrefix: true,
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<MedicinesController>(builder: (controller) {
                return Expanded(
                  child: Column(
                    children: [
                      //? ----------------Search results----------------

                      Expanded(
                        child: !medicinesController.isSearchResultsEmpty.value
                            ? SizedBox(
                                height: 400,
                                child: medicinesController.isSearchResultsLoading.value == true
                                    ? const Center(child: CircularProgressIndicator())
                                    : ListView.separated(
                                        physics: const BouncingScrollPhysics(
                                          decelerationRate: ScrollDecelerationRate.fast,
                                        ),
                                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                        separatorBuilder: (context, index) => const SizedBox(
                                          height: 8,
                                        ),
                                        itemCount: medicinesController.searchResults.length,
                                        itemBuilder: (context, index) {
                                          return CustomCard(
                                            medicines: medicinesController.searchResults[index],
                                          );
                                        },
                                      ),
                              )
                            : const Center(
                                child: Text('no results'),
                              ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

/* */