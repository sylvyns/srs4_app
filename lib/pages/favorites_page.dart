import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../translations/locale_keys.g.dart';
import '../data/products.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    // берём только те товары, которые в избранном
    List<Product> favorites = products.where((p) => p.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.favorites.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: favorites.isEmpty
          // если список пустой
          ? Center(
              child: Text(LocaleKeys.no_favorites.tr(),
                  style: AppTextStyles.caption),
            )
          // если есть товары
          : ListView.builder(
              padding: EdgeInsets.all(12.w),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                Product product = favorites[index];

                return Card(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: ListTile(
                    leading: Icon(product.icon,
                        size: 36.sp, color: AppColors.primary),
                    title: Text(product.nameKey.tr(), style: AppTextStyles.body),
                    subtitle:
                        Text('${product.price} ₸', style: AppTextStyles.price),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: AppColors.red),
                      onPressed: () {
                        setState(() {
                          product.isFavorite = false; // удалить из избранного
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
