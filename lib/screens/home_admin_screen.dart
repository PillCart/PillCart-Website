// ignore_for_file: must_be_immutable, deprecated_member_use

/// This file defines the `HomeAdminScreen` widget, which is a comprehensive screen component used in the PillCart application for admin users.
/// It is designed to provide a visually appealing and interactive way for admin users to manage medicines, orders, and other related functionalities.
/// The screen includes features like search functionality, navigation between different sections, and dynamic display of medicines based on categories and companies.
///
/// Key sections of the code include:
/// - The `HomeAdminScreen` class: This widget displays the main screen for admin users, including a search bar, navigation buttons, and dynamic content sections.
/// - The `AppBar` widget: Utilizes the Flutter framework to create the application bar, which includes a custom search bar and navigation buttons.
/// - The `CustomSearchBar` widget: A customizable search bar component that allows admin users to search for medicines or perform other related actions.
/// - The `CustomDropDown` widget: Utilizes the Flutter framework to create dropdown menus for selecting categories and companies, allowing for dynamic filtering of medicines.
/// - The `ListView` widget: Utilizes the Flutter framework to create a list of medicines, dynamically updated based on the selected category or company.
/// - The `GetX` package integration: Utilizes the GetX package for state management, allowing for dynamic updates to the screen based on user input or other application states.
///
/// This file is crucial for providing a comprehensive and interactive way for admin users to manage medicines and orders in the PillCart application, enhancing the overall user experience.
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/screens/add_drug_dialog.dart';
import 'package:pillcart_website/screens/drugs_by_categories_dialog.dart';
import 'package:pillcart_website/screens/drugs_by_company_dialog.dart';
import 'package:pillcart_website/utils/theme.dart';
import 'package:pillcart_website/widgets/buttons/custom_primary_button.dart';
import 'package:pillcart_website/widgets/custom_card.dart';
import 'package:pillcart_website/widgets/custom_drop_down.dart';
import 'package:pillcart_website/widgets/custom_linear_progress_indicator.dart';
import 'package:pillcart_website/widgets/text_fields/custom_search_bar.dart';

class HomeAdminScreen extends StatelessWidget {
  MedicinesController medicinesController = Get.find();

  TextEditingController searchController = TextEditingController();

  HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    medicinesController.onReady();
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.grey[300],
            leadingWidth: double.infinity,
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomSearchBar(
                      onTapOutside: (p0) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      isScure: true,
                      textController: searchController,
                      isSuffix: true,
                      preIcon: FontAwesomeIcons.magnifyingGlass,
                      isPrefix: true,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.2,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/home');
                          medicinesController.onReady();
                        },
                        child: Container(
                          decoration: BoxDecoration(color: kBrand800.withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Drugs',
                            style: customLightTheme.textTheme.bodyMedium?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/orders');
                        },
                        child: Container(
                          decoration: BoxDecoration(color: kBrand800.withOpacity(0.3), borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            'Orders',
                            style: customLightTheme.textTheme.bodyMedium?.copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width < 700 ? 16 : 24, vertical: 16),
            child: Column(
              children: [
                GetBuilder<MedicinesController>(builder: (controller) {
                  return Expanded(
                    child: Column(
                      children: [
                        //? ------Companies and categeories---------
                        width < 900
                            ? Column(
                                children: [
                                  //? ----------------categories----------------
                                  CustomDropDown(
                                    loader: medicinesController.isCategoriesLoading,
                                    icon: FontAwesomeIcons.list,
                                    lable: 'Categories',
                                    items: medicinesController.categories.map((category) {
                                      return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      medicinesController.getAllDrugsByCategory(newValue!.id);
                                      Get.dialog(
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 0),
                                            child: DrugsByCategoriesDialog(),
                                          ),
                                          barrierDismissible: true,
                                          barrierColor: Colors.black.withOpacity(0.7));
                                    },
                                  ),
                                  //? ----------------companies----------------
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  CustomDropDown(
                                    loader: medicinesController.isCompaniesLoading,
                                    icon: FontAwesomeIcons.industry,
                                    lable: 'Companies',
                                    items: medicinesController.companies.map((category) {
                                      return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      medicinesController.getAllDrugsByCompany(newValue!.id);
                                      Get.dialog(
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 0),
                                          child: DrugsByCompanyDialog(),
                                        ),
                                        barrierDismissible: true,
                                        barrierColor: Colors.black.withOpacity(0.7),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  //? ----------------categoris----------------
                                  Expanded(
                                    child: CustomDropDown(
                                      loader: medicinesController.isCategoriesLoading,
                                      icon: FontAwesomeIcons.list,
                                      lable: 'Categories',
                                      items: medicinesController.categories.map((category) {
                                        return DropdownMenuItem(
                                          value: category,
                                          child: Text(category.name),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        medicinesController.getAllDrugsByCategory(newValue!.id);
                                        Get.dialog(DrugsByCategoriesDialog(), barrierDismissible: true, barrierColor: Colors.black.withOpacity(0.7));
                                      },
                                    ),
                                  ),
                                  //? ----------------companies----------------
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Expanded(
                                    child: CustomDropDown(
                                      loader: medicinesController.isCompaniesLoading,
                                      icon: FontAwesomeIcons.industry,
                                      lable: 'Companies',
                                      items: medicinesController.companies.map((category) {
                                        return DropdownMenuItem(
                                          value: category,
                                          child: Text(category.name),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        medicinesController.getAllDrugsByCompany(newValue!.id);
                                        Get.dialog(
                                          DrugsByCompanyDialog(),
                                          barrierDismissible: true,
                                          barrierColor: Colors.black.withOpacity(0.7),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 32,
                        ),
                        //? ----------------in stock----------------
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "In Stock",
                                style: customLightTheme.textTheme.labelLarge?.copyWith(color: kBrand800),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: CPrimaryButton(
                                inTable: false,
                                color: kBrand500,
                                isEnabled: true,
                                buttonText: "Add a Drug",
                                onPressed: () {
                                  Get.dialog(AddDrugDialog(), barrierDismissible: false);
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),

                        //? table header
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: width < 900
                                ? Row(
                                    children: [
                                      //? image
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        width: 50,
                                        height: 16,
                                        clipBehavior: Clip.antiAlias,
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            //? Trade Name
                                            Row(
                                              textBaseline: TextBaseline.alphabetic,
                                              crossAxisAlignment: CrossAxisAlignment.baseline,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Trade & Generic Name',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            //? Trade Name
                                            Row(
                                              textBaseline: TextBaseline.alphabetic,
                                              crossAxisAlignment: CrossAxisAlignment.baseline,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Category & Company',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            //? Trade Name
                                            Row(
                                              textBaseline: TextBaseline.alphabetic,
                                              crossAxisAlignment: CrossAxisAlignment.baseline,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Price & Amount',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          //? Exparation
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              textBaseline: TextBaseline.alphabetic,
                                              crossAxisAlignment: CrossAxisAlignment.baseline,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Expiration Date',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12, color: red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      //? image
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        width: 50,
                                        height: 16,
                                        clipBehavior: Clip.antiAlias,
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      //? Trade Name
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.copyright,
                                              size: 10,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                'Trade Name',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      //? generic name
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.flask,
                                              size: 10,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                'Generic Name',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      //? category
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.list,
                                              size: 10,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                'Category',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      //? company
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.industry,
                                              size: 10,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                'Company',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      //? price
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.moneyBill1,
                                              size: 10,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                'Price',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      //? amount
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.box,
                                              size: 10,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                'Amount',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          width: 16,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          textBaseline: TextBaseline.alphabetic,
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.warning,
                                              size: 10,
                                              color: red,
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                'Expiration Date',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12, color: red),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),

                        const SizedBox(
                          height: 4,
                        ),
                        //?----------------drug table----------------
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                            height: 400,
                            child: medicinesController.isInStockLoading.value == true
                                ? const Center(child: CustomCircularProgressIndicator())
                                : ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                    separatorBuilder: (context, index) => SizedBox(
                                      height: 1.5,
                                      child: Container(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    itemCount: medicinesController.medicines.length,
                                    itemBuilder: (context, index) {
                                      return CustomCard(
                                        medicines: medicinesController.medicines[index],
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          )
          ),
    );
  }
}
