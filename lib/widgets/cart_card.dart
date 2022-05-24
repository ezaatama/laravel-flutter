import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../theme.dart';

class CartCard extends StatelessWidget {
  
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
                    image: DecorationImage(
                        image: NetworkImage(cart.product!.galleries![0].url.toString()))),
              ),
              const SizedBox(width: 12),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product!.name.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  Text("\$${cart.product!.price}", style: priceTextStyle)
                ],
              )),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: Image.asset("assets/icons/button_add.png", width: 16)),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  GestureDetector(
                    onTap: (){
                      cartProvider.reduceQuantity(cart.id!);
                    },
                    child: Image.asset("assets/icons/button_min.png", width: 16))
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  cartProvider.removeCart(cart.id!);
                },
                child: Image.asset("assets/icons/remove_icon.png", width: 10)),
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
