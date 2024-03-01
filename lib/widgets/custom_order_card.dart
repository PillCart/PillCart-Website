// ignore_for_file: must_be_immutable

/// This file defines the `CustomOrderCard` widget, which is a customizable card component used to display order details in the PillCart application.
/// It is designed to showcase various aspects of an order, such as order index, date, total price, delivery status, and payment status, in a visually appealing and informative manner.
/// The card is interactive, allowing users to tap on it to view more details about the order, and it includes buttons for updating the delivery and payment status of the order.
///
/// Key sections of the code include:
/// - The `CustomOrderCard` class: This is the main widget for displaying the order details. It initializes the `CartController` and defines the UI layout based on the order's properties.
/// - The `GestureDetector` widget: Wraps the card to make it tappable, triggering the display of order details when tapped.
/// - The `GetBuilder` widget: Used to rebuild the UI when the order details change, ensuring that the displayed information is always up-to-date.
/// - The `CPrimaryButton` widget: Represents buttons for updating the delivery and payment status of the order. It is customizable and triggers specific actions when pressed.
/// - The conditional rendering: Based on the screen width, the card displays the order details in a row or a column, adapting to different screen sizes for a responsive design.
///
/// This file is crucial for providing a user-friendly way to display and interact with order details, enhancing the overall user experience of the PillCart application.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/cart_controller.dart.dart';
import 'package:pillcart_website/helper/constant.dart';
import 'package:pillcart_website/models/MyOrderModel.dart';
import 'package:pillcart_website/screens/order_detailes_screen.dart';
import 'package:pillcart_website/utils/theme.dart';
import 'package:pillcart_website/widgets/buttons/custom_primary_button.dart';

class CustomOrderCard extends StatelessWidget {
  CartController cartController = Get.put(CartController(), permanent: true);
  MyOrderElement order;
  int orderIndex;
  CustomOrderCard({
    super.key,
    required this.order,
    required this.orderIndex,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        cartController.ShowdetailesOfOrder(order.id);
        Get.dialog(Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height * 0.2),
          child: OrderDetailesScreen(order: order),
        ));
      },
      child: GetBuilder<CartController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: width > 330
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.only(start: 4),
                        width: 40,
                        child: Text(
                          '${orderIndex + 1}',
                          style: customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        //? date
                        flex: 3,
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                '${order.day} / ${order.month} / ${order.year}',
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
                        //? total price
                        flex: 2,
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                '${order.totalPrice} \$',
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
                        //? delivery
                        flex: 5,
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                  order.deliveryStatus == 'in preparation'
                                      ? 'Preparing...'
                                      : order.deliveryStatus == 'sent'
                                          ? 'Sent'
                                          : 'Recevied',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: order.deliveryStatus != 'orderReceived' ? customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12) : customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12, color: Colors.green[400], fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              width: 0,
                            ),
                            cartController.adminOrder!.myOrders[orderIndex].deliveryStatus == 'orderReceived'
                                ? Container()
                                : Expanded(
                                    flex: 3,
                                    child: CPrimaryButton(
                                      inTable: true,
                                      buttonText: cartController.adminOrder!.myOrders[orderIndex].deliveryStatus == 'in preparation'
                                          ? 'Sent'
                                          : cartController.adminOrder!.myOrders[orderIndex].deliveryStatus == 'sent'
                                              ? 'Received'
                                              : '',
                                      onPressed: cartController.adminOrder!.myOrders[orderIndex].deliveryStatus == 'in preparation'
                                          ? () {
                                              cartController.changeDeliveryStatusToSent(order.id);
                                              cartController.onReady();
                                              cartController.update();
                                            }
                                          : cartController.adminOrder!.myOrders[orderIndex].deliveryStatus == 'sent'
                                              ? () {
                                                  cartController.changeDeliveryStatusToRecived(order.id);
                                                  cartController.onReady();
                                                  cartController.update();
                                                }
                                              : () {},
                                      color: kBrand600,
                                      isEnabled: true,
                                    ),
                                  ),
                            const SizedBox(
                              width: 8,
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
                        //? delivery
                        flex: 4,
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(order.paymentStatus == 'paid' ? 'Paid' : 'Unpaid', maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: order.paymentStatus == 'Unpaid' ? customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12) : customLightTheme.textTheme.labelSmall?.copyWith(fontSize: 12, color: Colors.yellow[600], fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            cartController.adminOrder!.myOrders[orderIndex].paymentStatus == 'paid'
                                ? Container()
                                : Expanded(
                                    flex: 3,
                                    child: CPrimaryButton(
                                      inTable: true,
                                      buttonText: cartController.adminOrder!.myOrders[orderIndex].paymentStatus == 'Unpaid' ? 'Paid' : '',
                                      onPressed: cartController.adminOrder!.myOrders[orderIndex].paymentStatus == 'Unpaid'
                                          ? () {
                                              cartController.changePaymentStatusToPaid(order.id);
                                              cartController.onReady();
                                            }
                                          : () {},
                                      color: kBrand600,
                                      isEnabled: true,
                                    ),
                                  ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
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
                                        Expanded(
                                          child: Text(
                                            order.deliveryStatus,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: customLightTheme.textTheme.bodyLarge?.copyWith(color: Colors.black, height: 0.5),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    '- Order Status:',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customLightTheme.textTheme.labelSmall?.copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      order.deliveryStatus == 'in preparation'
                                          ? 'Preparing...'
                                          : order.deliveryStatus == 'sent'
                                              ? 'Sent'
                                              : 'Recevied',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customLightTheme.textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: order.deliveryStatus == 'in preparation'
                                              ? Colors.black
                                              : order.deliveryStatus == 'sent'
                                                  ? kBrand800
                                                  : Colors.green[800]),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    '- Payment Status: ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customLightTheme.textTheme.labelSmall?.copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      order.paymentStatus == 'paid' ? 'Paid' : 'Unpaid',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customLightTheme.textTheme.bodySmall?.copyWith(color: order.paymentStatus == 'paid' ? Colors.yellow[700] : Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
