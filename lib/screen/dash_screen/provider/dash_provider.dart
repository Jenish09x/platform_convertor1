import 'package:flutter/material.dart';

class DashProvider with ChangeNotifier
{
  bool isChangeUi=false;
  int stepIndex=0;

  // ignore: non_constant_identifier_names
  void changeUi(value){
    isChangeUi=value;
    notifyListeners();
  }
  void changeStep(i){
    stepIndex=i;
    notifyListeners();
  }
}