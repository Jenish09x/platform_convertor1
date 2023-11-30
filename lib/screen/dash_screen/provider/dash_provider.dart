import 'package:flutter/material.dart';

class DashProvider with ChangeNotifier
{
  bool isChangeUi=false;

  // ignore: non_constant_identifier_names
  void changeUi(value){
    isChangeUi=value;
    value=isChangeUi;
    notifyListeners();
  }
}