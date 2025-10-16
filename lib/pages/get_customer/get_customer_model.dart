import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'get_customer_widget.dart' show GetCustomerWidget;
import 'package:flutter/material.dart';

class GetCustomerModel extends FlutterFlowModel<GetCustomerWidget> {
  ///  Local state fields for this page.

  String? deviceId;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Customer List API)] action in GetCustomer widget.
  ApiCallResponse? apiResultijd;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
