import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_pop_u_p_widget.dart' show CustomerPopUPWidget;
import 'package:flutter/material.dart';

class CustomerPopUPModel extends FlutterFlowModel<CustomerPopUPWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (sales add by voice command)] action in IconButton widget.
  ApiCallResponse? apiResultamo;
  // Stores action output result for [Backend Call - API (Extract speech API)] action in IconButton widget.
  ApiCallResponse? extractSpeechOutput;
  // Stores action output result for [Backend Call - API (sales add by voice command)] action in IconButton widget.
  ApiCallResponse? salesAddOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
