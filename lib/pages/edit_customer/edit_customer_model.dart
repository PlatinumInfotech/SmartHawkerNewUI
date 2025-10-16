import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'edit_customer_widget.dart' show EditCustomerWidget;
import 'package:flutter/material.dart';

class EditCustomerModel extends FlutterFlowModel<EditCustomerWidget> {
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
        'ryzttl5m' /* name is required */,
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
        'wbx8wy4c' /* mobile is required */,
      );
    }

    if (!RegExp('^\\d{10}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '0qndoq7h' /* Enter a valid 10-digit mobile ... */,
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
        'nx3m9o4g' /* address is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Edit Customer API)] action in Button widget.
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
