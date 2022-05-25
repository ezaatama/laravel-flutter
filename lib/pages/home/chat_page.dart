import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/services/message_service.dart';

import '../../theme.dart';
import '../../widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget _header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          "Message Support",
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget _emptyChat() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/headset_icon.png", width: 80),
            const SizedBox(height: 20),
            Text(
              "Opss no message yet?",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
            Text("You have never done a transaction",
                style: secondaryTextStyle),
            const SizedBox(height: 20),
            SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text('Explore Store',
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium)),
                ))
          ],
        ),
      ));
    }

    Widget _content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return _emptyChat();
              }

              return Expanded(
                  child: Container(
                      width: double.infinity,
                      color: backgroundColor3,
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        children: [
                          ChatTile(snapshot.data![snapshot.data!.length - 1])
                        ],
                      )));
            } else {
              return _emptyChat();
            }
          });
    }

    return Column(
      children: [_header(), _content()],
    );
  }
}
