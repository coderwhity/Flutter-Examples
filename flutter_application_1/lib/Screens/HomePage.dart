import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/UserProvider.dart';
import 'package:flutter_application_1/Screens/DisplayPage.dart';
import 'package:flutter_application_1/Screens/DisplayPage2.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    UserProvider userProviderListening =
        Provider.of<UserProvider>(context, listen: true);
    UserProvider userProviderNotListening =
        Provider.of<UserProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider Example"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: "Enter name"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String name = _nameController.text;
                        if (name.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DisplayPageUsingConsumer()));
                          Provider.of<UserProvider>(context, listen: false)
                              .setName(name);
                        } else {
                          print("Name is not valid.");
                        }
                      },
                      child: Text("Submit - Page using Consumer")),
                  ElevatedButton(
                      onPressed: () {
                        String name = _nameController.text;
                        if (name.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DisplayPageWithoutUsingConsumer()));
                          Provider.of<UserProvider>(context, listen: false)
                              .setName(name);
                        } else {
                          print("Name is not valid.");
                        }
                      },
                      child: Text("Submit - Page without using Consumer")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
