import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fitnes_point/theme/app_text_styles.dart';

class MyCart extends StatelessWidget {


  const MyCart({super.key, required this.title, required this.colorBorder, this.subtitle, required this.myIcon});
  final String title;
  final String? subtitle;
  final Color colorBorder;
  final IconData myIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:const BorderRadius.all(Radius.circular(12)),
          border:  Border.all(color: colorBorder, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Icon(myIcon, size: 40,color: colorBorder,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(title, textAlign: TextAlign.right, style: AppTextStyle.body),
                    if (subtitle != null)
                      Text(subtitle!,textAlign: TextAlign.right, style: AppTextStyle.subtitle),
                    //Text(subtitle!, ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

