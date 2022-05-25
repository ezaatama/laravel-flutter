import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/services/message_service.dart';
import '../widgets/chat_buble.dart';
import '../theme.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleMessage() async {
      await MessageService().addMessage(
          user: authProvider.user,
          isFromUser: true,
          product: widget.product,
          message: messageController.text);

      setState(() {
        widget.product = UnintializedProductModel();
        messageController.text = '';
      });
    }

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
                child: Image.network(
                    widget.product.galleries![0].url.toString(),
                    width: 54)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.product.name.toString(),
                      style: primaryTextStyle, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(
                    "\$${widget.product.price}",
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    widget.product = UnintializedProductModel();
                  });
                },
                child:
                    Image.asset("assets/icons/icon_button_exit.png", width: 22))
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
              widget.product is UnintializedProductModel
                  ? const SizedBox()
                  : _productPreview(),
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
                            controller: messageController,
                            style: primaryTextStyle,
                            decoration: InputDecoration.collapsed(
                                hintText: 'Type Message....',
                                hintStyle: subtitleTextStyle)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: handleMessage,
                      child: Image.asset('assets/icons/icon_send_button.png',
                          width: 45))
                ],
              ),
            ],
          ));
    }

    Widget _content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  children: snapshot.data!.map((MessageModel message) => ChatBubble(
                    isSender: message.isFromUser!,
                    text: message.message!,
                    product: message.product,
                  )).toList()
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: _header(),
      bottomNavigationBar: _chatInput(),
      body: _content(),
    );
  }
}
