import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_product_widget.dart' show AddProductWidget;
import 'package:flutter/material.dart';

class AddProductModel extends FlutterFlowModel<AddProductWidget> {
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
        'g5mz1vwt' /* Product Name * is required */,
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
        'oc4udwzp' /* Unit * is required */,
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
        '9v0hqv8v' /* Price per Unit * is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Add Product Info API)] action in Button widget.
  ApiCallResponse? apiResultAddProduct;

  @override
  void initState(BuildContext context) {
    productNameTextControllerValidator = _productNameTextControllerValidator;
    productUnitTextControllerValidator = _productUnitTextControllerValidator;
    productPricePerUnitTextControllerValidator =
        _productPricePerUnitTextControllerValidator;
  }

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    productUnitFocusNode?.dispose();
    productUnitTextController?.dispose();

    productPricePerUnitFocusNode?.dispose();
    productPricePerUnitTextController?.dispose();
  }
}
