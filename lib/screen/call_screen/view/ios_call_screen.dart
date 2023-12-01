import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../contact_screen/provider/contact_provider.dart';

class IosCallScreen extends StatefulWidget {
  const IosCallScreen({super.key});

  @override
  State<IosCallScreen> createState() => _IosCallScreenState();
}

class _IosCallScreenState extends State<IosCallScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return   CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "Platform Converter",
            style: TextStyle(fontSize: 20),
          )), child: Text(""),
      // child: ListView.builder(
      //   itemCount: providerW!.addDataList.length,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Container(
      //         height: MediaQuery.of(context).size.height * 0.10,
      //         width: MediaQuery.of(context).size.width * 0.10,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             children: [
      //               providerW!.addDataList[index].imagePath != null
      //                   ? CircleAvatar(
      //                 radius: 25,
      //                 backgroundImage: FileImage(File(
      //                   "${providerW!.addDataList[index].imagePath}",
      //                 )),
      //               )
      //                   : Container(
      //                 height: MediaQuery.of(context).size.height * 0.18,
      //                 width: MediaQuery.of(context).size.width * 0.20,
      //                 decoration: const BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     color: CupertinoColors.systemTeal
      //                 ),
      //                 child: Align(
      //                   alignment: Alignment.center,
      //                   child: Text(
      //                     "${providerW!.addDataList[index].name!.isNotEmpty ? providerW!.addDataList[index].name!.substring(0, 1).toUpperCase() : 0}",
      //                     style: const TextStyle(
      //                         fontSize: 20),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 width: 20,
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "${providerR!.addDataList[index].name}",
      //                     style: const TextStyle(
      //                       fontSize: 15,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   const SizedBox(
      //                     height: 10,
      //                   ),
      //                   Text(
      //                     "${providerW!.addDataList[index].phone}",
      //                     style:
      //                     const TextStyle(fontSize: 14,),
      //                   ),
      //                 ],
      //               ),
      //               const Spacer(),
      //               IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.phone_fill),)
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}