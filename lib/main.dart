import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'core/constants/app_colors.dart';
import 'pages/main_page.dart';

void main() async {
  // Нужно для easy_localization перед запуском
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ru'), Locale('en'), Locale('kk')],
      path: 'assets/translations', // папка с json файлами
      fallbackLocale: const Locale('ru'), // язык по умолчанию
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit - базовый размер дизайна (как в макете)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SRS 4',
          // настройки локализации
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          ),
          home: const MainPage(),
        );
      },
    );
  }
}
