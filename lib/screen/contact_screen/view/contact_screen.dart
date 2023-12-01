import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/screen/contact_screen/provider/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  ContactProvider? providerR;
  ContactProvider? providerW;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtChat = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    providerR=context.read<ContactProvider>();
    providerW=context.watch<ContactProvider>();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Column(
                  children: [
                    Consumer<ContactProvider>(builder: (context, value, child) => InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomSheet(
                            onClosing: () {},
                            builder: (context) => SizedBox(
                              height: 200,
                              child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        ImagePicker imgPiker = ImagePicker();
                                        XFile? image = await imgPiker.pickImage(
                                            source: ImageSource.gallery);
                                        providerR!.updateImagePath(image!.path);
                                      },
                                      icon: const Icon(Icons.image)),
                                  IconButton(
                                      onPressed: () async {
                                        ImagePicker imgPiker = ImagePicker();
                                        XFile? image = await imgPiker.pickImage(
                                            source: ImageSource.camera);
                                        providerR!.updateImagePath(image!.path);
                                      },
                                      icon: const Icon(Icons.camera_alt)),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                          radius: 70,
                          backgroundImage: value.path!= null
                              ? FileImage(File(value.path!))
                              : null,
                        ),
                    ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if(value==null||value==value.isEmpty)
                        {
                          const Text("Pleas add name");
                        }
                      return null;
                    },
                    controller: txtName,
                    decoration: const InputDecoration(
                      prefixIcon:Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                      label: Text("Full Name"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // validator: (value) => ,
                  controller: txtContact,
                  decoration: const InputDecoration(
                    prefixIcon:Icon(Icons.call_outlined),
                    border: OutlineInputBorder(),
                    label: Text("Phone Number"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtChat,
                  decoration: const InputDecoration(
                    prefixIcon:Icon(Icons.message_outlined),
                    border: OutlineInputBorder(),
                    label: Text("Chat Conversation"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Icon(Icons.date_range),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Pick Date"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Icon(Icons.watch_later_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Pick Time"),
                  ],
                ),
                // ElevatedButton(onPressed: () {
                //
                // }, child: const Text("Save"),),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}