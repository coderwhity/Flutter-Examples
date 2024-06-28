import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/UserProvider.dart';
import 'package:provider/provider.dart';

class DisplayPageUsingConsumer extends StatefulWidget {
  const DisplayPageUsingConsumer({super.key});

  @override
  State<DisplayPageUsingConsumer> createState() => _DisplayPageUsingConsumerState();
}

class _DisplayPageUsingConsumerState extends State<DisplayPageUsingConsumer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder:(context,userProvider,child){
          return Container(
            child: Center(
              child: Text("Name is ${userProvider.getName}"),
            ),
          );
        }
      ),
    );
  }
}