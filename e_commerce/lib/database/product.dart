import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  void uploadProduct(String productName, String description, String category, List sizes, double price, int quantity){
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection(ref).document(productId).setData({
      'name': productName,
      'id': productId,
      'description': description,
      'sizes': sizes,
      'category': category,
      'quantity': quantity,
      'price': price
    });
  }

  Future<List<DocumentSnapshot>> getProducts() =>
    _firestore.collection(ref).getDocuments().then((snaps){
      return snaps.documents;
  });

  Future<List<DocumentSnapshot>> getSuggestion(String query) =>
    _firestore.collection(ref).where("name", arrayContains: query).getDocuments().then((snaps){
      return snaps.documents;
    });
}