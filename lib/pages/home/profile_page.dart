import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';
import '../../theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;

    Widget _header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                  child: Image.network(user.profilePhotoUrl!,
                      width: 64)),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, ${user.name}",
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    "@${user.username}",
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              )),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  },
                  child: Image.asset("assets/icons/button_exit.png", width: 20))
            ],
          ),
        )),
      );
    }

    Widget _menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: secondaryTextStyle.copyWith(fontSize: 13)),
            Icon(Icons.chevron_right, color: primaryTextColor)
          ],
        ),
      );
    }

    Widget _content() {
      return Expanded(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        decoration: BoxDecoration(color: backgroundColor3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text("Account",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: _menuItem('Edit Profile')),
            _menuItem('Your Orders'),
            _menuItem('Help'),
            const SizedBox(height: 30),
            Text("General",
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold)),
            _menuItem('Privacy & Policy'),
            _menuItem('Term of Service'),
            _menuItem('Rate App'),
          ],
        ),
      ));
    }

    return Column(
      children: [_header(), _content()],
    );
  }
}
