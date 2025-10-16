import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for businessVendorName widget.
  FocusNode? businessVendorNameFocusNode;
  TextEditingController? businessVendorNameTextController;
  String? Function(BuildContext, String?)?
      businessVendorNameTextControllerValidator;
  String? _businessVendorNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gedj8gj9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for businessName widget.
  FocusNode? businessNameFocusNode;
  TextEditingController? businessNameTextController;
  String? Function(BuildContext, String?)? businessNameTextControllerValidator;
  String? _businessNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i9tz5i4q' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return FFLocalizations.of(context).getText(
        'yqdnbk3v' /* Enter business name */,
      );
    }

    return null;
  }

  // State field(s) for businessContactNumber widget.
  FocusNode? businessContactNumberFocusNode;
  TextEditingController? businessContactNumberTextController;
  String? Function(BuildContext, String?)?
      businessContactNumberTextControllerValidator;
  String? _businessContactNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mktod31i' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'l43do61j' /* Enter mobile number without an... */,
      );
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?:[+0]9)?[0-9]{10}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '8rk00rml' /* Enter a valid 10-digit mobile ... */,
      );
    }
    return null;
  }

  // State field(s) for businessEmailAddress widget.
  FocusNode? businessEmailAddressFocusNode;
  TextEditingController? businessEmailAddressTextController;
  String? Function(BuildContext, String?)?
      businessEmailAddressTextControllerValidator;
  // State field(s) for businessAddress widget.
  FocusNode? businessAddressFocusNode;
  TextEditingController? businessAddressTextController;
  String? Function(BuildContext, String?)?
      businessAddressTextControllerValidator;
  String? _businessAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3g07chse' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for businessGSTNo widget.
  FocusNode? businessGSTNoFocusNode1;
  TextEditingController? businessGSTNoTextController1;
  String? Function(BuildContext, String?)?
      businessGSTNoTextController1Validator;
  // State field(s) for businessGSTNo widget.
  FocusNode? businessGSTNoFocusNode2;
  TextEditingController? businessGSTNoTextController2;
  String? Function(BuildContext, String?)?
      businessGSTNoTextController2Validator;
  // Stores action output result for [Backend Call - API (Vendor Registration API)] action in Button widget.
  ApiCallResponse? apiResult8dh;

  @override
  void initState(BuildContext context) {
    businessVendorNameTextControllerValidator =
        _businessVendorNameTextControllerValidator;
    businessNameTextControllerValidator = _businessNameTextControllerValidator;
    businessContactNumberTextControllerValidator =
        _businessContactNumberTextControllerValidator;
    businessAddressTextControllerValidator =
        _businessAddressTextControllerValidator;
  }

  @override
  void dispose() {
    businessVendorNameFocusNode?.dispose();
    businessVendorNameTextController?.dispose();

    businessNameFocusNode?.dispose();
    businessNameTextController?.dispose();

    businessContactNumberFocusNode?.dispose();
    businessContactNumberTextController?.dispose();

    businessEmailAddressFocusNode?.dispose();
    businessEmailAddressTextController?.dispose();

    businessAddressFocusNode?.dispose();
    businessAddressTextController?.dispose();

    businessGSTNoFocusNode1?.dispose();
    businessGSTNoTextController1?.dispose();

    businessGSTNoFocusNode2?.dispose();
    businessGSTNoTextController2?.dispose();
  }
}
