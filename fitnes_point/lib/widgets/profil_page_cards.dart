import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class ProfilPageCard extends StatelessWidget {
  const ProfilPageCard({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      child: Column(
        children: [
          Container(
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.buttonColor,
                //border: Border.all(width:1,color: Colors.black)
              ),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(6),
                            child: Icon(icon),
                        ),
                      ),
                      Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
