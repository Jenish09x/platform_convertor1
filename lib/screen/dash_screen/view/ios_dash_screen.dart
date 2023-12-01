import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/screen/call_screen/view/ios_call_screen.dart';
import 'package:platform_convertor/screen/chat_screen/view/ios_chat_screen.dart';
import 'package:platform_convertor/screen/contact_screen/view/ios_contact_screen.dart';
import 'package:platform_convertor/screen/dash_screen/provider/dash_provider.dart';
import 'package:platform_convertor/screen/setting_screen/view/ios_setting_screen.dart';
import 'package:provider/provider.dart';

class IosDashScreen extends StatefulWidget {
  const IosDashScreen({super.key});

  @override
  State<IosDashScreen> createState() => _IosDashScreenState();
}

class _IosDashScreenState extends State<IosDashScreen> {
  DashProvider? providerR;
  DashProvider? providerW;

  List<Widget> l1 = [
    const IosContactScreen(),
    const IosChatScreen(),
    const IosCallScreen(),
    const IosSettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<DashProvider>();
    providerR = context.read<DashProvider>();
    return CupertinoTabScaffold(

      tabBar: CupertinoTabBar(
        onTap: (value) {
          int i =value;
          providerR!.changeStep(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_text),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return l1[
              providerW!.stepIndex
            ];
          },
        );
      },
    );
  }
}
