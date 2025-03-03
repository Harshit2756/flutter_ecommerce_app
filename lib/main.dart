import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:device_preview/device_preview.dart';
import 'device_preview_button.dart';


import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositories/authentication/authentication_repository.dart';

import 'app.dart';

void main() async {
  // Add Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Init Local Storage
  await GetStorage.init();

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp app) => Get.put(AuthenticatorRepository()));

  runApp(
    DevicePreview(
      backgroundColor: Colors.white,
      tools: const [
      CustomPlugin(
          apkDownloadUrl: "https://github.com/Harshit2756/flutter_ecommerce_app/releases/download/v1.0.7/app-release.apk",
          sourceCodeUrl: "https://github.com/Harshit2756/flutter_ecommerce_app/archive/refs/tags/v1.0.7.zip",
        ),
        DeviceSection(frameVisibility: true, orientation: false, virtualKeyboard: true, model: true),
        SettingsSection(backgroundTheme: false, toolsTheme: true),
        // SystemSection(locale: false, theme: false),
        DevicePreviewScreenshot(),
      ],
      devices: [
        Devices.android.samsungGalaxyA50,
        Devices.android.samsungGalaxyNote20,
        Devices.android.samsungGalaxyS20,
        Devices.android.samsungGalaxyNote20Ultra,
        Devices.android.onePlus8Pro,
        Devices.android.sonyXperia1II,
        Devices.ios.iPhoneSE,
        Devices.ios.iPhone12,
        Devices.ios.iPhone12Mini,
        Devices.ios.iPhone12ProMax,
        Devices.ios.iPhone13,
        Devices.ios.iPhone13ProMax,
        Devices.ios.iPhone13Mini,
        Devices.ios.iPhoneSE,
      ],
      enabled: true,
      builder: (context) => const App(), 
    ),
  );
}
