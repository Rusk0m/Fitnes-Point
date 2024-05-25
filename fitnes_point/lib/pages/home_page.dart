import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fitnes_point/widgets/gradient_image_card.dart';

import '../widgets/day_switch_panel.dart';
import '../widgets/kkal_pie_chart.dart';
import '../widgets/meall_card.dart';
import '../widgets/pie_chart_conteiner.dart';
import '../widgets/row_kbgu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 150,
            width: double.infinity, // Ограничение ширины PageView
            child: PageView(
              controller: PageController(
                viewportFraction: 0.7, // Установка viewportFraction
              ),
              scrollDirection: Axis.horizontal,
              children:const  [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:GradientImageCard(
                    title: 'Пример текста',
                    image: 'lib/images/9D1A8877.jpg',
                    gradientColor: Colors.cyan,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:GradientImageCard(
                    title: 'Пример текста',
                    image: 'lib/images/465a68af7c67d90823f09995e6092675.jpg',
                    gradientColor: CupertinoColors.systemIndigo,
                  ),
                ),
                //Разобраться с этим кодом
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GradientImageCard(
                    title: 'Пример текста',
                    image: 'lib/images/c9f5d4620114b993d6418291c8d07d4c.jpg',
                    gradientColor: CupertinoColors.systemGreen,
                  ),
                ),
              ],
            ),
          ),
          //Панель переключения текущего дня
          DaySwitchPanel(),
          //Строка общей информации о количестве КБЖУ
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 0.9,
                  ),
                ),
              ),
              width: double.infinity,
              child: RowKBGU(),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Diet:',
              style: TextStyle(fontSize: 30),
            ),
          ),
          MealCard(title: 'Breakfast', icon: Icons.breakfast_dining,iconColor: Colors.amberAccent,),
          MealCard(title: 'Lanch', icon: Icons.sunny,iconColor: Colors.orange,),
          MealCard(title: 'Dinner', icon: Icons.sunny_snowing,iconColor: Colors.pinkAccent,),
          MealCard(title: 'Snack/Other', icon: Icons.fastfood,iconColor: Colors.deepPurpleAccent,),
          const Center(
            child: SizedBox(
              height: 250,
              width: 250,
              child: KkalPieChar(),
            ),
          ),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 0.65,
            children: const [
              PieChartContainer(
                edgeInsetsOnly: EdgeInsets.only(left: 15, right: 5),
                title: 'Protein',
                count: 90,
                totalCount: 185,
              ),
              PieChartContainer(
                edgeInsetsOnly: EdgeInsets.only(left: 10, right: 10),
                title: 'Fats',
                count: 35,
                totalCount: 85,
              ),
              PieChartContainer(
                edgeInsetsOnly: EdgeInsets.only(left: 5, right: 15),
                title: 'Carbonates',
                count: 90,
                totalCount: 305,
              ),
              PieChartContainer(
                edgeInsetsOnly: EdgeInsets.only(left: 15, right: 5),
                title: 'Celuloza',
                count: 15,
                totalCount: 25,
              ),
              PieChartContainer(
                edgeInsetsOnly: EdgeInsets.only(left: 10, right: 10),
                title: 'Sugar',
                count: 90,
                totalCount: 185,
              ),
              PieChartContainer(
                edgeInsetsOnly: EdgeInsets.only(left: 5, right: 15),
                title: 'Salt',
                count: 5,
                totalCount: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
