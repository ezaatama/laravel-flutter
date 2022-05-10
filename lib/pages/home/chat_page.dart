import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      return Expanded(
          child: Container(
              width: double.infinity,
              color: backgroundColor3,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: [
                  ChatTile()
                ],
              )));
    }

    return Column(
      children: [_header(), _content()],
    );
  }
}
