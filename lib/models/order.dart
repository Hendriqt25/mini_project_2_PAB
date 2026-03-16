import 'package:flutter/material.dart';
import 'items.dart';
import 'dart:math';

class JastipProvider with ChangeNotifier {
  final List<Jastip> _items = [];

  List<Jastip> get items => _items;

  void addItem(String namaBarang, String lokasi, String pemesan, int harga) {
    final newItem = Jastip(
      id: Random().nextDouble().toString(),
      namaBarang: namaBarang,
      lokasiBeli: lokasi,
      namaPemesan: pemesan,
      harga: harga,
    );
    _items.add(newItem);
    notifyListeners();
  }

  void deleteItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateItem(
    String id,
    String namaBarang,
    String lokasi,
    String pemesan,
    int harga,
  ) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      _items[index] = Jastip(
        id: id,
        namaBarang: namaBarang,
        lokasiBeli: lokasi,
        namaPemesan: pemesan,
        harga: harga,
      );
      notifyListeners();
    }
  }

  Jastip findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }
}
