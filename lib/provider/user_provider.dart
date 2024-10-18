import 'package:flutter/material.dart';
import 'package:uts_2021110055/models/user.dart';

class UserProvider extends ChangeNotifier{
  final List<User> _users = [];

  List<User> get users => _users;

  void addUser(User user){
    _users.add(user);
    notifyListeners();
  }

  //untuk mengantikan data contact yang sudah ada (prosedur sederhana)
  void editUser(User user){
    final index = _users.indexWhere((element) => element.email == user.email); //cari index elemen halama kontak yang ada dimana id yang kita terima sesuai dengan fungsi
    _users[index] = user;
    notifyListeners();
  }

  void removeUser(User user){
    _users.remove(user);
    notifyListeners();
  }

 void clearUsers() {
    _users.clear();
    notifyListeners();
  }
}
