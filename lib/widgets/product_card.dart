import 'package:flutter/material.dart';
import '../models/product_model.dart';

import '../pages/product_page.dart';
import '../theme.dart';

class ProductCard extends StatelessWidget {

  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: const Color(0xFFECEDEF)),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.network(
              product.galleries![0].url.toString(),
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category!.name.toString(),
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.name.toString(),
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "\$${product.price}",
                    style: purpleTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
