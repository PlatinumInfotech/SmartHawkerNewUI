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

Future<String> startSpeechToText2() async {
  stt.SpeechToText speech = stt.SpeechToText();
  bool available = await speech.initialize();

  if (!available) return '';

  String recognizedWords = '';

  await speech.listen(
    localeId: 'hi-IN',
    listenFor: Duration(seconds: 7),
    pauseFor: Duration(seconds: 2),
    onResult: (result) {
      recognizedWords = result.recognizedWords;
    },
  );

  await Future.delayed(Duration(seconds: 7));
  await speech.stop();

  print('📢 Raw spoken: $recognizedWords');

  if (recognizedWords.isNotEmpty) {
    final parsed = parseHindiCommand(recognizedWords);
    print('✅ Parsed result: $parsed');
    return jsonEncode(parsed); // ✅ return as JSON string
  } else {
    return '';
  }
}

Map<String, dynamic> parseHindiCommand(String spokenText) {
  spokenText = spokenText.toLowerCase();

  String action = '';
  int quantity = 0;
  String product = '';
  String customer = '';
  String date = '';

  if (spokenText.contains('जोड़ें') ||
      spokenText.contains('jode') ||
      spokenText.contains('दिया') ||
      spokenText.contains('diya')) {
    action = 'add';
  } else if (spokenText.contains('अपडेट') || spokenText.contains('update')) {
    action = 'update';
  }

  RegExp quantityRegex = RegExp(r'(\\d+)\\s*(लीटर|litre|liter|litr)');
  Match? matchQty = quantityRegex.firstMatch(spokenText);
  if (matchQty != null) {
    quantity = int.tryParse(matchQty.group(1) ?? '0') ?? 0;
  }

  if (spokenText.contains('को दिया') || spokenText.contains('ko diya')) {
    List<String> parts = spokenText.split(RegExp(r'को दिया|ko diya'));
    if (parts.length > 1) {
      customer = parts[0].trim();
    }
  }

  if (spokenText.contains('गाय') || spokenText.contains('cow')) {
    product = 'cow milk';
  } else if (spokenText.contains('भैंस') || spokenText.contains('buffalo')) {
    product = 'buffalo milk';
  } else if (spokenText.contains('दूध') || spokenText.contains('milk')) {
    product = 'milk';
  }

  if (spokenText.contains('आज') || spokenText.contains('aaj')) {
    date = DateTime.now().toIso8601String();
  } else if (spokenText.contains('कल') || spokenText.contains('kal')) {
    date = DateTime.now().subtract(Duration(days: 1)).toIso8601String();
  }

  return {
    'action': action,
    'quantity': quantity,
    'product': product,
    'customer': customer,
    'date': date,
  };
}
