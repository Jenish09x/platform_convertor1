import 'package:flutter/material.dart';
class ContactProvider with ChangeNotifier {
  String? path;
  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();
  int dashIndex = 0;
  int? infoIndex = 0;
  String? imagePath;
  String? profilePath;
  bool isLock = false;


  void changeDate(DateTime? d1){
    date = d1;
    notifyListeners();
  }

  void changeTime(TimeOfDay? d2) {
    time = d2;
    notifyListeners();
  }
  //image
  void updateImagePath(String? newPath) {
    path = newPath;
    notifyListeners();
  }
}