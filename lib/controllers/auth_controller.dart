import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes_app/controllers/todo_contoller.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../models/users_model.dart';
import '../services.dart/helper.dart';
import '../services.dart/user_api.dart';
import 'global_bindings.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final user = Rxn<User>();
  final profile = Rxn<UsersModel>();

  bool onResendModal = false;
  final loginLoading = true.obs;

  String? appleName;

  Future<void> signIn(
    String platform, {
    String? email,
    String? password,
    UsersModel? user,
  }) async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      switch (platform) {
        case "google":
          await signInWithGoogle();
          break;
        case "apple":
          await signInWithApple();
          break;
        case "emailSignIn":
          await signInWithEmail(email!, password!);
          EasyLoading.dismiss();
          break;
        case "emailSignUp":
          await signUpWithEmail(email!, password!, user!);
          break;
        default:
          Helper.showError(
            "not_implemented_tr".tr,
            '${platform.toUpperCase()} sign in is not implemented yet.',
          );
          EasyLoading.dismiss();
          break;
      }
    } catch (err) {
      debugPrint(err.toString());
      EasyLoading.dismiss();
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    onResendModal = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // if (!_auth.currentUser!.emailVerified) {
      //   final result = await VerifyModal.open(_auth.currentUser!);
      //   if (result != null) {
      //     Helper.showToast('verification_link_sent'.tr);
      //   }
      //   return;
      // }
      return;
    } on FirebaseAuthException catch (err) {
      Helper.showError("error".tr, err.code.tr);
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signUpWithEmail(String email, String password, UsersModel user) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await userCredential.user!.sendEmailVerification();
      // await signOut();
      user = user.copyWith(id: userCredential.user!.uid);
      final result = await UserApi.createUser(user);
      if (!result) {
        throw "user_creation_failed".tr;
      }
      profile.value = user;
      Get.back();
      Helper.showToast('registration_successful'.tr);
    } on FirebaseAuthException catch (err) {
      Helper.showError("error".tr, err.code.tr);
      rethrow;
    } catch (err) {
      Helper.showError("error".tr, err.toString().tr);
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (err) {
      if (err.code != "unknown") Helper.showError("error".tr, err.code.tr);
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = Helper.sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      if (appleCredential.givenName != null && appleCredential.familyName != null) {
        appleName = "${appleCredential.givenName} ${appleCredential.familyName}";
      }

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await _auth.signInWithCredential(oauthCredential);
    } on FirebaseAuthException catch (err) {
      Helper.showError("error".tr, err.code.tr);
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      try {
        final googleSignIn = GoogleSignIn();
        if (await googleSignIn.isSignedIn()) {
          await googleSignIn.disconnect();
        }
      } catch (_) {}

      await _auth.signOut();
      Get.delete<ToDoController>();
    } catch (err) {
      debugPrint("Signout error : $err");
    }

    GlobalBindings.resetProfileControllers(isLogin: false);
    EasyLoading.dismiss();
  }
}
