import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class KkalPieChar extends StatelessWidget {
  const KkalPieChar({super.key});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
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
              color: Colors.amber,
              enableAnimation: true,
              animationDuration: 1000,
              animationType: AnimationType.ease,
              cornerStyle: CornerStyle.bothCurve,
            )
          ],
          annotations: const [
            GaugeAnnotation(
              widget: Column(
                children: [Text('1488'), Text('3000 kkal')],
              ),
              angle: 90,
              positionFactor: 1,
            )
          ],
        )
      ],
    );
  }
}
