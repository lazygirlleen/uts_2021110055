import 'package:flutter/material.dart';
import 'package:uts_2021110055/models/product.dart';
import 'package:uts_2021110055/models/cart.dart';

class CartProvider with ChangeNotifier {
  final List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;

  // Menambahkan produk ke dalam keranjang
  void addProduct(Product product, int quantity) {
    // Cek apakah produk sudah ada di keranjang
    final index = _cartItems.indexWhere((item) => item.product.name == product.name);
    if (index >= 0) {
      // Jika produk sudah ada, tambahkan quantity-nya
      _cartItems[index].quantity++;
    } else {
      // Jika produk belum ada, tambahkan produk sebagai item baru
      _cartItems.add(CartModel(product: product, quantity: 1));
    }
    notifyListeners();
  }

  // Menghapus produk dari keranjang
  void removeProduct(Product product) {
    _cartItems.removeWhere((item) => item.product.name == product.name);
    notifyListeners();
  }

  // Mengurangi quantity produk di dalam keranjang
  void decreaseQuantity(Product product) {
    final index = _cartItems.indexWhere((item) => item.product.name == product.name);
    if (index >= 0 && _cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } else {
      // Jika quantity hanya 1, hapus item dari keranjang
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  // Mendapatkan total harga dari semua item di keranjang
  int get totalPrice {
    return _cartItems.fold(0, (total, item) => total + item.totalPrice);
  }

  // Mendapatkan total jumlah item di keranjang
  int get totalItems {
    return _cartItems.fold(0, (total, item) => total + item.quantity);
  }

  // Membersihkan keranjang
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
