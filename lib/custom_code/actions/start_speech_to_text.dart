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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/// This custom action parses a voice command in Hindi, parses out the
/// name, quantity, product, and unit, and saves them to AppState.

// Future<void> startSpeechToText() async {
//   stt.SpeechToText speech = stt.SpeechToText();

//   bool available = await speech.initialize(
//     onStatus: (status) => print('Speech Status: $status'),
//     onError: (error) => print('Speech Error: $error'),
//   );

//   if (!available) {
//     print('Speech not available');
//     return;
//   }

//   String recognizedWords = '';
//   await speech.listen(
//     listenFor: Duration(seconds: 9),
//     pauseFor: Duration(seconds: 3),
//     localeId: 'en-IN',
//     onResult: (result) {
//       recognizedWords = result.recognizedWords;
//       FFAppState().rawSpeechText = recognizedWords;
//       print('✅ Final rawSpeechText: $recognizedWords');

//       // ✅ Extract name from rawText using simple pattern before main parsing
//       final nameMatch = RegExp(r'^(\w+)\s+ko', caseSensitive: false)
//           .firstMatch(recognizedWords);
//       if (nameMatch != null) {
//         String extractedName = nameMatch.group(1) ?? '';
//         FFAppState().extractedName = extractedName;
//         print('👤 Extracted Name from rawText: $extractedName');
//       } else {
//         print('❌ Name not found in rawText');
//       }
//     },
//     listenMode: stt.ListenMode.dictation,
//   );

//   await Future.delayed(Duration(seconds: 6));

//   speech.stop();

//   if (recognizedWords.isEmpty) {
//     print('No speech recognized');
//     return;
//   }

//   final text = recognizedWords.toLowerCase();

//   final quantityMap = {
//     'adha': 0.5,
//     'aadha': 0.5,
//     'ek': 1,
//     'ded': 1.5,
//     'dedh': 1.5,
//     'do': 2,
//     'dhai': 2.5,
//     'dhaai': 2.5,
//     'teen': 3,
//     'sadhe teen': 3.5,
//     'saade teen': 3.5,
//     'char': 4,
//     'sadhe char': 4.5,
//     'saade char': 4.5,
//     'paanch': 5,
//     'sadhe paanch': 5.5,
//     'saade paanch': 5.5,
//     'chhe': 6,
//     'sadhe chhe': 6.5,
//     'saade chhe': 6.5,
//     'saath': 7,
//     'saat': 7,
//     'sadhe saat': 7.5,
//     'saade saat': 7.5,
//     'aath': 8,
//     'sadhe aath': 8.5,
//     'saade aath': 8.5,
//     'nau': 9,
//     'sadhe nau': 9.5,
//     'saade nau': 9.5,
//     'das': 10,
//   };

//   // ✅ Updated pattern for multi-word quantity, unit, and product
//   final pattern = RegExp(
//     r'(\w+)\s+ko\s+([\w\s]+?)\s+(kilo|kg|ग्राम|gram|लीटर|litre|liter|ml|मिलीलीटर|पाव|half|आधा|liters|liters|kilos|grams)\s+(.+?)(?:\s+diya)?$',
//     caseSensitive: false,
//   );
//   final match = pattern.firstMatch(text);

//   if (match == null) {
//     print('Could not parse command');
//     return;
//   }

//   String name = match.group(1) ?? '';
//   String quantityRaw = match.group(2) ?? '';
//   String unit = match.group(3) ?? '';
//   String product = match.group(4) ?? '';

//   double quantity = 0.0;

//   if (double.tryParse(quantityRaw) != null) {
//     quantity = double.parse(quantityRaw);
//   } else if (quantityMap.containsKey(quantityRaw)) {
//     quantity = quantityMap[quantityRaw]!.toDouble(); // explicit cast
//   }

//   // Save parsed values to AppState
//   FFAppState().name = name;
//   FFAppState().quantity = quantity;
//   FFAppState().unit = unit;
//   FFAppState().product = product;

//   print('Values successfully saved to AppState');
// }

Future<void> startSpeechToText() async {
  stt.SpeechToText speech = stt.SpeechToText();

  bool available = await speech.initialize(
    onStatus: (status) => print('Speech Status: $status'),
    onError: (error) => print('Speech Error: $error'),
  );

  if (!available) {
    print('Speech not available');
    return;
  }

  String recognizedWords = '';
  await speech.listen(
    listenFor: Duration(seconds: 9),
    pauseFor: Duration(seconds: 3),
    localeId: 'en-IN',
    onResult: (result) {
      recognizedWords = result.recognizedWords;
      FFAppState().rawSpeechText = recognizedWords;
      print('✅ Final rawSpeechText: $recognizedWords');

      // ✅ Extract name from rawText using simple pattern before main parsing
      final nameMatch = RegExp(r'^(\w+)\s+ko', caseSensitive: false)
          .firstMatch(recognizedWords);
      if (nameMatch != null) {
        String extractedName = nameMatch.group(1) ?? '';
        FFAppState().extractedName = extractedName;
        print('👤 Extracted Name from rawText: $extractedName');
      } else {
        print('❌ Name not found in rawText');
      }
    },
    listenMode: stt.ListenMode.dictation,
  );

  await Future.delayed(Duration(seconds: 6));

  speech.stop();

  if (recognizedWords.isEmpty) {
    print('No speech recognized');
    return;
  }

  final text = recognizedWords.toLowerCase();

  final quantityMap = {
    'adha': 0.5,
    'aadha': 0.5,
    'ek': 1,
    'ded': 1.5,
    'dedh': 1.5,
    'do': 2,
    'dhai': 2.5,
    'dhaai': 2.5,
    'teen': 3,
    'sadhe teen': 3.5,
    'saade teen': 3.5,
    'char': 4,
    'sadhe char': 4.5,
    'saade char': 4.5,
    'paanch': 5,
    'sadhe paanch': 5.5,
    'saade paanch': 5.5,
    'chhe': 6,
    'sadhe chhe': 6.5,
    'saade chhe': 6.5,
    'saath': 7,
    'saat': 7,
    'sadhe saat': 7.5,
    'saade saat': 7.5,
    'aath': 8,
    'sadhe aath': 8.5,
    'saade aath': 8.5,
    'nau': 9,
    'sadhe nau': 9.5,
    'saade nau': 9.5,
    'das': 10,
  };

  // ✅ Updated pattern for multi-word quantity, unit, and product
  final pattern = RegExp(
    r'(\w+)\s+ko\s+([\w\s]+?)\s+(kilo|kg|ग्राम|gram|लीटर|litre|liter|ml|मिलीलीटर|पाव|half|आधा|liters|liters|kilos|grams)\s+(.+?)(?:\s+diya)?$',
    caseSensitive: false,
  );
  final match = pattern.firstMatch(text);

  if (match == null) {
    print('Could not parse command');
    return;
  }

  String name = match.group(1) ?? '';
  String quantityRaw = match.group(2) ?? '';
  String unit = match.group(3) ?? '';
  String product = match.group(4) ?? '';

  double quantity = 0.0;

  if (double.tryParse(quantityRaw) != null) {
    quantity = double.parse(quantityRaw);
  } else if (quantityMap.containsKey(quantityRaw)) {
    quantity = quantityMap[quantityRaw]!.toDouble(); // explicit cast
  }

  // Save parsed values to AppState
  FFAppState().name = name;
  FFAppState().quantity = quantity;
  FFAppState().unit = unit;
  FFAppState().product = product;

  print('Values successfully saved to AppState');
}
