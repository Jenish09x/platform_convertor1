import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier
{
  bool isShow=false;

  void checkSwitch(value){
    isShow=value;
    value=isShow;
    notifyListeners();
  }
}