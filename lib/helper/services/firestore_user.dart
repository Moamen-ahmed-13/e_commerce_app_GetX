import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _usersCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(UserModel userModel) async {
    return await _usersCollectionRef.doc(userModel.userId).set(
          userModel.toJson(),
        );
  }

  Future<DocumentSnapshot> getUser(String userId)async =>await _usersCollectionRef.doc(userId).get();
}
