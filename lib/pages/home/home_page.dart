import 'package:flutter/material.dart';
import '../../widgets/product_card.dart';
import '../../theme.dart';
import '../../widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Alex",
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    "@alexkeinn",
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/images/image_profile.png"))
              )
            )
          ],
        ),
      );
    }

    Widget _categories(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
                ),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor
                ),
                child: Text("All Shoes", style: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
                ),
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor
                  ),
                  color: transparent
                ),
                child: Text("Running", style: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              )
            ],
          ),
        ),
      );
    }

    Widget _popularProductsTitle(){
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold
          ),
        ),
      );
    }

    Widget _popularProducts(){
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard()
                ],
              )
            ],
          ),
        )
      );
    }

    Widget _newArrivalsTitle(){
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin
        ),
        child: Text(
          'New Arrival',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold
          ),
        ),
      );
    }

    Widget _newArrivals(){
      return Container(
        margin: const EdgeInsets.only(
          top: 14
        ),
        child: Column(
          children: [
            ProductTile(),
            ProductTile(),
            ProductTile()
          ],
        ),
      );
    }

    return ListView(
      children: [_header(), _categories(), _popularProductsTitle(), _popularProducts(), _newArrivalsTitle(), _newArrivals()],
    );
  }
}
