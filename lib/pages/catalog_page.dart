import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../translations/locale_keys.g.dart';
import '../data/products.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.catalog.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      // GridView - сетка товаров по 2 в ряд
      body: GridView.builder(
        padding: EdgeInsets.all(12.w),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          Product product = products[index];

          return Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                // Кнопка избранного
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.red,
                      size: 24.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        product.isFavorite = !product.isFavorite;
                      });
                    },
                  ),
                ),
                // "Изображение" товара
                Icon(product.icon, size: 60.sp, color: AppColors.primary),
                SizedBox(height: 8.h),
                // nameKey = LocaleKeys.phone и т.д. → .tr() переводит
                Text(product.nameKey.tr(), style: AppTextStyles.body),
                SizedBox(height: 4.h),
                Text('${product.price} ₸', style: AppTextStyles.price),
              ],
            ),
          );
        },
      ),
    );
  }
}
