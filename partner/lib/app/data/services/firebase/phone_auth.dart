import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PhoneAuthService extends GetxService {
  User? fireUser;
  late FirebaseAuth _firebaseAuth;

  Future<PhoneAuthService> init() async {
    _firebaseAuth = FirebaseAuth.instance;
    await checkUserLoggedIn();
    Get.log('$runtimeType ready!');
    return this;
  }

  Future<void> checkUserLoggedIn() async {
    // _analytics.logAppOpen();
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.log('User is currently signed out!');
        fireUser = null;
      } else {
        Get.log('User is signed in!');
        fireUser = user;
      }
    });
  }

  String? verificationId;

  Future<void> verifyPhone(
      {required String phoneNumber,
      required Function(String verId) onSmsSent}) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      Get.log('Auth Exception: ${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      onSmsSent(verId);
      this.verificationId = verId;
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await _firebaseAuth.verifyPhoneNumber(

        /// Make sure to prefix with your country code
        phoneNumber: phoneNumber,

        ///No duplicated SMS will be sent out upon re-entry (before timeout).
        timeout: const Duration(seconds: 60),

        /// If the SIM (with phoneNumber) is in the current device this function is called.
        /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
        /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
        verificationCompleted: verified,

        /// Called when the verification is failed
        verificationFailed: verificationfailed,

        /// This is called after the OTP is sent. Gives a `verificationId` and `code`
        codeSent: smsSent,

        /// After automatic code retrival `tmeout` this function is called
        codeAutoRetrievalTimeout: autoTimeout);
  }

  /// This method is used to logout the `FirebaseUser`
  signOut() async {
    try {
      await _firebaseAuth.signOut();
      // Get.offAllNamed(Routes.LOGIN);
    } on Exception catch (e) {
      Get.log(e.toString());
    }
  }

  /// This method is used to login the user
  ///  `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
  /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
  ///
  ///
  signIn(AuthCredential authCreds) async {
    UserCredential result = await _firebaseAuth.signInWithCredential(authCreds);

    if (result.user != null) {
      // await Get.find<Api>().login();
      // AboutUser? user = await Get.find<ProfileApi>().getCurrentUserProfile();
      // if (user == null)
      //   Get.offAllNamed(Routes.SIGNUP);
      // else {
      //   DrComm.currentUser = user;
      //   Get.offAllNamed(Routes.HOME);
      // }
    } else {
      Get.log("Error");
    }
  }

  /// get the `smsCode` from the user
  /// when used different phoneNumber other than the current (running) device
  /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
  ///
  ///
  signInWithOTP(smsCode, verId) async {
    PhoneAuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: smsCode);
    signIn(authCreds);
  }
}
