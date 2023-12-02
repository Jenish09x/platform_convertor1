import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/call_screen/view/call_screen.dart';
import 'package:platform_convertor/screen/chat_screen/view/chat_screen.dart';
import 'package:platform_convertor/screen/contact_screen/view/contact_screen.dart';
import 'package:platform_convertor/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_convertor/screen/setting_screen/view/setting_screen.dart';
import 'package:platform_convertor/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? providerR;
  DashProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR=context.read<DashProvider>();
    providerW=context.watch<DashProvider>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: const TabBar(
              indicatorColor: Colors.deepPurple,
              labelColor: Colors.deepPurple,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.person_add_alt,
                    size: 25,
                  ),
                ),
                Tab(
                  child: Text(
                    "CHATS",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "CALLS",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "SETTINGS",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text("Platform Converter"),
            actions: [
              Consumer(
                builder: (BuildContext context, value, Widget? child) {
                  return Switch(
                    value: context.read<ThemeProvider>().changeUI,
                    onChanged: (value) {
                      context.read< ThemeProvider>().changeAppUi(value);
                    },
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: const TabBarView(
            children: [
              ContactScreen(),
              ChatScreen(),
              CallScreen(),
              SettingScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
