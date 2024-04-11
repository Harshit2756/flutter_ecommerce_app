import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';

import '../../../features/authentication/screens/onboarding/onboarding_screen.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticatorRepository extends GetxController {
  static AuthenticatorRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenredirect();
  }

  /// Function to Show Relevant Screen
  screenredirect() async {
    // Local Storage

    if (kDebugMode) {
      print(
          '===================== Get Storage Auth Repo =====================');
      print('IsFirstTime: ${deviceStorage.read('IsFirstTime')}');
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* ---------------------------- Email & Password Sign In ---------------------------- */

  /// [EmailAuthenticaton] - Sign In
  /// [EmailAuthenticaton] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      } on FirebaseAuthException catch (e) {
        throw HFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw HFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const HFormatException();
      } on PlatformException catch (e) {
        throw HPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again later';
    }
  }

  /// [EmailVerification] - Mail Verification
  /// [ReAuthenticate] - ReAuthenticate User
  /// [EmailAuthenticaton] - Forgot Password

  /* ---------------------------- Federated identity & social sign-in ---------------------------- */

  /// [GoogleAuthentication] -GOOGLE
  /// [FacebookAuthentication] -FACEBOOK

  /* ---------------------------- ./end Federated identity & social sign-in ---------------------------- */

  /// [LougoutUser] - Valid for any authentication.
  /// [DeleteUser] - Valid for any authentication.
}
