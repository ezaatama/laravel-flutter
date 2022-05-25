import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

import '../models/product_model.dart';
import '../pages/detail_chat_page.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailChatPage(UnintializedProductModel())));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/image_shop_logo.png', width: 54),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Shoe Store",
                          style: primaryTextStyle.copyWith(fontSize: 15)),
                      Text("Good Night, This item is on....",
                          style: secondaryTextStyle.copyWith(fontWeight: light),
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Text("Now",
                          style: secondaryTextStyle.copyWith(fontSize: 10)),
                const SizedBox(width: 12),
                const Divider(
                  thickness: 1,
                  color: Color(0xFF2B2939),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
