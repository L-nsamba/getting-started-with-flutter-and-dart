import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:water_intake/model/water_model.dart';
import 'package:water_intake/utils/date_converter.dart';

class WaterData extends ChangeNotifier {
  List<WaterModel> waterDataList = [];

  // add water
  void addWater(WaterModel water) async {
    final url = Uri.https(
      'water-intaker-e556b-default-rtdb.firebaseio.com',
      'water.json',
    );

    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'amount': double.parse(water.amount.toString()),
        'unit': 'ml',
        'dateTime': DateTime.now().toString(),
      }),
    );

    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      waterDataList.add(
        WaterModel(
          id: extractedData['name'],
          amount: water.amount,
          dateTime: water.dateTime,
          unit: 'ml',
        ),
      );
    } else {
      print('Error: ${response.statusCode}');
    }

    notifyListeners();
  }

  Future<List<WaterModel>> getWater() async {
    final url = Uri.https(
      'water-intaker-e556b-default-rtdb.firebaseio.com',
      'water.json',
    );

    final response = await http.get(url);

    if (response.statusCode == 200 && response.body != 'null') {
      waterDataList.clear();

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var element in extractedData.entries) {
        waterDataList.add(
          WaterModel(
            id: element.key,
            amount: element.value['amount'],
            dateTime: DateTime.parse(element.value['dateTime']),
            unit: element.value['unit'],
          ),
        );
      }
    }

    notifyListeners();
    return waterDataList;
  }

  String getWeekDay(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tues';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';

      default:
        return '';
    }
  }

  DateTime getStartOfWeek() {
    DateTime? startofWeek;

    // get current date
    DateTime dateTime = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getWeekDay(dateTime.subtract(Duration(days: i))) == 'Sun') {
        startofWeek = dateTime.subtract(Duration(days: i));
      }
    }
    return startofWeek!;
  }

  void delete(WaterModel waterModel) {
    final url = Uri.https(
      'water-intaker-e556b-default-rtdb.firebaseio.com',
      'water/${waterModel.id}.json',
    );
    http.delete(url);

    // removing item from list
    waterDataList.removeWhere((element) => element.id == waterModel.id!);

    notifyListeners();
  }

  // calculate the weekly water intake
  String calculateWeeklyWaterIntake(WaterData value) {
    double weeklyWaterIntake = 0;

    // loop through water data list
    for (var water in value.waterDataList) {
      weeklyWaterIntake += double.parse(water.amount.toString());
    }

    return weeklyWaterIntake.toStringAsFixed(2);
  }

  // calculate the daily water intake
  Map<String, double> calculateDailyWaterSummary() {
    Map<String, double> dailyWaterSummary = {};

    // loop through the water data list
    for (var water in waterDataList) {
      String date = convertDateTeimeToString(water.dateTime);
      double amount = double.parse(water.amount.toString());

      if (dailyWaterSummary.containsKey(date)) {
        double currentAmount = dailyWaterSummary[date]!;
        currentAmount += amount;
        dailyWaterSummary[date] = currentAmount;
      } else {
        dailyWaterSummary.addAll({date: amount});
      }
    }
    return dailyWaterSummary;
  }
}
