import 'package:flutter/material.dart';
import '../theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset('assets/images/gambar_sepatu.png', width: 60),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Terrex Urban Low",
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold
                )
              ),
              Text("\$143,98", style: priceTextStyle,)
            ],
          ),
        ),
        Image.asset("assets/icons/button_wishlist_light.png", width: 34)
      ]),
    );
  }
}