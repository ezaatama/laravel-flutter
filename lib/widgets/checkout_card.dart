import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: NetworkImage(cart.product!.galleries![0].url.toString()))
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cart.product!.name.toString(), style: primaryTextStyle.copyWith(
                  fontWeight: semiBold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text("\$${cart.product!.price}", style: priceTextStyle,)
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text("${cart.quantity} Items", style: secondaryTextStyle.copyWith(fontSize: 12),)
        ],
      ),
    );
  }
}