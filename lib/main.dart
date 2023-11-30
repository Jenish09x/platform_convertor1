import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/dash_screen/view/dash_screen.dart';
import 'package:platform_convertor/screen/setting_screen/provider/setting_screen_provider.dart';
import 'package:platform_convertor/utils/theme_data.dart';
import 'package:platform_convertor/utils/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.changeTheme();
          return MaterialApp(
            theme: value.isLight ? lightTheme : darkTheme,
            debugShowCheckedModeBanner: false,
            home: const DashScreen(),
          );
        },
      ),
    ),
  );
}
