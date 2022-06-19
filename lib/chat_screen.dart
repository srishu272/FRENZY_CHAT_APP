import 'package:flutter/material.dart';
import 'package:frenzy_chat_app/chatmessage.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _mgs = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );

    setState(() {
      _mgs.insert((0), message);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.blueAccent),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 9.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Send a message",
                ),
                controller: _textController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: IconButton(
                  onPressed: () {
                    _handleSubmitted(_textController.text);
                  },
                  icon: Icon(Icons.send_rounded)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: ListView.builder(
          itemBuilder: (context, index) => _mgs[index],
          itemCount: _mgs.length,
          padding: const EdgeInsets.all(8.0),
          reverse: true,
        )),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
