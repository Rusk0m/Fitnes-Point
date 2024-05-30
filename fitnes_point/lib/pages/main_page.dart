import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fitnes_point/pages/home_page.dart';
import 'package:fitnes_point/pages/profil_page.dart';
import 'package:fitnes_point/pages/statistic_page.dart';
import 'package:fitnes_point/theme/app_colors.dart';
import 'package:fitnes_point/theme/app_text_styles.dart';
import 'package:orm/orm.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPageIndex = 0;
  final pages = [
    const HomePage(),
    const ProfilPage(),
    const StatisticPage(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('FitnesPoint', style: AppTextStyle.title,),
      //   backgroundColor: AppColors.primary,
      //   centerTitle: true,
      //   toolbarHeight: 40,
      // ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Fitnes Point',),
            backgroundColor: Colors.deepPurpleAccent,
            // pinned: true,

            snap: true,
            floating: true,
          ),
          SliverFillRemaining(
            child: Container(
              color: AppColors.pageColor,
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return pages[selectedPageIndex];
                  }
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        child: NavigationBar(
          selectedIndex: selectedPageIndex,
          indicatorColor: AppColors.primary,
          height: 60,
          backgroundColor: AppColors.buttonColor,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home_outlined,color: Colors.white),
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings_outlined,color: Colors.white),
              icon: Icon(Icons.settings),
              label: 'Profil',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.stacked_bar_chart_outlined,color: Colors.white),
              icon: Icon(Icons.stacked_bar_chart),
              label: 'Statistic',
            ),
          ],
          onDestinationSelected: (value) {
            setState(() {
              selectedPageIndex = value;
            });
          },
        ),
      ),
    );
  }
}
