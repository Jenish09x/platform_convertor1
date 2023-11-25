import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/setting_screen/provider/setting_screen_provider.dart';
import 'package:platform_convertor/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SettingProvider(),)
    ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: screen_routes,
      ),
    ),
  );
}
