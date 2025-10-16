import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cust_monthly_purchase_report_by_vendor_widget.dart'
    show CustMonthlyPurchaseReportByVendorWidget;
import 'package:flutter/material.dart';

class CustMonthlyPurchaseReportByVendorModel
    extends FlutterFlowModel<CustMonthlyPurchaseReportByVendorWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for month widget.
  int? monthValue;
  FormFieldController<int>? monthValueController;
  // State field(s) for year widget.
  int? yearValue;
  FormFieldController<int>? yearValueController;
  // Stores action output result for [Backend Call - API (customer order list)] action in Button widget.
  ApiCallResponse? apiResult8km;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
