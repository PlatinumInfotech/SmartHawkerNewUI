import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sample_widget.dart' show SampleWidget;
import 'package:flutter/material.dart';

class SampleModel extends FlutterFlowModel<SampleWidget> {
  ///  Local state fields for this component.

  TextFieldDataStruct? objectLocal;
  void updateObjectLocalStruct(Function(TextFieldDataStruct) updateFn) {
    updateFn(objectLocal ??= TextFieldDataStruct());
  }

  ///  State fields for stateful widgets in this component.

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
