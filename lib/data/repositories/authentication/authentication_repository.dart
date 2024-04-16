import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:style_hub/data/repositories/user/user_repository.dart';
import 'package:style_hub/features/authentication/screens/login/login.dart';
import 'package:style_hub/features/authentication/screens/signup/verify_email.dart';
import 'package:style_hub/navigation_menu.dart';

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

  /// Get Authenticated User Details
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove Splash Screen
    FlutterNativeSplash.remove();
    // Redirect to the relevant screen
    screenredirect();
  }

  /// Function to Show Relevant Screen
  screenredirect() async {
    final user = _auth.currentUser;
    if (kDebugMode) {
      print(
          '===================== Get Storage Auth Repo =====================');
      print('IsFirstTime: ${deviceStorage.read('IsFirstTime')}');
    }

    if (user != null) {
      user.emailVerified
          ? Get.offAll(() => const NavigationMenu())
          : Get.offAll(
              () => VerifyEmailScreen(email: _auth.currentUser?.email));
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /* ---------------------------- Email & Password Sign In ---------------------------- */

  /// [EmailAuthenticaton] - Login In
  Future<UserCredential> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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
  Future<void> sendEmailVerification() async {
    try {
      await authUser!.sendEmailVerification();
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

  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateEmailAndPassword(
      String email, String password) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await authUser!.reauthenticateWithCredential(credential);
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

  /// [EmailAuthenticaton] - Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  /* ---------------------------- Federated identity & social sign-in ---------------------------- */

  /// [GoogleAuthentication] -GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in to Firebase with the Google [UserCredential]
      return await _auth.signInWithCredential(credentials);
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

  /// [FacebookAuthentication] -FACEBOOK

  /* ---------------------------- ./end Federated identity & social sign-in ---------------------------- */

  /// [LougoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
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

  /// [DeleteUser] - Valid for any authentication.
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(authUser!.uid);
      await _auth.currentUser!.delete();
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
}
