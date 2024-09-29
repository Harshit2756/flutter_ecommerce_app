import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositories/authentication/authentication_repository.dart';

import 'app.dart';

Future<void> main() async {
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

  //- Todo: Init Notification
  //- Todo: Init Analytics
  runApp(
    DevicePreview(
      tools: const [
        DeviceSection(
          frameVisibility: false,
          orientation: false,
        ),
        SystemSection(
          locale: false,
          theme: true,
        ),
        // AccessibilitySection(
        //   accessibleNavigation: false,
        //   boldText: false,
        //   invertColors: false,
        //   textScalingFactor: false,
        // ),
        SettingsSection(),
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
      defaultDevice: Devices.android.samsungGalaxyA50,
      enabled: true,
      builder: (context) => const App(),
    ),
    // const App(),
  );
}
