import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../theme.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/images/gambar_sepatu.png',
    'assets/images/gambar_sepatu.png',
    'assets/images/gambar_sepatu.png'
  ];

  List fimiliarShoes = [
    'assets/images/gambar_sepatu.png',
    'assets/images/gambar_sepatu.png',
    'assets/images/gambar_sepatu.png',
    'assets/images/gambar_sepatu.png',
    'assets/images/gambar_sepatu.png',
    'assets/images/gambar_sepatu.png'
  ];

  int _currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {

    Future<void> showSuccessDialog() async{
      return showDialog(context: context, builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width - (2 * defaultMargin),
        child: AlertDialog(
          backgroundColor: backgroundColor3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          content: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: primaryTextColor))),
              Image.asset("assets/icons/success_icon.png", width: 100),
              const SizedBox(height: 12),
              Text("Hurray :)",
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold
                ),
              ),
              const SizedBox(height: 12),
              Text("Item added successfully", style: secondaryTextStyle),
              const SizedBox(height: 20),
              SizedBox(
                width: 154, height: 44,
                child: TextButton(
                  onPressed: (){}, 
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Text("View My Cart", style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium
                  ),)),
              )
            ]),
          ),
        ),
      ));
    }

    Widget _indicator(int index) {
      return Container(
        width: _currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _currentIndex == index
                ? primaryColor
                : const Color(0xFFC4C4C4)),
      );
    }

    Widget _fimiliarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageUrl)),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget _header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.chevron_left),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((image) => Image.asset(image,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  })),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return _indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget _content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            color: backgroundColor1),
        child: Column(
          children: [
            //NOTE: HEADER
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TERREX URBAN LOW",
                        style: primaryTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        "Hiking",
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  )),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                      if(isWishlist){
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: secondaryColor,
                          content: const Text("Has been added to the Wishlist", textAlign: TextAlign.center,))
                      );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: alertColor,
                          content: const Text("Has been remove from the Wishlist", textAlign: TextAlign.center,))
                      );
                      }
                    },
                    child: Image.asset(isWishlist ? "assets/icons/button_wishlist_light.png" : "assets/icons/button_wishlist.png", width: 46))
                ],
              ),
            ),

            //NOTE: PRICE
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price starts from", style: primaryTextStyle),
                  Text(
                    "\$143,98",
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),

            //NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  Text(
                    "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            //NOTE: FIMILIAR SHOES
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "Fimiliar Shoes",
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: fimiliarShoes.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? defaultMargin : 0),
                          child: _fimiliarShoesCard(image),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            //NOTE: BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/chat_icon.png"))),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: (){
                          showSuccessDialog();
                        }, 
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          backgroundColor: primaryColor
                        ),
                        child: Text("Add to Cart", style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold
                        ),)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [_header(), _content()],
      ),
    );
  }
}