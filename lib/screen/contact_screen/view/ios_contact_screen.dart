import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/screen/contact_screen/provider/contact_provider.dart';
import 'package:provider/provider.dart';

class IosContactScreen extends StatefulWidget {
  const IosContactScreen({super.key});

  @override
  State<IosContactScreen> createState() => _IosContactScreenState();
}

ContactProvider? providerR;
ContactProvider? providerW;

class _IosContactScreenState extends State<IosContactScreen> {
  @override
  Widget build(BuildContext context) {
    providerR=context.read<ContactProvider>();
    providerW=context.watch<ContactProvider>();
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      shape: BoxShape.circle),
                ),
                CupertinoTextFormFieldRow(
                  prefix: const Icon(CupertinoIcons.person),
                  placeholder: "Full Name",
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: CupertinoColors.inactiveGray,
                      width: 1,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Full Name";
                    } else {
                      return null;
                    }
                  },
                  // controller: ,
                ),
                CupertinoTextFormFieldRow(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Phone Number";
                    } else {
                      return null;
                    }
                  },
                  // controller: ,
                ),
                CupertinoTextFormFieldRow(
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
                Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${providerR!.date?.day}/${providerR!.date?.month}/${providerR!.date?.year}",
                  style: const TextStyle(color: CupertinoColors.black),
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
                // Row(children: [
                //   const Align(
                //     alignment: Alignment.topLeft,
                //     child: Text(
                //       "Contacts",
                //       style: TextStyle(
                //           color: CupertinoColors.black,
                //           fontSize: 25,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                //   const Spacer(),
                //   Text(
                //     "Time : ${providerR!.time!.hour}:${providerR!.time!.minute}}",
                //     style: const TextStyle(color: CupertinoColors.black),
                //   ),
                //   const SizedBox(
                //     height: 20,
                //   ),
                //   GestureDetector(
                //       onTap: () {
                //         showCupertinoModalPopup(
                //           context: context,
                //           builder: (context) => SizedBox(
                //             height: 200,
                //             child: CupertinoDatePicker(
                //               backgroundColor: CupertinoColors.inactiveGray,
                //               initialDateTime: providerR!.time,
                //               mode: CupertinoDatePickerMode.time,
                //               use24hFormat: true,
                //               onDateTimeChanged: (value) {
                //                 providerR!.changeTime(value);
                //               },
                //             ),
                //           ),
                //         );
                //       },
                //       child: const Icon(CupertinoIcons.time)),
                // ]),
                CupertinoButton.filled(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    right: 30,
                    left: 30,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  child: const Text("SAVE"),
                  onPressed: () {},
                )
            ],
          ),
        ),
      ),
      ),
    );
  }
}