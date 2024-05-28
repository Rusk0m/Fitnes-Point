import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitnes_point/theme/app_colors.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [


        ],
      ),
    );
  }
}