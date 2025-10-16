import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'monthly_sales_report_for_customer_widget.dart'
    show MonthlySalesReportForCustomerWidget;
import 'package:flutter/material.dart';

class MonthlySalesReportForCustomerModel
    extends FlutterFlowModel<MonthlySalesReportForCustomerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (Product Small Summary API)] action in Button widget.
  ApiCallResponse? apiResultzmx;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
