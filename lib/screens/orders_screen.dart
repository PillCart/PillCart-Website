// ignore_for_file: must_be_immutable

/// This file defines the `OrdersScreen` widget, which displays a list of orders available in the PillCart application.
/// It shows a list of order tiles, each representing an order with its details. Users can tap on an order tile to view more details.
/// The screen includes a loading indicator while the orders are being fetched and displays a message if no orders are found.
/// The list of orders is fetched from a backend service and displayed using a `ListView.separated` widget.
///
/// Key sections of the code include:
/// - The `OrdersScreen` class: This is the main widget for displaying the list of orders. It initializes the `CartController` and defines the UI layout.
/// - The `GetBuilder` widget: Used to rebuild the UI when the list of orders changes. It wraps the `ListView.separated` widget that displays the orders.
/// - The `ListView.separated` widget: Dynamically generates a list of `CustomOrderCard` widgets based on the orders fetched from the `CartController`.
/// - The `CustomOrderCard` widget: Represents a single order in the list. It displays the order's details and allows users to tap on it to view more details.
/// - The loading and empty state indicators: Displayed while the orders are being fetched or if no orders are found, respectively.
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/cart_controller.dart.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/utils/theme.dart';
import 'package:pillcart_website/widgets/custom_linear_progress_indicator.dart';
import 'package:pillcart_website/widgets/custom_order_card.dart';
import 'package:pillcart_website/widgets/text_fields/custom_search_bar.dart';

class OrdersScreen extends StatelessWidget {
  CartController cartController = Get.find();
  TextEditingController searchController = TextEditingController();
  OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    cartController.ShowOrderForAdmin();
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
              GetBuilder<CartController>(builder: (controller) {
                return Expanded(
                  child: Column(
                    children: [
                      //? ----------------orders----------------
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Orders",
                              style: customLightTheme.textTheme.labelLarge?.copyWith(color: kBrand800),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      //? table header
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsetsDirectional.only(start: 8),
                              width: 40,
                              child: Text(
                                '#',
                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.calendarCheck,
                                      size: 10,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Order date',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
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
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.coins,
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'Total price',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
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
                              flex: 5,
                              child: Text(
                                'Delivery status',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
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
                              flex: 4,
                              child: Text(
                                'Payment status',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      //?----------------orders table----------------
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[100],
                          ),
                          height: 400,
                          child: cartController.isOrdersLoading.value == true
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
                                  itemCount: cartController.adminOrder!.myOrders.length,
                                  itemBuilder: (context, index) {
                                    return CustomOrderCard(
                                      order: cartController.adminOrder!.myOrders[cartController.adminOrder!.myOrders.length - index - 1],
                                      orderIndex: cartController.adminOrder!.myOrders.length - index - 1,
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
        ),
      ),
    );
  }
}
