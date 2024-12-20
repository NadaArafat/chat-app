import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_for_friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static const id = 'chat_page';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late String email;

  void _submitMessage() {
    messages.add({
      kMessage: _controller.text,
      kCreatedAt: DateTime.now(),
      'id': email,
    });
    _controller.clear();
  }

  void _scrollToEnd() {
    _scrollController.jumpTo(
      0,
    );
  }

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/scholar.png",
                      width: 50,
                      height: 50,
                    ),
                    const Text(
                      "chat",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                centerTitle: true,
                backgroundColor: kPrimaryColor,
                automaticallyImplyLeading: false,
              ),
              body: Column(children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: messagesList.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBubble(
                              messageModel: messagesList[index],
                            )
                          : ChatBubbleForFriend(
                              messageModel: messagesList[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (data) {
                      _submitMessage();
                      _scrollToEnd();
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _submitMessage();
                          _scrollToEnd();
                        },
                        color: kPrimaryColor,
                        icon: const Icon(
                          Icons.send,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: 'Send Message',
                    ),
                  ),
                ),
              ]),
            );
          } else {
            return Scaffold(
              body: const Text('Loading...'),
            );
          }
        });
  }
}
