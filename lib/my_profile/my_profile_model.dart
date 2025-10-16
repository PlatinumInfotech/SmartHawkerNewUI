import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Vendor Profile API)] action in MyProfile widget.
  ApiCallResponse? profileAPI;
  bool isDataUploading_uploadedFile = false;
  FFUploadedFile uploadedLocalFile_uploadedFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for businessVendorName widget.
  FocusNode? businessVendorNameFocusNode;
  TextEditingController? businessVendorNameTextController;
  String? Function(BuildContext, String?)?
      businessVendorNameTextControllerValidator;
  // State field(s) for businessName widget.
  FocusNode? businessNameFocusNode;
  TextEditingController? businessNameTextController;
  String? Function(BuildContext, String?)? businessNameTextControllerValidator;
  // State field(s) for businessContactNumber widget.
  FocusNode? businessContactNumberFocusNode;
  TextEditingController? businessContactNumberTextController;
  String? Function(BuildContext, String?)?
      businessContactNumberTextControllerValidator;
  // State field(s) for businessEmailAddress widget.
  FocusNode? businessEmailAddressFocusNode;
  TextEditingController? businessEmailAddressTextController;
  String? Function(BuildContext, String?)?
      businessEmailAddressTextControllerValidator;
  // State field(s) for businessAddress widget.
  FocusNode? businessAddressFocusNode;
  TextEditingController? businessAddressTextController;
  String? Function(BuildContext, String?)?
      businessAddressTextControllerValidator;
  // State field(s) for businessGSTNo widget.
  FocusNode? businessGSTNoFocusNode;
  TextEditingController? businessGSTNoTextController;
  String? Function(BuildContext, String?)? businessGSTNoTextControllerValidator;
  bool isDataUploading_uploadedFile2 = false;
  FFUploadedFile uploadedLocalFile_uploadedFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Vendor Profile Update API)] action in Button widget.
  ApiCallResponse? apiResultjxl;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    businessVendorNameFocusNode?.dispose();
    businessVendorNameTextController?.dispose();

    businessNameFocusNode?.dispose();
    businessNameTextController?.dispose();

    businessContactNumberFocusNode?.dispose();
    businessContactNumberTextController?.dispose();

    businessEmailAddressFocusNode?.dispose();
    businessEmailAddressTextController?.dispose();

    businessAddressFocusNode?.dispose();
    businessAddressTextController?.dispose();

    businessGSTNoFocusNode?.dispose();
    businessGSTNoTextController?.dispose();
  }
}
