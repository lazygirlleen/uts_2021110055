import 'package:uts_2021110055/models/product.dart';

class CartModel {
  final Product product;
  int quantity; 

  CartModel({
    required this.product,
    required this.quantity,
  });

  int get totalPrice => (product.price * quantity).toInt();

}
