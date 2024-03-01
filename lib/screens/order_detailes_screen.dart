// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

/// This file defines the `OrderDetailesScreen` widget, which displays detailed information about a specific order in the PillCart application.
/// It shows the order's details including the list of medicines ordered, their quantities, and prices. Users can view the total price and the order date.
/// The screen includes a loading indicator while the order details are being fetched and displays a message if no details are found.
/// The order details are fetched from a backend service and displayed using a combination of `Column`, `Row`, and `ListView.separated` widgets.
///
/// Key sections of the code include:
/// - The `OrderDetailesScreen` class: This is the main widget for displaying the order details. It initializes the `CartController` and defines the UI layout.
/// - The `GetBuilder` widget: Used to rebuild the UI when the order details change. It wraps the `Column` widget that displays the order details.
/// - The `ListView.separated` widget: Dynamically generates a list of `OrderDetailRow` widgets based on the order details fetched from the `CartController`.
/// - The `OrderDetailRow` widget: Represents a single row in the order details list. It displays the medicine's name, quantity, and price.
/// - The loading and empty state indicators: Displayed while the order details are being fetched or if no details are found, respectively.
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/cart_controller.dart.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/models/MyOrderModel.dart';
import 'package:pillcart_website/utils/theme.dart';
import 'package:pillcart_website/widgets/custom_linear_progress_indicator.dart';

class OrderDetailesScreen extends StatelessWidget {

  CartController cartController = Get.find();
  MyOrderElement order;

  OrderDetailesScreen({super.key, 
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 40, 12, 2),
            child: GetBuilder<CartController>(builder: (controller) {
              return Column(
                children: [
                  //? header
                  const Opacity(
                    opacity: 0.7,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your Bill',
                              style: TextStyle(
                                fontSize: 24,
                                color: kBrand800,
                                fontFamily: 'Lexend_Bold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //? table
                  Expanded(
                    child: Column(
                      children: [
                        //? table header
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                            const  SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'trade name',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'Quantity',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'price',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //? table rows
                        cartController.isOrderDetailesLoading.value
                            ? const Expanded(child: Center(child: CustomCircularProgressIndicator()))
                            : Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) {
                                            return Container(
                                              height: 1,
                                              color: Colors.grey,
                                            );
                                          },
                                          itemCount: cartController.detailsOrder!.detailsForOrder.length,
                                          itemBuilder: (contxet, index) {
                                            return SizedBox(
                                              height: 50,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 8,
                                                    child: Text(
                                                      '-',
                                                      style: customLightTheme.textTheme.labelSmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      padding:const EdgeInsets.symmetric(horizontal: 8),
                                                      child: Text(
                                                        cartController.detailsOrder!.detailsForOrder[index].tradeName,
                                                        style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding:const EdgeInsetsDirectional.only(end: 2, start: 8),
                                                          child: Text(
                                                            cartController.detailsOrder!.detailsForOrder[index].amount.toString(),
                                                            style: customLightTheme.textTheme.labelSmall
                                                                ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          'unit',
                                                          style: customLightTheme.textTheme.labelSmall
                                                              ?.copyWith(color: kBrand800, fontSize: 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding:const EdgeInsetsDirectional.only(end: 2, start: 8),
                                                          child: Text(
                                                            (cartController.detailsOrder!.detailsForOrder[index].price *
                                                                    cartController.detailsOrder!.detailsForOrder[index].amount)
                                                                .toString(),
                                                            style: customLightTheme.textTheme.labelSmall
                                                                ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          '\$',
                                                          style: customLightTheme.textTheme.labelSmall
                                                              ?.copyWith(color: kBrand800, fontSize: 16),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            textBaseline: TextBaseline.alphabetic,
                                            crossAxisAlignment: CrossAxisAlignment.baseline,
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.coins,
                                                size: 20,
                                                color: kBrand800,
                                              ),
                                             const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                '${order.totalPrice} \$',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.bodyLarge?.copyWith(color: Colors.black, height: 0.5),
                                              )
                                            ],
                                          ),
                                          Row(
                                            textBaseline: TextBaseline.alphabetic,
                                            crossAxisAlignment: CrossAxisAlignment.baseline,
                                            children: [
                                              const Icon(
                                                FontAwesomeIcons.calendarCheck,
                                                size: 20,
                                                color: kBrand800,
                                              ),
                                             const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                '${order.day}/${order.month}/${order.year}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: customLightTheme.textTheme.bodyLarge?.copyWith(color: Colors.black, height: 0.5),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.decal,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    splashRadius: 24,
                    hoverColor: Colors.transparent,
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: 24,
                      color: kBrand800,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}