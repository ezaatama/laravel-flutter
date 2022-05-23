import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wishlist_provider.dart';
import '../models/product_model.dart';
import '../theme.dart';

class WishlistCard extends StatelessWidget {
  
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

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
          child: Image.network(product.galleries![0].url.toString(), width: 60),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name.toString(),
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold
                )
              ),
              Text("\$${product.price}", style: priceTextStyle,)
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            wishlistProvider.setProduct(product);
          },
          child: Image.asset("assets/icons/button_wishlist_light.png", width: 34))
      ]),
    );
  }
}