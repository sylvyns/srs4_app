import 'package:flutter/material.dart';

import '../translations/locale_keys.g.dart';

// Модель товара
class Product {
  final String nameKey; // ключ для перевода (из LocaleKeys)
  final int price;
  final IconData icon;
  bool isFavorite;

  Product({
    required this.nameKey,
    required this.price,
    required this.icon,
    this.isFavorite = false,
  });
}

// Демонстрационные данные (без базы данных)
List<Product> products = [
  Product(nameKey: LocaleKeys.phone, price: 250000, icon: Icons.phone_android),
  Product(nameKey: LocaleKeys.laptop, price: 450000, icon: Icons.laptop),
  Product(nameKey: LocaleKeys.headphones, price: 30000, icon: Icons.headphones),
  Product(nameKey: LocaleKeys.watch, price: 80000, icon: Icons.watch),
  Product(nameKey: LocaleKeys.camera, price: 200000, icon: Icons.camera_alt),
  Product(nameKey: LocaleKeys.tablet, price: 180000, icon: Icons.tablet_mac),
];
