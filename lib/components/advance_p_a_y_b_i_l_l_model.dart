import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'advance_p_a_y_b_i_l_l_widget.dart' show AdvancePAYBILLWidget;
import 'package:flutter/material.dart';

class AdvancePAYBILLModel extends FlutterFlowModel<AdvancePAYBILLWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7h5w448t' /* amount is required */,
      );
    }

    return null;
  }

  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  String? _notesTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nzd23c9k' /* note is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Make Payment API By Vendor)] action in Button widget.
  ApiCallResponse? makePaymentAPiResponse;

  @override
  void initState(BuildContext context) {
    amountTextControllerValidator = _amountTextControllerValidator;
    notesTextControllerValidator = _notesTextControllerValidator;
  }

  @override
  void dispose() {
    amountFocusNode?.dispose();
    amountTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
