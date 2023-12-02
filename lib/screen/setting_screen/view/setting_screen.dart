import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/screen/setting_screen/provider/setting_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingProvider? providerR;
  SettingProvider? providerW;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.person_outline),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Update Profile Data",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  const Spacer(),
                  Switch(
                    value: providerR!.isShow,
                    onChanged: (value) {
                      providerR!.checkSwitch(value);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              (providerR!.isShow == true)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Consumer<SettingProvider>(builder: (context, value, child) => InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => BottomSheet(
                                    onClosing: () {},
                                    builder: (context) => SizedBox(
                                      height: 200,
                                      child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                ImagePicker imgPiker = ImagePicker();
                                                XFile? image = await imgPiker.pickImage(
                                                    source: ImageSource.gallery);
                                                providerR!.updateProfileImage(image!.path);
                                              },
                                              icon: const Icon(Icons.image)),
                                          IconButton(
                                              onPressed: () async {
                                                ImagePicker imgPiker = ImagePicker();
                                                XFile? image = await imgPiker.pickImage(
                                                    source: ImageSource.camera);
                                                providerR!.updateProfileImage(image!.path);
                                              },
                                              icon: const Icon(Icons.camera_alt)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: value.profileImage!= null
                                    ? FileImage(File(value.profileImage!))
                                    : null,
                              ),
                            ),
                            ),
                          ],
                        ),
                         TextField(
                          controller: txtName,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              label: Center(child: Text("Enter Your Name")),
                              enabledBorder: InputBorder.none),
                          enabled: true,
                        ),
                         TextField(
                           controller: txtBio,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              label: Center(child: Text("Enter Your Bio")),
                              enabledBorder: InputBorder.none),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  final SharedPreferences shr = await SharedPreferences.getInstance();
                                  shr.setString("name", txtName.text);
                                }, child: const Text("Save")),
                            TextButton(
                                onPressed: () {

                                }, child: const Text("Clear")),
                          ],
                        )
                      ],
                    )
                  : Container(),
              Row(
                children: [
                  const Icon(Icons.person_outline),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Theme",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Change Theme",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  const Spacer(),
                  Consumer<ThemeProvider>(
                    builder: (context, value, child) => Switch(
                      value: value.isLight,
                      onChanged: (value1) {
                        ShareHelper shr = ShareHelper();
                        shr.setTheme(value1);
                        value.changeTheme();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
