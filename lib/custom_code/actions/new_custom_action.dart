// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future newCustomAction() async {
  // There are 2 lists, wanted to combine them in 1 list matching the indexes and will return the final result as json

  List<String> list1 = ["apple", "banana", "cherry"];
  List<int> list2 = [1, 2, 3];

  List<Map<String, dynamic>> combinedList = [];

  for (int i = 0; i < list1.length; i++) {
    Map<String, dynamic> map = {"fruit": list1[i], "number": list2[i]};
    combinedList.add(map);
  }
  print(combinedList);
  return combinedList;
}
