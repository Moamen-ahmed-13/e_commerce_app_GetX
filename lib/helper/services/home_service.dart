import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoriesCollectionRef =FirebaseFirestore.instance.collection('Category');
  final CollectionReference _bestSellingCollectionRef =FirebaseFirestore.instance.collection('Products');
  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await _categoriesCollectionRef.get();
    return value.docs;
  }
  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _bestSellingCollectionRef.get();
    return value.docs;
  }}