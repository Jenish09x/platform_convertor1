import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtChat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const CircleAvatar(
                  radius: 70,
                  child: Icon(Icons.add_a_photo_outlined),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: txtName,
                  decoration: const InputDecoration(
                    prefixIcon:Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                    label: Text("Full Name"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
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
                ElevatedButton(onPressed: () {

                }, child: const Text("Save"),),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
