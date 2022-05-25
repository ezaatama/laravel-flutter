import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/page_provider.dart';
import '../../pages/home/chat_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/home/profile_page.dart';
import '../../pages/home/wishlist_page.dart';
import '../../theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icons/cart_icon.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              currentIndex: pageProvider.currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  pageProvider.currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icons/home_icon.png',
                        width: 21,
                        color: pageProvider.currentIndex == 0
                            ? primaryColor
                            : const Color(0xFF808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset('assets/icons/chat_icon.png',
                          width: 20,
                          color: pageProvider.currentIndex == 1
                              ? primaryColor
                              : const Color(0xFF808191)),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset('assets/icons/favorite_icon.png',
                          width: 20,
                          color: pageProvider.currentIndex == 2
                              ? primaryColor
                              : const Color(0xFF808191)),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset('assets/icons/profile_icon.png',
                          width: 18,
                          color: pageProvider.currentIndex == 3
                              ? primaryColor
                              : const Color(0xFF808191)),
                    ),
                    label: '')
              ]),
        ),
      );
    }

    Widget _body(){
      switch (pageProvider.currentIndex){
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: _body()
    );
  }
}
