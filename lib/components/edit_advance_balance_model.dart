import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_advance_balance_widget.dart' show EditAdvanceBalanceWidget;
import 'package:flutter/material.dart';

class EditAdvanceBalanceModel
    extends FlutterFlowModel<EditAdvanceBalanceWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mokna8fa' /* Enter amount is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Update Advance Payment)] action in Button widget.
  ApiCallResponse? updateAdvanceAmountRes;

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
