import 'package:flutter/material.dart';
import '../theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(primaryTextColor),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'Loading',
                  style:
                      primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
              ],
            )),
      );
  }
}