class WaterModel {
  final String? id;
  final double amount;
  final DateTime dateTime;

  WaterModel({
    this.id,
    required this.amount,
    required this.dateTime,
    required String unit,
  });

  factory WaterModel.fromJson(Map<String, dynamic> json, String id) {
    return WaterModel(
      id: id,
      amount: json['amount'],
      dateTime: DateTime.parse(json['dateTime']),
      unit: json['unit'],
    );
  }

  // conversion of water model to json before sending data to firebase
  Map<String, dynamic> toJson() {
    return {'amount': amount, 'dateTime': DateTime.now()};
  }
}
