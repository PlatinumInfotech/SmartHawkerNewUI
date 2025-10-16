import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'monthly_sales_report_for_employee_widget.dart'
    show MonthlySalesReportForEmployeeWidget;
import 'package:flutter/material.dart';

class MonthlySalesReportForEmployeeModel
    extends FlutterFlowModel<MonthlySalesReportForEmployeeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (Product Small Summary API)] action in Button widget.
  ApiCallResponse? apiResultzmx;
  // Stores action output result for [Backend Call - API (Sales Delete By Vendor API)] action in IconButton widget.
  ApiCallResponse? apiResults7nCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
