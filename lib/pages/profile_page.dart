import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../translations/locale_keys.g.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notifications = true; // переключатель уведомлений

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.profile.tr()),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          // Аватар
          Center(
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 60.sp, color: AppColors.white),
            ),
          ),
          SizedBox(height: 12.h),

          // Имя пользователя
          Center(
            child: Text(LocaleKeys.user_name.tr(),
                style: AppTextStyles.subtitle),
          ),
          SizedBox(height: 24.h),

          // Настройки
          Text(LocaleKeys.settings.tr(), style: AppTextStyles.subtitle),
          SizedBox(height: 8.h),

          SwitchListTile(
            title: Text(LocaleKeys.notifications.tr(),
                style: AppTextStyles.body),
            value: notifications,
            onChanged: (value) {
              setState(() {
                notifications = value;
              });
            },
          ),

          // Переключатель языка
          ListTile(
            leading: const Icon(Icons.language, color: AppColors.primary),
            title: Text(LocaleKeys.language.tr(), style: AppTextStyles.body),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale('ru'));
                },
                child: const Text('RU'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale('kk'));
                },
                child: const Text('KZ'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.setLocale(const Locale('en'));
                },
                child: const Text('EN'),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Информация о приложении
          ListTile(
            leading: const Icon(Icons.info, color: AppColors.primary),
            title: Text(LocaleKeys.about.tr(), style: AppTextStyles.body),
            subtitle:
                Text(LocaleKeys.about_text.tr(), style: AppTextStyles.caption),
          ),
        ],
      ),
    );
  }
}
