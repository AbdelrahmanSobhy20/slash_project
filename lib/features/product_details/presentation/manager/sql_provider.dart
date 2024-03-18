import 'package:flutter/material.dart';

import '../../data/models/data_map.dart';

class SQLProvider with ChangeNotifier{
  Color pressedButtonColor = Colors.green;
  late int newPrice;
  late DataMap item;
  void ChangeData(int id){
    pressedButtonColor = Colors.green.shade900;

  }
}