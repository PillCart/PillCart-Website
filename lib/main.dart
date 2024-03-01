/// This file defines the main entry point of the PillCart application, which is a mobile application for managing medicines and orders.
/// It sets up the GetMaterialApp widget, which is the root of the application, and configures various aspects such as theme, navigation, and initial routes.
/// The application uses the GetX package for state management and navigation, providing a clean and efficient way to manage application state and navigate between screens.
///
/// Key sections of the code include:
/// - The `MyApp` class: This is the main widget for the application. It initializes the application and sets up the GetMaterialApp widget with necessary configurations.
/// - The `GetMaterialApp` widget: Configures the application's theme, navigation, and initial routes. It also sets up the initial binding for the application.
/// - The `getPages` list: Defines the routes for the application, including the home screen, orders screen, and search results screen. Each route is associated with a specific screen widget.
/// - The `initialRoute` property: Sets the initial route of the application, which is the home screen in this case.
/// - The `initialBinding` property: Initializes the application's binding, which is used for dependency injection and state management.
///
/// This file is crucial for setting up the application's structure and initial configuration, ensuring a smooth and efficient user experience.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillcart_website/controller/init_binding.dart';
import 'package:pillcart_website/screens/home_admin_screen.dart';
import 'package:pillcart_website/screens/orders_screen.dart';
import 'package:pillcart_website/screens/search_result_screen.dart';
import 'package:pillcart_website/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: customLightTheme,
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      initialBinding: InitBinding(),
      getPages: [
        GetPage(
          name: '/orders',
          page: () => OrdersScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeAdminScreen(),
        ),
        GetPage(
          name: '/search_result',
          page: () => SearchResultsScreen(),
          // binding: MyBinding(),
        ),
      ],
    );
  }
}

