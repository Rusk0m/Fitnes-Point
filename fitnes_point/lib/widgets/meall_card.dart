import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fitnes_point/theme/app_colors.dart';
import 'package:fitnes_point/theme/app_text_styles.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.title, this.subtitle, required this.icon, required this.iconColor})
      : super(key: key);

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal:12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow:const[
            BoxShadow(
              color: Colors.black,
              blurRadius: 1.5,
            )
          ] ,
        ),
        child: Row(
          children: [
            Flexible(
              child: ListTile(
                leading: Icon(icon,color:iconColor ,),
                title: Text(title),
                subtitle: subtitle != null ? Text(subtitle!) : null,
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.add_rounded,color: Colors.blueAccent,size: 40,),
              ),
            )
          ],
        ),
      ),
    );
  }
}