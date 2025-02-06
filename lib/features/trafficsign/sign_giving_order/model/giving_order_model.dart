class SignGivingOrders {
  final List<String> data;
  final List<String> data1;
  final List<String> data2;
  final List<String> data3;
  final List<String> data4;

  final List<String> sign;
  final List<String> sign1;
  final List<String> sign2;
  final List<String> sign3;
  final List<String> sign4;
  final List<String> sign5;

  SignGivingOrders({
    required this.data,
    required this.data1,
    required this.data2,
    required this.data3,
    required this.data4,

    required this.sign,
    required this.sign1,
    required this.sign2,
    required this.sign3,
    required this.sign4,
    required this.sign5,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'data1': data1,
      'data2': data2,
      'data3': data3,
      'data4': data4,
      'sign': sign,
      'sign1': sign1,
      'sign2': sign2,
      'sign3': sign3,
      'sign4': sign4,
      'sign5': sign5,
    };
  }

  factory SignGivingOrders.fromMap(Map<String, dynamic> map) {
    return SignGivingOrders(
      data: List<String>.from(map['data'] ?? []),
      data1: List<String>.from(map['data1'] ?? []),
      data2: List<String>.from(map['data2'] ?? []),
      data3: List<String>.from(map['data3'] ?? []),
      data4: List<String>.from(map['data4'] ?? []),
      sign: List<String>.from(map['sign'] ?? []),
      sign1: List<String>.from(map['sign1'] ?? []),
      sign2: List<String>.from(map['sign2'] ?? []),
      sign3: List<String>.from(map['sign3'] ?? []),
      sign4: List<String>.from(map['sign4'] ?? []),
      sign5: List<String>.from(map['sign5'] ?? []),
    );
  }
}

