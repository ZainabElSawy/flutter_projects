import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget getRadialGauge(double bmi) {
  return SfRadialGauge(
    axes: <RadialAxis>[
      RadialAxis(
          showAxisLine: false,
          showLabels: false,
          showTicks: false,
          startAngle: 180,
          endAngle: 360,
          maximum: 42,
          canScaleToFit: true,
          radiusFactor: 0.79,
          axisLineStyle: const AxisLineStyle(
            thickness: 20,
            color: Colors.red,
          ),
          pointers: <GaugePointer>[
            NeedlePointer(
                needleEndWidth: 7,
                needleLength: 0.55,
                value: bmi,
                knobStyle: const KnobStyle(knobRadius: 0.04)),
          ],
          ranges: <GaugeRange>[
            GaugeRange(
                rangeOffset: bmi < 17 ? -0.03 : 0,
                startValue: 0,
                endValue: 17,
                startWidth: bmi < 17 ? 0.6 : 0.55,
                endWidth: bmi < 17 ? 0.6 : 0.55,
                sizeUnit: GaugeSizeUnit.factor,
                color: const Color.fromARGB(255, 88, 97, 189)),
            GaugeRange(
                rangeOffset: bmi >= 17 && bmi < 18.5 ? -0.03 : 0,
                startValue: 17,
                endValue: 18.5,
                startWidth: bmi >= 17 && bmi < 18.5 ? 0.6 : 0.55,
                endWidth: bmi >= 17 && bmi < 18.5 ? 0.6 : 0.55,
                sizeUnit: GaugeSizeUnit.factor,
                color: const Color.fromARGB(255, 110, 213, 227)),
            GaugeRange(
                rangeOffset: bmi >= 18.5 && bmi < 25 ? -0.03 : 0,
                startValue: 18.5,
                endValue: 25,
                startWidth: bmi >= 18.5 && bmi < 25 ? 0.6 : 0.555,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: bmi >= 18.5 && bmi < 25 ? 0.6 : 0.55,
                color: const Color.fromARGB(255, 82, 238, 87)),
            GaugeRange(
                rangeOffset: bmi >= 25 && bmi < 30 ? -0.03 : 0,
                startValue: 25,
                endValue: 30,
                startWidth: bmi >= 25 && bmi < 30 ? 0.6 : 0.55,
                sizeUnit: GaugeSizeUnit.factor,
                endWidth: bmi >= 25 && bmi < 30 ? 0.6 : 0.55,
                color: const Color(0xFFFFDF10)),
            GaugeRange(
                rangeOffset: bmi >= 30 && bmi < 36 ? -0.03 : 0,
                startValue: 30,
                endValue: 36,
                sizeUnit: GaugeSizeUnit.factor,
                startWidth: bmi >= 30 && bmi < 36 ? 0.6 : 0.55,
                endWidth: bmi >= 30 && bmi < 36 ? 0.6 : 0.55,
                color: Colors.orange),
            GaugeRange(
                rangeOffset: bmi >= 36 && bmi < 40 ? -0.03 : 0,
                startValue: 36,
                endValue: 40,
                startWidth: bmi >= 36 && bmi < 40 ? 0.6 : 0.55,
                endWidth: bmi >= 36 && bmi < 40 ? 0.6 : 0.55,
                sizeUnit: GaugeSizeUnit.factor,
                color: const Color.fromARGB(255, 255, 103, 1)),
            GaugeRange(
                rangeOffset: bmi >= 40 ? -0.03 : 0,
                startValue: 40,
                endValue: 42,
                startWidth: bmi >= 40 ? 0.6 : 0.55,
                endWidth: bmi >= 40 ? 0.6 : 0.55,
                sizeUnit: GaugeSizeUnit.factor,
                color: Colors.red),
          ]),
      RadialAxis(
        showAxisLine: false,
        showLabels: false,
        showTicks: false,
        startAngle: 180,
        endAngle: 360,
        maximum: 120,
        radiusFactor: 0.85,
        canScaleToFit: true,
        pointers: const <GaugePointer>[
          MarkerPointer(
              markerType: MarkerType.text,
              text: '17',
              value: 48,
              textStyle: GaugeTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Times'),
              offsetUnit: GaugeSizeUnit.factor,
              markerOffset: -0.12),
          MarkerPointer(
              markerType: MarkerType.text,
              text: '18.5',
              value: 55,
              textStyle: GaugeTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Times'),
              offsetUnit: GaugeSizeUnit.factor,
              markerOffset: -0.12),
          MarkerPointer(
              markerType: MarkerType.text,
              text: '25',
              value: 70,
              textStyle: GaugeTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Times'),
              offsetUnit: GaugeSizeUnit.factor,
              markerOffset: -0.12),
          MarkerPointer(
              markerType: MarkerType.text,
              text: '30',
              value: 85,
              textStyle: GaugeTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Times'),
              offsetUnit: GaugeSizeUnit.factor,
              markerOffset: -0.12),
          MarkerPointer(
              markerType: MarkerType.text,
              text: '36',
              value: 103,
              textStyle: GaugeTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Times'),
              offsetUnit: GaugeSizeUnit.factor,
              markerOffset: -0.12),
          MarkerPointer(
              markerType: MarkerType.text,
              text: '40',
              value: 115,
              textStyle: GaugeTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Times'),
              offsetUnit: GaugeSizeUnit.factor,
              markerOffset: -0.12)
        ],
      ),
    ],
  );
}
