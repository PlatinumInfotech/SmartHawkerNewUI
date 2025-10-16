// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

class MemoryImageWidget extends StatefulWidget {
  const MemoryImageWidget({
    super.key,
    this.width,
    this.height,
    required this.encodedStr,
  });

  final double? width;
  final double? height;
  final String encodedStr;

  @override
  State<MemoryImageWidget> createState() => _MemoryImageWidgetState();
}

class _MemoryImageWidgetState extends State<MemoryImageWidget> {
  String cleanBase64(String base64String) {
    if (base64String.contains(",")) {
      return base64String.split(",").last;
    }
    return base64String;
  }

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      base64Decode(cleanBase64(widget.encodedStr)),
      fit: BoxFit.cover,
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
