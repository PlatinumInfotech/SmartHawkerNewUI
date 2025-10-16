import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - checkMyInternet] action in Login widget.
  bool? internetConnection;
  // Stores action output result for [Backend Call - API (Check App Version)] action in Login widget.
  ApiCallResponse? appVersionResponse;
  // Stores action output result for [Custom Action - getFcmToken] action in Login widget.
  String? fcmtoken;
  // Stores action output result for [Backend Call - API (Login API)] action in Login widget.
  ApiCallResponse? signInResponse;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9lyvn56f' /* Mobile Number is required */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        '4kqtzpa8' /* Enter a valid 10-digit mobile ... */,
      );
    }
    if (!RegExp('^(?:[+0]9)?[0-9]{10}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'v8h9wfgc' /* Enter a valid 10-digit mobile ... */,
      );
    }
    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (Send OTP)] action in Button widget.
  ApiCallResponse? sendOTPResponse;

  @override
  void initState(BuildContext context) {
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
