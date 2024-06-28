import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/UserProvider.dart';
import 'package:provider/provider.dart';

class DisplayPageWithoutUsingConsumer extends StatefulWidget {
  const DisplayPageWithoutUsingConsumer({super.key});

  @override
  State<DisplayPageWithoutUsingConsumer> createState() =>
      _DisplayPageWithoutUsingConsumerState();
}

class _DisplayPageWithoutUsingConsumerState
    extends State<DisplayPageWithoutUsingConsumer> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Name is ${userProvider.getName}"),
        ),
      ),
    );
  }
}
