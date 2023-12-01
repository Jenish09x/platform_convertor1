import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/contact_screen/model/contact_model.dart';
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
  List<ContactModel> addDataList = [];

  void changeStep (i) {
    dashIndex = i;
    notifyListeners();
  }

  void addContactData(ContactModel cm) {
    addDataList.add(cm);
    notifyListeners();
  }

  void storeIndex(int index) {
    infoIndex = index;
    notifyListeners();
  }

  void editData(ContactModel c1) {
    addDataList[infoIndex!] = c1;
    notifyListeners();
  }

  void contactDelete() {
    addDataList.removeAt(infoIndex!);
    notifyListeners();
  }

}