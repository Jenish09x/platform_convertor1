import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/screen/contact_screen/view/ios_contact_screen.dart';
import 'package:platform_convertor/screen/dash_screen/view/dash_screen.dart';
import 'package:platform_convertor/screen/setting_screen/view/ios_setting_screen.dart';

// ignore: non_constant_identifier_names
Map<String,WidgetBuilder>screen_routes={
  "/":(context) => const DashScreen(),
};


// ignore: non_constant_identifier_names
Map<String,WidgetBuilder> ios_screen_routes={
  '/':(context) => const IosSettingScreen(),
};
