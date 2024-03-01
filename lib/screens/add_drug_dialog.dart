import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/utils/theme.dart';
import 'package:pillcart_website/widgets/buttons/custom_outline_button.dart';
import 'package:pillcart_website/widgets/buttons/custom_primary_button.dart';
import 'package:pillcart_website/widgets/text_fields/custom_text_form_field.dart';

class AddDrugDialog extends StatelessWidget {
  final formkey = GlobalKey<FormState>();

  AddDrugDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GetBuilder<MedicinesController>(
        builder: (controller) {
          return SizedBox(
            width: width < 800 ? width * 0.75 : width * 0.6,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add a drug",
                            style: customLightTheme.textTheme.displaySmall?.copyWith(
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        isScure: false,
                        textController: controller.tradeNameController,
                        label: 'trade name',
                        isSuffix: false,
                        preIcon: FontAwesomeIcons.solidCopyright,
                        validateMessage: 'Enter your phone number',
                        isPrefix: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        controller: controller,
                        isScure: false,
                        textController: controller.genericNameController,
                        label: 'generic name',
                        isSuffix: false,
                        preIcon: FontAwesomeIcons.flask,
                        validateMessage: 'Enter a strong password',
                        isPrefix: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        controller: controller,
                        isScure: false,
                        textController: controller.categoryController,
                        label: 'category',
                        isSuffix: false,
                        preIcon: FontAwesomeIcons.list,
                        validateMessage: 'Enter a strong password',
                        isPrefix: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        controller: controller,
                        isScure: false,
                        textController: controller.companyController,
                        label: 'company',
                        isSuffix: false,
                        preIcon: FontAwesomeIcons.industry,
                        validateMessage: 'Enter a strong password',
                        isPrefix: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: controller,
                              isScure: false,
                              textController: controller.priceController,
                              label: 'price',
                              isSuffix: false,
                              preIcon: FontAwesomeIcons.moneyBill1,
                              validateMessage: 'Enter a strong password',
                              isPrefix: true,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: controller,
                              isScure: false,
                              textController: controller.amountController,
                              label: 'amount',
                              isSuffix: false,
                              preIcon: FontAwesomeIcons.box,
                              validateMessage: 'Enter a strong password',
                              isPrefix: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Expiration Date',
                            textAlign: TextAlign.center,
                            style: customLightTheme.textTheme.bodySmall?.copyWith(
                              color: kBrand800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: controller,
                              isScure: false,
                              textController: controller.expiringYearController,
                              label: 'year',
                              isSuffix: false,
                              preIcon: FontAwesomeIcons.calendar,
                              validateMessage: 'Enter a strong password',
                              isPrefix: true,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: controller,
                              isScure: false,
                              textController: controller.expiringMonthController,
                              label: 'month',
                              isSuffix: false,
                              preIcon: FontAwesomeIcons.calendarDay,
                              validateMessage: 'Enter a strong password',
                              isPrefix: true,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: controller,
                              isScure: false,
                              textController: controller.expiringDayController,
                              label: 'day',
                              isSuffix: false,
                              preIcon: FontAwesomeIcons.solidCalendarDays,
                              validateMessage: 'Enter a strong password',
                              isPrefix: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CPrimaryButton(
                              inTable: false,
                              color: kBrand600,
                              isEnabled: true,
                              buttonText: "Add to stock",
                              onPressed: () async {
                                //controller.getAllCategory();
                                if (formkey.currentState!.validate()) {
                                  controller.addMedicine();
                                  controller.getAlldrugs();
                                  controller.getAllCategory();
                                  controller.getAllCompanies();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: COutlineButton(
                              color: kBrand600,
                              buttonText: "Cancel",
                              onPressed: () {
                                Get.back();
                                controller.clearFields();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
