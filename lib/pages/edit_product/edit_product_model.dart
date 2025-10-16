import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_product_widget.dart' show EditProductWidget;
import 'package:flutter/material.dart';

class EditProductModel extends FlutterFlowModel<EditProductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  String? _productNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x8e4pgj1' /* product name is required */,
      );
    }

    return null;
  }

  // State field(s) for productPricePerUnit widget.
  FocusNode? productPricePerUnitFocusNode;
  TextEditingController? productPricePerUnitTextController;
  String? Function(BuildContext, String?)?
      productPricePerUnitTextControllerValidator;
  String? _productPricePerUnitTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qud6te0a' /* price per unit  is required */,
      );
    }

    return null;
  }

  // State field(s) for productUnit widget.
  FocusNode? productUnitFocusNode;
  TextEditingController? productUnitTextController;
  String? Function(BuildContext, String?)? productUnitTextControllerValidator;
  String? _productUnitTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6c7idhbt' /* unit is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Product Edit By Vendor API)] action in Button widget.
  ApiCallResponse? updateProductRes;

  @override
  void initState(BuildContext context) {
    productNameTextControllerValidator = _productNameTextControllerValidator;
    productPricePerUnitTextControllerValidator =
        _productPricePerUnitTextControllerValidator;
    productUnitTextControllerValidator = _productUnitTextControllerValidator;
  }

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    productPricePerUnitFocusNode?.dispose();
    productPricePerUnitTextController?.dispose();

    productUnitFocusNode?.dispose();
    productUnitTextController?.dispose();
  }
}
