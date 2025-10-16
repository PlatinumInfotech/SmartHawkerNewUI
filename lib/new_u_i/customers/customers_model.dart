import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'customers_widget.dart' show CustomersWidget;
import 'package:flutter/material.dart';

class CustomersModel extends FlutterFlowModel<CustomersWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Customer List API)] action in Customers widget.
  ApiCallResponse? customerListApi;
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
