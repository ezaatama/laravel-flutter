import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo/models/product_model.dart';
import '../theme.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({Key? key, this.text = '', this.isSender = false, this.product})
      : super(key: key);

  final String text;
  bool isSender;
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    Widget _productPreview() {
      return Container(
        width: 230,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isSender ? backgroundColor5 : backgroundColor4,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isSender ? 12 : 0),
                topRight: Radius.circular(isSender ? 0 : 12),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12))),
        child: Column(children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(product!.galleries![0].url.toString(),
                      width: 70)),
              const SizedBox(width: 8),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product!.name!, style: primaryTextStyle),
                  const SizedBox(height: 4),
                  Text("\$${product!.price}",
                      style: priceTextStyle.copyWith(fontWeight: medium))
                ],
              ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: (){}, 
                style: TextButton.styleFrom(
                  backgroundColor: transparent,
                  side: BorderSide(color: primaryColor), shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                child: Text("Add to cart", style: purpleTextStyle)),
              const SizedBox(width: 8),
              TextButton(
                onPressed: (){}, 
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                child: Text("Buy Now", style: GoogleFonts.poppins(
                  color: backgroundColor5,
                  fontWeight: medium
                )))
            ],
          )
        ]),
      );
    }

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            product is UnintializedProductModel ? const SizedBox() : _productPreview(),
            Row(
              mainAxisAlignment:
                  isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: isSender ? backgroundColor5 : backgroundColor4,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isSender ? 12 : 0),
                            topRight: Radius.circular(isSender ? 0 : 12),
                            bottomLeft: const Radius.circular(12),
                            bottomRight: const Radius.circular(12))),
                    child: Text(
                      text,
                      style: primaryTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
