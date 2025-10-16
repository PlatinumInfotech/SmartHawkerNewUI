import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/custom_auth/auth_util.dart';

double incrementQuantityCounter(double quantityCounter) {
  return quantityCounter + 0.25;
}

double decerementQuantityCounter(double quantityCounter) {
  if (quantityCounter > 0)
    return quantityCounter - 0.25;
  else
    return 0.0;
}

String buildApiRequestArray(
  List<int> customerId,
  List<int> staffId,
  List<int> productId,
  List<double> quantity,
  List<String> saleDate,
) {
  // Build the array
  List<Map<String, dynamic>> apiRequestArray = [];

  for (int i = 0; i < staffId.length; i++) {
    apiRequestArray.add({
      "CustomerId": customerId[i],
      "StaffId": staffId[i],
      "ProductId": productId[i],
      "Quantity": quantity[i],
      "SaleDate": saleDate[i],
    });
  }

  return jsonEncode(apiRequestArray);
}

String stringArrayFunction(List<int> customerId) {
  List<Map<String, dynamic>> apiRequestArray = [];

  for (int i = 0; i < customerId.length; i++) {
    apiRequestArray.add({"CustomerId": customerId[i]});
  }

  return jsonEncode(apiRequestArray);
}

List<String> newCustomFunction(String dynamiclist) {
  List<String> customList = [];
  customList.add(dynamiclist);
  return customList;
}

double? newCustomFunction2(
  double? pricePerUnit,
  double? quantity,
) {
  // Check if both pricePerUnit and quantity are valid
  if (pricePerUnit != null && quantity != null && quantity > 0) {
    // Calculate and return the total amount as a formatted string
    double totalAmount = pricePerUnit * quantity;
    return totalAmount; // Format to 2 decimal places
  }

  // If the quantity is null or invalid, return "0.00" or null
  return 0.00;
}

double? calculateMonthlyTotal(List<double>? totals) {
  // Ensure the list is not null or empty
  if (totals == null || totals.isEmpty) {
    return 0.0;
  }

  // Calculate the sum of all totals in the list
  double totalAmount = 0.0;
  for (double total in totals) {
    totalAmount += total;
  }

  return totalAmount;
}

String? convertImageToBase64(FFUploadedFile? imageBytes) {
  try {
    if (imageBytes == null) return null; // Handle null or empty case

    final bytes = imageBytes.bytes;

    return "data:image/jpeg:base64," + base64Encode(bytes as List<int>);
  } catch (e) {
    return null; // Return null in case of an error
  }
}

String? base64ToImage(List<String>? base64String) {
  String? base64ToImage(String base64String) {
    try {
      // Decode the base64 string to bytes
      final decodedBytes = base64.decode(base64String);
      // Convert the bytes to a string
      return String.fromCharCodes(decodedBytes);
    } catch (e) {
      // Handle any errors that may occur during decoding
      print('Error decoding base64 string: $e');
      return null;
    }
  }
}

dynamic jsonFromString(String? jsonString) {
  dynamic jsonFromString(String jsonString) {
    try {
      return jsonDecode(jsonString);
    } catch (e) {
      print('❌ Error parsing JSON: $e');
      return {}; // empty JSON object if parsing fails
    }
  }
}

String? getInitials(String? fullName) {
  String getInitials(String fullName) {
    // If the full name is empty, return an empty string.
    if (fullName.isEmpty) {
      return "";
    }

    // Split the name into parts to handle first and last names.
    List<String> nameParts = fullName.trim().split(' ');

    // If there's more than one part (e.g., "Sonu Kumar"), take the first letter of the first and last parts.
    if (nameParts.length > 1 && nameParts.last.isNotEmpty) {
      return nameParts.first[0].toUpperCase() + nameParts.last[0].toUpperCase();
    }
    // If there is only one part (e.g., "Sonu"), take the first letter of that part.
    else {
      return nameParts.first[0].toUpperCase();
    }
  }
}
