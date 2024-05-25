import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fitnes_point/theme/app_colors.dart';
import '../widgets/profil_page_cards.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
        child: ListView(
            children:[
              //Строка настроек и аватара
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.buttonColor,
                            ),
                            child: Icon(Icons.account_circle,size: 50,),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: AppColors.buttonColor,
                            ),
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.notifications_none_outlined,size: 30,)
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.settings,size: 30,)
                    )
                  ],
                ),
              ),

              //Начало Карточек
              const SizedBox(
                height: 30,
              ),
              const ProfilPageCard(title: 'My Weight', icon: Icons.monitor_weight),
              const SizedBox(
                height:30,
              ),
              const ProfilPageCard(title:'Reminders' , icon: Icons.alarm),
              const ProfilPageCard(title: 'Photo Album', icon: Icons.photo),
              const SizedBox(
                height:30,
              ),
              const ProfilPageCard(title: 'Communication and privacy', icon:Icons.mail_lock_outlined),
              const ProfilPageCard(title: 'Feedback', icon: Icons.contact_support)
            ],
          ),
      );
  }
}
