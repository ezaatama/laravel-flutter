import 'package:flutter/material.dart';
import '../theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: backgroundColor4, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/gambar_sepatu.png"))),
              ),
              const SizedBox(width: 12),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Terrex Urban Low",
                    style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text("\$143,98", style: priceTextStyle)
                ],
              )),
              Column(
                children: [
                  Image.asset("assets/icons/button_add.png", width: 16),
                  Text(
                    "2",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  Image.asset("assets/icons/button_min.png", width: 16)
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Image.asset("assets/icons/remove_icon.png", width: 10),
              const SizedBox(width: 4),
              Text(
                "Remove",
                style: alertTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
