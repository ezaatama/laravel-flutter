import '../models/product_model.dart';

class CartModel {
  
  int? id;
  ProductModel? product;
  int quantity = 0;

  CartModel({
    this.id,
    this.product,
    this.quantity = 0
  });

  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product!.toJson(),
      'quantity': quantity
    };
  }

  double getTotalPrice() {
    return product!.price = quantity as double;
  }
}