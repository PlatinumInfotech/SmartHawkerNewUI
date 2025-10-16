import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'paybill_widget.dart' show PaybillWidget;
import 'package:flutter/material.dart';

class PaybillModel extends FlutterFlowModel<PaybillWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  String? _amountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uadfp2z9' /* amount is required */,
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
        '057i4ucf' /* note is required */,
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
