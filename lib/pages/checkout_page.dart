import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/checkout_card.dart';
import '../theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    PreferredSizeWidget _header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: const Text("Checkout Details"),
      );
    }

    Widget _content() {
      return ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            //NOTE: LIST ITEMS
            Container(
                margin: EdgeInsets.only(top: defaultMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "List Items",
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                    Column(
                      children: cartProvider.carts.map((cart) => CheckoutCard(cart)).toList(),
                    )
                  ],
                )),

            //NOTE: ADDRESS DETAILS
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: backgroundColor4,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address Details",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/icons/store_location_icon.png',
                            width: 40,
                          ),
                          Image.asset('assets/icons/line_icon.png', height: 30),
                          Image.asset(
                            'assets/icons/location_icon.png',
                            width: 40,
                          )
                        ],
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Store Location",
                            style: secondaryTextStyle.copyWith(
                                fontSize: 12, fontWeight: light),
                          ),
                          Text(
                            "Adidas Core",
                            style:
                                primaryTextStyle.copyWith(fontWeight: medium),
                          ),
                          SizedBox(height: defaultMargin),
                          Text(
                            "Your Address",
                            style: secondaryTextStyle.copyWith(
                                fontSize: 12, fontWeight: light),
                          ),
                          Text(
                            "Marsemoon",
                            style:
                                primaryTextStyle.copyWith(fontWeight: medium),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            //NOTE: PAYMENT SUMMARY
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: backgroundColor4,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Summary",
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Quantity",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "${cartProvider.totalItems()} Items",
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Product Price",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "\$${cartProvider.totalPrice()}",
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        "Free",
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(
                    thickness: 1,
                    color: Color(0xFF2E3141),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: priceTextStyle.copyWith(fontWeight: semiBold),
                      ),
                      Text(
                        "\$${cartProvider.totalPrice()}",
                        style: priceTextStyle.copyWith(fontWeight: semiBold),
                      )
                    ],
                  )
                ],
              ),
            ),

            //NOTE: CHECKOUT BUTTON
            SizedBox(height: defaultMargin),
            const Divider(
              thickness: 1,
              color: Color(0xFF2E3141),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: defaultMargin),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/checkout-success', (route) => false);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Text("Checkout Now",
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 16))),
            )
          ]);
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: _header(),
      body: _content(),
    );
  }
}
