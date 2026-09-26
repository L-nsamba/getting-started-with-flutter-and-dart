import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/providers/tip_calculator_model.dart';
import 'package:tip_calculator/widgets/bill_amount.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
import 'package:tip_calculator/widgets/tip_row.dart';
import 'package:tip_calculator/widgets/tip_slider.dart';
import 'package:tip_calculator/widgets/total_per_person.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TipCalculatorModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TipCalculatorModel>(context);
    var theme = Theme.of(context);
    // Add style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(title: Text('Tip Calculator')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(
            style: style,
            total: model.totalPerPerson,
            theme: theme,
          ),
          // Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: model.billTotal.toString(),
                    onChanged: (value) {
                      model.updateBillTotal(double.parse(value));
                    },
                  ),
                  // Split bill area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split', style: theme.textTheme.titleMedium),
                      PersonCounter(
                        theme: theme,
                        personCount: model.personCount,
                        onDecrement: () {
                          if (model.personCount > 1) {
                            model.updatePersonCount(model.personCount - 1);
                          }
                        },
                        onIncrement: () {
                          model.updatePersonCount(model.personCount + 1);
                        },
                      ),
                    ],
                  ),
                  // Tip Section
                  TipRow(theme: theme, billTotal: model.billTotal, percentage: model.tipPercentage,),

                  // Slider Text
                  Text("${(model.tipPercentage * 100).round()}%"),

                  // Tip Slider
                  TipSlider(
                    tipPercentage: model.tipPercentage,
                    onChanged: (double value) {
                      model.updateTipPercentage(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
