import 'package:flutter/material.dart';
import '../../components/customRadarChart.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = ['친밀성', '건강', '전문성', '취미', '규칙성', '성실성'];
    final values = [0.6, 0.8, 0.4, 0.7, 0.5, 0.9];
    const maxValue = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Radar Chart Example'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomRadarChart(
            labels: labels,
            values: values,
            maxValue: maxValue,
            lineColor: Colors.grey.shade300,//Color(0xffF4F4F4),
            dataPointColor: Theme.of(context).colorScheme.primary,
            dataLineColor: Theme.of(context).colorScheme.secondary, // Add this line for the data line color
          ),
        ),
      ),
    );
  }
}
