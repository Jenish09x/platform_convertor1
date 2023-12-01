import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';
import '../../contact_screen/provider/contact_provider.dart';
import '../provider/setting_screen_provider.dart';

class IosSettingScreen extends StatefulWidget {
  const IosSettingScreen({super.key});

  @override
  State<IosSettingScreen> createState() => _IosSettingScreenState();
}

class _IosSettingScreenState extends State<IosSettingScreen> {
  SettingProvider? providerW;
  SettingProvider? providerR;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<SettingProvider>();
    providerW = context.watch<SettingProvider>();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Platform Converter",
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(CupertinoIcons.person),
                const SizedBox(width: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Profile",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Update Profile Data",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: providerR!.isShow!,
                  onChanged: (value) {
                    providerW!.isShow = value;
                    providerR!.checkSwitch(value);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            (providerR!.isShow == true)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Consumer<ContactProvider>(
                            builder: (context, value, child) {
                              return CircleAvatar(
                                radius: 70,
                                backgroundColor: CupertinoColors.activeBlue,
                                backgroundImage: value.path != null
                                    ? FileImage(File(value.path!))
                                    : null,
                              );
                            },
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              CupertinoButton(
                                  onPressed: () async {
                                    ImagePicker imgPiker = ImagePicker();
                                    XFile? image = await imgPiker.pickImage(
                                        source: ImageSource.gallery);
                                    // ignore: use_build_context_synchronously
                                    context
                                        .read<ContactProvider>()
                                        .updateImagePath(image!.path);
                                  },
                                  child: const Icon(CupertinoIcons.photo)),
                              CupertinoButton(
                                  onPressed: () async {
                                    ImagePicker imgPiker = ImagePicker();
                                    XFile? image = await imgPiker.pickImage(
                                        source: ImageSource.camera);
                                    // ignore: use_build_context_synchronously
                                    context
                                        .read<ContactProvider>()
                                        .updateImagePath(image!.path);
                                  },
                                  child: const Icon(CupertinoIcons.camera)),
                            ]
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CupertinoTextField.borderless(
                        textAlign: TextAlign.center,
                        placeholder: "Enter Your Name",
                      ),
                      const CupertinoTextField.borderless(
                        textAlign: TextAlign.center,
                        placeholder: "Enter Your Bio",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            child: const Text(
                              "SAVE",
                              style: TextStyle(color: CupertinoColors.black),
                            ),
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            child: const Text(
                              "CLEAR",
                              style: TextStyle(color: CupertinoColors.black),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  )
                : Container(
                    height: 10,
                  ),
            Container(
              height: 2,
              width: MediaQuery.sizeOf(context).width,
              color: CupertinoColors.inactiveGray,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(CupertinoIcons.sun_max),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Theme",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "change Theme",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => CupertinoSwitch(
                    value: value.isLight,
                    onChanged: (value1) {
                      ShareHelper shr = ShareHelper();
                      shr.setTheme(value1);
                      value.changeTheme();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
