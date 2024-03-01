// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/utils/theme.dart';

import 'package:pillcart_website/widgets/custom_card.dart';

class DrugsByCategoriesDialog extends StatelessWidget {
  MedicinesController medicinesController = Get.find();
  final formkey = GlobalKey<FormState>();

  DrugsByCategoriesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: GetBuilder<MedicinesController>(
        builder: (controller) {
          return medicinesController.isDrugByCategoryLoading.value != true
              ? medicinesController.drugByCategory.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                                            //constraints: BoxConstraints(maxWidth: 400),
                                            //image
                                            // clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            width: 50,
                                            height: 16,
                                            clipBehavior: Clip.antiAlias,
                                            padding:const EdgeInsets.all(0),
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
                                            //constraints: BoxConstraints(maxWidth: 400),
                                            //image
                                            // clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            width: 50,
                                            height: 16,
                                            clipBehavior: Clip.antiAlias,
                                            padding:const EdgeInsets.all(0),
                                          ),
                                        const  SizedBox(
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
                                              const  Icon(
                                                  FontAwesomeIcons.industry,
                                                  size: 10,
                                                ),
                                              const  SizedBox(width: 4),
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
                                              const  SizedBox(width: 4),
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
                                              const  Icon(
                                                  FontAwesomeIcons.box,
                                                  size: 10,
                                                ),
                                              const  SizedBox(width: 4),
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
                                      )),
                          ),

                          SizedBox(
                            height: (medicinesController.drugByCategory.length * 66),
                            child: medicinesController.isDrugByCategoryLoading.value == true
                                ?const Center(child: CircularProgressIndicator())
                                : ListView.separated(
                                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                    separatorBuilder: (context, index) => SizedBox(
                                      height: 1.5,
                                      child: Container(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    itemCount: medicinesController.drugByCategory.length,
                                    itemBuilder: (context, index) {
                                      return CustomCard(
                                        medicines: medicinesController.drugByCategory[index],
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      padding:const EdgeInsets.all(16),
                      child:const Text('There is no Drugs in this category'),
                    )
              :const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
