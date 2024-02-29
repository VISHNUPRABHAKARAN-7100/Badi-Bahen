import 'package:badi_bahen/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:badi_bahen/bottom_nav/view/bottom_nav_screen.dart';
import 'package:badi_bahen/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'advisory/controller/advisory_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // Set status bar color
        statusBarColor: ColorConstants.mainOrangeColor,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdvisoryController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavScreen(),
      ),
    );
  }
}
