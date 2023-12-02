import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/screen/contact_screen/model/contact_model.dart';
import 'package:platform_convertor/screen/contact_screen/provider/contact_provider.dart';
import 'package:platform_convertor/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class IosContactScreen extends StatefulWidget {
  const IosContactScreen({super.key});

  @override
  State<IosContactScreen> createState() => _IosContactScreenState();
}

ContactProvider? providerR;
ContactProvider? providerW;

class _IosContactScreenState extends State<IosContactScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtChat = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtTime = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ContactProvider>();
    providerW = context.watch<ContactProvider>();
    return CupertinoPageScaffold(
      navigationBar:  CupertinoNavigationBar(
        middle: const Text(
          "Platform Converter",
        ),
        trailing:  CupertinoSwitch(
          value: context.read<ThemeProvider>().changeUI,
          onChanged: (value) {
            context.read<ThemeProvider>().changeAppUi(value);
          },
        ),
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                          ]),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoTextFormFieldRow(
                    validator: (value) {
                      if(value==null || value.isEmpty)
                      {
                        return "Please enter a name";
                      }
                      return null;
                    },
                    controller: txtName,
                    prefix: const Icon(CupertinoIcons.person),
                    placeholder: "Full Name",
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: CupertinoColors.inactiveGray,
                        width: 1,
                      ),
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    validator: (value) {
                      if(value==null || value.isEmpty)
                      {
                        return "Please enter a phone";
                      }
                      return null;
                    },
                    controller: txtContact,
                    prefix: const Icon(CupertinoIcons.phone),
                    placeholder: "Phone Number",
                    keyboardType: TextInputType.number,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: CupertinoColors.inactiveGray,
                        width: 1,
                      ),
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    controller: txtChat,
                    prefix: const Icon(CupertinoIcons.chat_bubble_text),
                    placeholder: "Chat Conversation",
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: CupertinoColors.inactiveGray,
                        width: 1,
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${providerR!.date?.day}/${providerR!.date?.month}/${providerR!.date?.year}",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => SizedBox(
                                height: 200,
                                child: CupertinoDatePicker(
                                  initialDateTime: providerR!.date,
                                  backgroundColor: CupertinoColors.inactiveGray,
                                  onDateTimeChanged: (value) {
                                    providerR!.changeDate(value);
                                  },
                                  minimumDate: DateTime(2001),
                                  minimumYear: 2001,
                                  maximumDate: DateTime(2050),
                                  maximumYear: 2050,
                                ),
                              ),
                            );
                          },
                          child: const Icon(CupertinoIcons.calendar)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      "Time : ${providerR!.time!.hour}:${providerR!.time!.minute}",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => SizedBox(
                              height: 200,
                              child: CupertinoTimerPicker(
                                backgroundColor: CupertinoColors.inactiveGray,
                                onTimerDurationChanged: (Duration value) {
                                  List<String> l1 = value.toString().split(':');
                                  TimeOfDay? t1 = TimeOfDay(
                                      hour: int.parse(l1[0]),
                                      minute: int.parse(l1[1]));
                                  providerR!.changeTime(t1);
                                },
                                initialTimerDuration: Duration(
                                    hours: providerR!.time!.hour,
                                    minutes: providerR!.time!.minute),
                              ),
                            ),
                          );
                        },
                        child: const Icon(CupertinoIcons.time)),
                  ]),
                  const SizedBox(height: 20,),
                  CupertinoButton.filled(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      right: 40,
                      left: 40,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    child: const Text("SAVE"),
                    onPressed: () {
                      if(_formKey.currentState!.validate())
                      {
                        ContactModel cm = ContactModel(
                          name: txtName.text,
                          chat: txtChat.text,
                          phone: txtContact.text,
                          date: txtDate.text,
                          time: txtTime.text,
                          imagePath: providerW!.path,
                        );
                        providerR!.updateImagePath(null);
                        providerR!.addContactData(cm);
                        providerW!.dashIndex;
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}