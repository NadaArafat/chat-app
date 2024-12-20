import 'package:flutter/material.dart';

import '../models/message_model.dart';

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
          ),
          child: Center(
            child: Text(
              messageModel.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}