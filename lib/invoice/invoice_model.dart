import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invoice_widget.dart' show InvoiceWidget;
import 'package:flutter/material.dart';

class InvoiceModel extends FlutterFlowModel<InvoiceWidget> {
  ///  Local state fields for this page.

  String? advanceAmount;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Vendor View Invoice API )] action in Invoice widget.
  ApiCallResponse? viewInvoiceResponse;
  // Stores action output result for [Backend Call - API (Get Advance Pyment API)] action in Invoice widget.
  ApiCallResponse? getAdvanceAmountResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
