import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/call_screen/view/call_screen.dart';
import 'package:platform_convertor/screen/chat_screen/view/chat_screen.dart';
import 'package:platform_convertor/screen/contact_screen/view/contact_screen.dart';
import 'package:platform_convertor/screen/setting_screen/view/setting_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  bool isTrue=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.deepPurple,
              unselectedLabelColor:Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              labelColor: Colors.deepPurple,
              tabs: const[
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
              Switch(value: isTrue, onChanged: (value) {

              },),
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