import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../translations/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Иконка
            Center(
              child: Icon(Icons.store, size: 80.sp, color: AppColors.primary),
            ),
            SizedBox(height: 16.h),

            // Заголовок и приветствие
            Text(LocaleKeys.welcome_title.tr(), style: AppTextStyles.title),
            SizedBox(height: 8.h),
            Text(LocaleKeys.welcome_text.tr(), style: AppTextStyles.caption),
            SizedBox(height: 24.h),

            // Две карточки
            Row(
              children: [
                Expanded(
                  child: buildCard(
                      Icons.local_shipping, LocaleKeys.card_delivery.tr()),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: buildCard(Icons.discount, LocaleKeys.card_sale.tr()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Функция для создания одной карточки
  Widget buildCard(IconData icon, String text) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.sp, color: AppColors.primary),
          SizedBox(height: 8.h),
          Text(text, style: AppTextStyles.body, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
