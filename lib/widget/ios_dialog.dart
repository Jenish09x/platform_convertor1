import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/screen/contact_screen/model/contact_model.dart';
import 'package:provider/provider.dart';

import '../screen/contact_screen/provider/contact_provider.dart';

void showCupertinoWidget(BuildContext context, ContactModel c1) {
  TextEditingController txtName = TextEditingController(text: c1.name);
  TextEditingController txtChat = TextEditingController(text: c1.chat);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  showCupertinoDialog(context: context,builder: (context) {
      return Form(
        key: _formKey,
        child: CupertinoAlertDialog(
          title: const Text("Update Contacts"),
          actions: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return Align(alignment: Alignment.bottomCenter,
                          child: CupertinoAlertDialog(
                            title: const Text("Pick Profile Picture"),
                            actions: [
                              CupertinoButton(
                                  onPressed: () async {
                                    ImagePicker picker = ImagePicker();
                                    XFile? image = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    // ignore: use_build_context_synchronously
                                    context.read<ContactProvider>().updateImagePath(image!.path);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Choose Photo")),
                              CupertinoButton(
                                  onPressed: () async {
                                    ImagePicker picker = ImagePicker();
                                    XFile? image = await picker.pickImage(
                                        source: ImageSource.camera);
                                    // ignore: use_build_context_synchronously
                                    context.read<ContactProvider>().updateImagePath(image!.path);
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Take Photo")),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: c1.imagePath != null ||
                      context.read<ContactProvider>().path != null
                      ? CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(File("${c1.imagePath}")),
                  )
                      : CircleAvatar(
                    radius: 80,
                    child: Text(
                      c1.name!.substring(0, 1).toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoTextField(

              controller: txtName,
              cursorColor: CupertinoColors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoTextField(
              controller: txtChat,
              cursorColor: CupertinoColors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton(
              onPressed: () {
                ContactModel c1 = ContactModel();
                c1.name = txtName.text;
                c1.chat = txtChat.text;
                c1.imagePath = context.read<ContactProvider>().path;
                context.read<ContactProvider>().editData(c1);
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
            CupertinoButton(
              onPressed: () {
                context.read<ContactProvider>().contactDelete();
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        ),
      );
    },
  );
}