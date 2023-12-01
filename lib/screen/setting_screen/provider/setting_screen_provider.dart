import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier
{
  bool isShow=false;
  String? profileImage;


  void checkSwitch(value){
    isShow=value;
    value=isShow;
    notifyListeners();
  }

  void updateProfileImage(String? newPath)
  {
    profileImage=newPath;
    notifyListeners();
  }
}