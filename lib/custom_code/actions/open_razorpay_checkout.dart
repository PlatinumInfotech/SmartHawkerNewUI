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

import 'dart:async';
import 'dart:convert';
import 'package:razorpay_flutter/razorpay_flutter.dart';

Future<void> openRazorpayCheckout(
  String orderId,
  int amount,
) async {
  final Completer<void> completer = Completer();
  final razorpay = Razorpay();

  var options = {
    'key': 'rzp_live_u1bih7sFs8UyF7',
    'amount': amount,
    'order_id': orderId,
    'currency': 'INR',
  };

  // ✅ Success Handler
  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
      (PaymentSuccessResponse response) {
    final data = {
      'razorpay_order_id': response.orderId ?? '',
      'razorpay_payment_id': response.paymentId ?? '',
      'payment_signature': response.signature ?? '',
      'status': 'success',
    };

    // 🟢 Save to AppState
    FFAppState().razorpayOrderId = data['razorpay_order_id']!;
    FFAppState().razorpayPaymentId = data['razorpay_payment_id']!;
    FFAppState().razorpayStatus = data['status']!;
    FFAppState().razorpayErrorMessage = '';

    print('✅ Payment Success: $data');

    if (!completer.isCompleted) {
      completer.complete();
    }
  });

  // ❌ Failure Handler
  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse response) {
    final error = {
      'status': 'failed',
      'error_code': response.code,
      'error_message': response.message ?? '',
    };

    // 🔴 Save error to AppState
    FFAppState().razorpayOrderId = '';
    FFAppState().razorpayPaymentId = '';
    FFAppState().razorpayStatus = error['status']!;
    FFAppState().razorpayErrorMessage = error['error_message']!;

    print("❌ Payment Failed: $error");

    if (!completer.isCompleted) {
      completer.complete();
    }
  });

  // ⚠️ External Wallet Handler
  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
      (ExternalWalletResponse response) {
    final wallet = {
      'status': 'wallet',
      'wallet_name': response.walletName ?? '',
    };

    FFAppState().razorpayOrderId = '';
    FFAppState().razorpayPaymentId = '';
    FFAppState().razorpayStatus = wallet['status']!;
    FFAppState().razorpayErrorMessage = wallet['wallet_name']!;

    print("📦 External Wallet: $wallet");

    if (!completer.isCompleted) {
      completer.complete();
    }
  });

  try {
    razorpay.open(options);
  } catch (e) {
    final error = {
      'status': 'error',
      'error_message': e.toString(),
    };

    FFAppState().razorpayOrderId = '';
    FFAppState().razorpayPaymentId = '';
    FFAppState().razorpayStatus = error['status']!;
    FFAppState().razorpayErrorMessage = error['error_message']!;

    print("❗ Error opening Razorpay: $error");

    if (!completer.isCompleted) {
      completer.complete();
    }
  }

  return completer.future;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
