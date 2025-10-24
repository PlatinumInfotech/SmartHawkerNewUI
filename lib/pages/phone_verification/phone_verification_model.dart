import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_verification_widget.dart' show PhoneVerificationWidget;
import 'package:flutter/material.dart';

class PhoneVerificationModel extends FlutterFlowModel<PhoneVerificationWidget> {
  ///  Local state fields for this page.

  String? fcmToken;

  ///  State fields for stateful widgets in this page.

  // State field(s) for otp widget.
  FocusNode? otpFocusNode;
  TextEditingController? otpTextController;
  String? Function(BuildContext, String?)? otpTextControllerValidator;
  // Stores action output result for [Backend Call - API (Validate OTP)] action in Button-Login widget.
  ApiCallResponse? validateOTPResponse;
  // Stores action output result for [Backend Call - API (Login API)] action in Button-Login widget.
  ApiCallResponse? signInResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    otpFocusNode?.dispose();
    otpTextController?.dispose();
  }
}
