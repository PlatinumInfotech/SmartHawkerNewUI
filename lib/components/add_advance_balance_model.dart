import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_advance_balance_widget.dart' show AddAdvanceBalanceWidget;
import 'package:flutter/material.dart';

class AddAdvanceBalanceModel extends FlutterFlowModel<AddAdvanceBalanceWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'j0yd580x' /* amount is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Add Advance Payment)] action in Button widget.
  ApiCallResponse? addAdvanceAmountRes;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
