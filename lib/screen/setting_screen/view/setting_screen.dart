
import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/setting_screen/provider/setting_screen_provider.dart';
import 'package:provider/provider.dart';

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
                ?  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                  ),
                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Center(child: Text("Enter Your Name")),
                    enabledBorder: InputBorder.none
                  ),
                  enabled: true,

                ),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Center(child: Text("Enter Your Bio")),
                    enabledBorder: InputBorder.none
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {}, child: const Text("Save")),
                    TextButton(
                        onPressed: () {}, child: const Text("Clear")),
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
    ));
  }
}
