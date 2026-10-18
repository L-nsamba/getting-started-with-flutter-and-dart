import 'package:water_intake/bars/individual_bar.dart';

class BarData {
  final double sunWaterAmt;
  final double monWaterAmt;
  final double tueWaterAmt;
  final double wedWaterAmt;
  final double thurWaterAmt;
  final double friWaterAmt;
  final double satWaterAmt;

  BarData({
    required this.sunWaterAmt,
    required this.monWaterAmt,
    required this.tueWaterAmt,
    required this.wedWaterAmt,
    required this.thurWaterAmt,
    required this.friWaterAmt,
    required this.satWaterAmt,
  });

  List<IndividualBar> barData = [];

  // initialize bar data
  void initBarData() {
    barData = [IndividualBar(x: 0, y: sunWaterAmt)];
    barData = [IndividualBar(x: 0, y: monWaterAmt)];
    barData = [IndividualBar(x: 0, y: tueWaterAmt)];
    barData = [IndividualBar(x: 0, y: wedWaterAmt)];
    barData = [IndividualBar(x: 0, y: thurWaterAmt)];
    barData = [IndividualBar(x: 0, y: friWaterAmt)];
    barData = [IndividualBar(x: 0, y: satWaterAmt)];
  }
}
