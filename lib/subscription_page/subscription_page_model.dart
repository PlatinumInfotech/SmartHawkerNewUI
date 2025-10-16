import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/material.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Subscription Plans API)] action in SubscriptionPage widget.
  ApiCallResponse? subscriptionList;
  // Stores action output result for [Backend Call - API (Vendor Subscription Order)] action in Button widget.
  ApiCallResponse? subscriptionOrderRes;
  // Stores action output result for [Backend Call - API (Vendor Confirm Subsciption  Order)] action in Button widget.
  ApiCallResponse? apiResultp4d;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
