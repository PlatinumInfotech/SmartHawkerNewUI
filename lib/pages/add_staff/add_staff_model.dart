import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_staff_widget.dart' show AddStaffWidget;
import 'package:flutter/material.dart';

class AddStaffModel extends FlutterFlowModel<AddStaffWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for staffName widget.
  FocusNode? staffNameFocusNode;
  TextEditingController? staffNameTextController;
  String? Function(BuildContext, String?)? staffNameTextControllerValidator;
  String? _staffNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'poh43k5y' /* Staff Name is required */,
      );
    }

    return null;
  }

  // State field(s) for staffEmail widget.
  FocusNode? staffEmailFocusNode;
  TextEditingController? staffEmailTextController;
  String? Function(BuildContext, String?)? staffEmailTextControllerValidator;
  // State field(s) for staffMobileNumber widget.
  FocusNode? staffMobileNumberFocusNode;
  TextEditingController? staffMobileNumberTextController;
  String? Function(BuildContext, String?)?
      staffMobileNumberTextControllerValidator;
  String? _staffMobileNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8nxn0t4m' /* Mobile Number is required */,
      );
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    if (!RegExp('^\\d{10}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ca03sx1v' /* Enter a valid 10-digit mobile ... */,
      );
    }
    return null;
  }

  // State field(s) for staffRole widget.
  FocusNode? staffRoleFocusNode;
  TextEditingController? staffRoleTextController;
  String? Function(BuildContext, String?)? staffRoleTextControllerValidator;
  // State field(s) for staffAddress widget.
  FocusNode? staffAddressFocusNode;
  TextEditingController? staffAddressTextController;
  String? Function(BuildContext, String?)? staffAddressTextControllerValidator;
  String? _staffAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rbuojytt' /* Address Line 1 is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Add Staff API)] action in Button widget.
  ApiCallResponse? apiResultAddStaff;

  @override
  void initState(BuildContext context) {
    staffNameTextControllerValidator = _staffNameTextControllerValidator;
    staffMobileNumberTextControllerValidator =
        _staffMobileNumberTextControllerValidator;
    staffAddressTextControllerValidator = _staffAddressTextControllerValidator;
  }

  @override
  void dispose() {
    staffNameFocusNode?.dispose();
    staffNameTextController?.dispose();

    staffEmailFocusNode?.dispose();
    staffEmailTextController?.dispose();

    staffMobileNumberFocusNode?.dispose();
    staffMobileNumberTextController?.dispose();

    staffRoleFocusNode?.dispose();
    staffRoleTextController?.dispose();

    staffAddressFocusNode?.dispose();
    staffAddressTextController?.dispose();
  }
}
