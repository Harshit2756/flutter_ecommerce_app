import 'package:ecommerce_app/bindings/general_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: HAppTheme.lightTheme,
      darkTheme: HAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: HColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
