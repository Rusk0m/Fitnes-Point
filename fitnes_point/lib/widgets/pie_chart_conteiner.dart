import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PieChartContainer extends StatelessWidget {
  const PieChartContainer({super.key, required this.edgeInsetsOnly, required this.title, required this.totalCount, required this.count});
  final EdgeInsets edgeInsetsOnly;
  final String title;
  final double totalCount;
  final double count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
      child: Padding(
        padding: edgeInsetsOnly,
        child: SfRadialGauge(
          axes: [
            RadialAxis(
              showLabels: false,
              showTicks: false,
              endAngle: 270,
              startAngle: 270,
              maximum: totalCount,
              pointers: <GaugePointer>[
                RangePointer(
                  value: count,
                  width: 10,
                  color: Colors.deepPurple,
                  enableAnimation: true,
                  animationDuration: 1000,
                  animationType: AnimationType.ease,
                  cornerStyle: CornerStyle.bothCurve,
                ),
              ],
              annotations: [
                GaugeAnnotation(
                  widget: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      child:  Column(
                        children: [
                          Text('${count.toStringAsFixed(0)} g'),
                          Text('${totalCount.toStringAsFixed(0)} g'),
                        ],
                      ),
                    ),
                  ),
                  angle: 90,
                  positionFactor: 2.8,
                ),
                GaugeAnnotation(
                  widget: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      child: Text(title),
                    ),
                  ),
                  angle: 270,
                  positionFactor: 1.5,
                ),
                GaugeAnnotation(
                   widget: Container(
                      child: Text('${(count/totalCount*100).toStringAsFixed(0)}%'),
                    ),
                  angle: 180,
                  positionFactor: 0.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
