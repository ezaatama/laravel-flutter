import 'package:flutter/material.dart';
import '../theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: const Text("Checkout Success"),
        elevation: 0,
      );
    }

    Widget _content() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/empty_cart_icon.png", width: 80),
          const SizedBox(height: 20),
          Text(
            "You made a transaction",
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 12),
          Text(
            "Stay at home while we\n prepare your dream shoes",
            style: secondaryTextStyle,
            textAlign: TextAlign.center,
          ),
          Container(
            width: 196,
            height: 44,
            margin: EdgeInsets.only(
              top: defaultMargin
            ),
            child: TextButton(
              onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              child: Text(
                "Order Other Shoes",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              )),
          ),
          Container(
            width: 196,
            height: 44,
            margin: EdgeInsets.only(
              top: defaultMargin
            ),
            child: TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF39374B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              child: Text(
                "View My Order",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              )),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: _header(),
      body: _content(),
    );
  }
}
