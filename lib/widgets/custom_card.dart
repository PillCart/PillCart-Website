// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

/// This file defines the `CustomCard` widget, which is a customizable card component used to display medicine details in the PillCart application.
/// It is designed to showcase various aspects of a medicine, such as trade name, generic name, category, company, price, amount, and expiration date, in a visually appealing and informative manner.
/// The card is interactive, allowing users to tap on it to view more details about the medicine, and it includes icons and text to represent each piece of information clearly.
///
/// Key sections of the code include:
/// - The `CustomCard` class: This widget displays a medicine card with customizable properties such as medicine details and layout adjustments based on screen width.
/// - The `Container` widget: Utilizes the Flutter framework to create the card with a customizable decoration and padding.
/// - The `Row` and `Column` widgets: Organize the medicine details into a structured layout, adapting to different screen sizes for a responsive design.
/// - The `Icon` widget: Displays icons next to each piece of information, providing visual cues to the user about the type of information being displayed.
/// - The `Text` widget: Displays the medicine details, including trade name, generic name, category, company, price, amount, and expiration date, with customizable text styles.
///
/// This file is crucial for providing a user-friendly way to display medicine details in the PillCart application, enhancing the overall user experience.
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/medicines_controller.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/models/medicines_model.dart';
import 'package:pillcart_website/utils/theme.dart';

class CustomCard extends StatelessWidget {
  Medicines medicines;
  String test1 = 'test1';
  String test2 = 'test2';
  MedicinesController medicinesController = Get.find();
  CustomCard({
    super.key,
    required this.medicines,
  });

  String? gender;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
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
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    child: const Image(
                      image: AssetImage(
                        'images/drug1.jpg',
                      ),
                    ),
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
                            const Icon(
                              FontAwesomeIcons.copyright,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                medicines.tradeName.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        //? generic name
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            const Icon(
                              FontAwesomeIcons.flask,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                medicines.genericName.name.toString(),
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
                    height: 32,
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
                        //? category Name
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            const Icon(
                              FontAwesomeIcons.list,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                medicines.category.name.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        //? company name
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            const Icon(
                              FontAwesomeIcons.industry,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                medicines.company.name.toString(),
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
                    height: 32,
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
                        //? price
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            const Icon(
                              FontAwesomeIcons.moneyBill1,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                '${medicines.price.toString()} \$',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        //? amount
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            const Icon(
                              FontAwesomeIcons.box,
                              size: 10,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                medicines.amount >= 1000 ? '${(medicines.amount) / 1000}k unit' : '${medicines.amount.toString()} unit',
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
                    height: 32,
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
                                '${medicines.expiringDay}/${medicines.expiringMonth}/${medicines.expiringYear}',
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
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    child: Image(
                      image: AssetImage(
                        'images/drug${(medicines.id % 13) + 1}.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  //? Trade Name
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            medicines.tradeName.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
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
                        Expanded(
                          child: Text(
                            medicines.genericName.name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
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
                        Expanded(
                          child: Text(
                            medicines.category.name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
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
                        Expanded(
                          child: Text(
                            medicines.company.name.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
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
                        Expanded(
                          child: Text(
                            '${medicines.price.toString()} \$',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
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
                        Expanded(
                          child: Text(
                            medicines.amount >= 1000 ? '${(medicines.amount) / 1000}k unit' : '${medicines.amount.toString()} unit',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
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
                        Expanded(
                          child: Text(
                            '${medicines.expiringDay}/${medicines.expiringMonth}/${medicines.expiringYear}',
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
    );
  }
}
