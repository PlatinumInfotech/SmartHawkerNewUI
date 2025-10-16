import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_customer_widget.dart' show AddCustomerWidget;
import 'package:flutter/material.dart';

class AddCustomerModel extends FlutterFlowModel<AddCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for customerUniqueId widget.
  FocusNode? customerUniqueIdFocusNode;
  TextEditingController? customerUniqueIdTextController;
  String? Function(BuildContext, String?)?
      customerUniqueIdTextControllerValidator;
  // State field(s) for customerName widget.
  FocusNode? customerNameFocusNode;
  TextEditingController? customerNameTextController;
  String? Function(BuildContext, String?)? customerNameTextControllerValidator;
  String? _customerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wu6obvn9' /* Customer Name * is required */,
      );
    }

    return null;
  }

  // State field(s) for customerEmail widget.
  FocusNode? customerEmailFocusNode;
  TextEditingController? customerEmailTextController;
  String? Function(BuildContext, String?)? customerEmailTextControllerValidator;
  // State field(s) for customerMobile widget.
  FocusNode? customerMobileFocusNode;
  TextEditingController? customerMobileTextController;
  String? Function(BuildContext, String?)?
      customerMobileTextControllerValidator;
  String? _customerMobileTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0xjlphow' /* Customer Mobile * is required */,
      );
    }

    if (!RegExp('^\\d{10}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '2bd6t7y6' /* Enter a valid 10-digit mobile ... */,
      );
    }
    return null;
  }

  // State field(s) for customerAddress widget.
  FocusNode? customerAddressFocusNode;
  TextEditingController? customerAddressTextController;
  String? Function(BuildContext, String?)?
      customerAddressTextControllerValidator;
  String? _customerAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hs9slla4' /* Address * is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Add Customer Info API)] action in Button widget.
  ApiCallResponse? apiResultAddCustomer;

  @override
  void initState(BuildContext context) {
    customerNameTextControllerValidator = _customerNameTextControllerValidator;
    customerMobileTextControllerValidator =
        _customerMobileTextControllerValidator;
    customerAddressTextControllerValidator =
        _customerAddressTextControllerValidator;
  }

  @override
  void dispose() {
    customerUniqueIdFocusNode?.dispose();
    customerUniqueIdTextController?.dispose();

    customerNameFocusNode?.dispose();
    customerNameTextController?.dispose();

    customerEmailFocusNode?.dispose();
    customerEmailTextController?.dispose();

    customerMobileFocusNode?.dispose();
    customerMobileTextController?.dispose();

    customerAddressFocusNode?.dispose();
    customerAddressTextController?.dispose();
  }
}
