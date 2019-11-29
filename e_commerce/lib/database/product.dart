import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  void uploadProduct({String productName, String description, String category, List sizes, List images, double price, int quantity}){
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection(ref).document(productId).setData({
      'name': productName,
      'id': productId,
      'description': description,
      'category': category,
      'quantity': quantity,
      'price': price
    });
  }

  Future<List<DocumentSnapshot>> getBrands() =>
    _firestore.collection(ref).getDocuments().then((snaps){
      return snaps.documents;
  });

  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) => 
   _firestore.collection(ref).where("brandName", isEqualTo: suggestion).getDocuments().then((snap){
     return snap.documents;
   });
}