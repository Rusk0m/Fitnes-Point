import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final num calories;
  final num protein;
  final num fat;
  final num fiber;
  final num carbohydrates;
  final num salt;
  final num sugar;


  Product({
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
    required this.salt,
    required this.sugar,
    required this.fiber
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      name: data['name'],
      calories: data['calories'],
      protein: data['protein'],
      fat: data['fat'],
      carbohydrates: data['carbohydrates'],
      salt: data['salt'],
      sugar: data['sugar'],
      fiber: data['fiber'],
    );
  }
}
