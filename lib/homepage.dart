import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frenzy Chat"),
      ),
      body: ChatScreen(),
    );
  }
}
