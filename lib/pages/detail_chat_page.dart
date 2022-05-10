import 'package:flutter/material.dart';
import '../widgets/chat_buble.dart';
import '../theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _header() {
      return PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            backgroundColor: backgroundColor1,
            centerTitle: false,
            title: Row(
              children: [
                Image.asset("assets/images/image_shop_logo_online.png",
                    width: 50),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shoe Store",
                        style: primaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 14)),
                    Text("Online",
                        style: secondaryTextStyle.copyWith(
                            fontWeight: light, fontSize: 14))
                  ],
                )
              ],
            ),
          ));
    }

    Widget _productPreview() {
      return Container(
        width: 225,
        height: 74,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:
                    Image.asset('assets/images/gambar_sepatu.png', width: 54)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("COURT VISIO...",
                      style: primaryTextStyle, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(
                    "\$57,15",
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
            Image.asset("assets/icons/icon_button_exit.png", width: 22)
          ],
        ),
      );
    }

    Widget _chatInput() {
      return Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productPreview(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: backgroundColor4,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: TextFormField(
                            decoration: InputDecoration.collapsed(
                                hintText: 'Type Message....',
                                hintStyle: subtitleTextStyle)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset('assets/icons/icon_send_button.png', width: 45)
                ],
              ),
            ],
          ));
    }

    Widget _content() {
      return ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            ChatBubble(
                text: "Hi, This item is still available?",
                isSender: true,
                hasProduct: true),
            ChatBubble(
                text: "Good night, This item is only available in size 42 and 43",
                isSender: false,)
          ]);
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: _header(),
      bottomNavigationBar: _chatInput(),
    );
  }
}
