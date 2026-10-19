import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_intake/bars/bar_graph.dart';
import 'package:water_intake/data/water_data.dart';

class WaterIntakeSummary extends StatelessWidget {
  final DateTime startofWeek;
  const WaterIntakeSummary({super.key, required this.startofWeek});

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: BarGraph(
          maxY: 100,
          sunWaterAmt: 19,
          monWaterAmt: 25,
          tueWaterAmt: 42,
          wedWaterAmt: 53,
          thurWaterAmt: 34,
          friWaterAmt: 14,
          satWaterAmt: 56,
        ),
      ),
    );
  }
}
