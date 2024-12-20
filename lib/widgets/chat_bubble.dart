import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messageModel});

  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          decoration: const BoxDecoration(
            color:kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
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


