import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_convertor/screen/contact_screen/model/contact_model.dart';
import 'package:provider/provider.dart';

import '../../../widget/android_dialog.dart';
import '../../contact_screen/provider/contact_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

ContactProvider? providerR;
ContactProvider? providerW;

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.addDataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          providerW!.addDataList[index].imagePath != null
                              ? InkWell(
                                  onTap: () {
                                    ContactModel c1 = ContactModel(
                                        name: providerR!.addDataList[index].name,
                                        phone:
                                            providerR!.addDataList[index].phone,
                                        imagePath: providerR!
                                            .addDataList[index].imagePath);
                                    providerR!.storeIndex(index);
                                    showWidget(context, c1);
                                  },
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: FileImage(File(
                                      "${providerW!.addDataList[index].imagePath}",
                                    )),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    ContactModel c1 = ContactModel(
                                        name: providerR!.addDataList[index].name,
                                        phone:
                                            providerR!.addDataList[index].phone,
                                        imagePath: providerR!
                                            .addDataList[index].imagePath);
                                    providerR!.storeIndex(index);
                                    showWidget(context, c1);
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * 0.18,
                                    width:
                                        MediaQuery.of(context).size.width * 0.20,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${providerW!.addDataList[index].name!.isNotEmpty ? providerW!.addDataList[index].name!.substring(0, 1).toUpperCase() : 0}",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${providerR!.addDataList[index].name}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${providerW!.addDataList[index].chat}",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${providerW!.time!.hour}:${providerW!.time!.minute}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${providerR!.date!.day}/${providerR!.date!.month}/${providerR!.date!.year}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    ));
  }
}
