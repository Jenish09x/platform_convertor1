import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/contact_screen/provider/contact_provider.dart';
import 'package:platform_convertor/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_convertor/screen/setting_screen/provider/setting_screen_provider.dart';
import 'package:platform_convertor/utils/app_routes.dart';
import 'package:platform_convertor/utils/ios_theme_data.dart';
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
          ChangeNotifierProvider(
            create: (context) => DashProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ContactProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            value.changeTheme();
            return context.read<ThemeProvider>().changeUI
                ? CupertinoApp(
                    theme: value.isLight ? darkThemeIos : lightThemeIos,
                    debugShowCheckedModeBanner: false,
                    routes: ios_screen_routes,
                  )
                : MaterialApp(
                    theme: value.isLight ? darkTheme : lightTheme,
                    debugShowCheckedModeBanner: false,
                    routes: screen_routes,
                  );
          },
        )),
  );
}
