import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class KkalPieChar extends StatelessWidget {
  const KkalPieChar({super.key, required this.totalCalories, required this.eatenCalories});

  final double totalCalories;
  final int eatenCalories;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(125)),color: Colors.white),
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.logicalPixel,
                thickness: 20),
            startAngle: 270,
            endAngle: 270,
            showLabels: false,
            showTicks: false,
            pointers: const <RangePointer>[
              RangePointer(
                value: 30,
                width: 20,
                color: Colors.deepPurple,
                enableAnimation: true,
                animationDuration: 1000,
                animationType: AnimationType.ease,
                cornerStyle: CornerStyle.bothCurve,
              )
            ],
            annotations: [
              GaugeAnnotation(
                widget: Column(
                  children: [
                    Text('${eatenCalories}'),
                    Text('${totalCalories} kkal')],
                ),
                angle: 90,
                positionFactor: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
