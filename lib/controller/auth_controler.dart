import 'package:e_commerce_app/helper/services/firestore_user.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthControler extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookAuth _facebookAuth = FacebookAuth.instance;
  String? email, password, name;
  Rxn<User> _user = Rxn<User>();

  String? get getUser => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
  }

  void facebookSignIn() async {
    final LoginResult result = await FacebookAuth.instance.login();
    print(result);

    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      final facebookCredential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      await _auth.signInWithCredential(facebookCredential).then((user) {
        saveUser(user);
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }

  void emailAndPasswordSignIn() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        saveUser(user);
      });
      Get.offAll(HomePage());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void emailAndPasswordSignUp() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(HomePage());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void saveUser(UserCredential user) async {
    await FirestoreUser().addUser(
      UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: name == null ? user.user!.displayName : name,
        profilePic: '',
      ),
    );
  }
}
