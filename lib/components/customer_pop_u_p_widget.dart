import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'customer_pop_u_p_model.dart';
export 'customer_pop_u_p_model.dart';

class CustomerPopUPWidget extends StatefulWidget {
  const CustomerPopUPWidget({
    super.key,
    required this.customerName,
    required this.productId,
    this.extractCustomerName,
  });

  final String? customerName;
  final int? productId;
  final String? extractCustomerName;

  @override
  State<CustomerPopUPWidget> createState() => _CustomerPopUPWidgetState();
}

class _CustomerPopUPWidgetState extends State<CustomerPopUPWidget> {
  late CustomerPopUPModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerPopUPModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().name != ''
          ? FFAppState().name
          : widget.extractCustomerName,
      'Search..',
    ));
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: MediaQuery.sizeOf(context).height * 0.8,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 12.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  4.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'g7xlvs47' /* Select Customer */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                ),
                TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 500),
                    () => safeSetState(() {}),
                  ),
                  autofocus: false,
                  textInputAction: TextInputAction.search,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: FFLocalizations.of(context).getText(
                      't4fltmax' /* Search customers... */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lightInfo,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  minLines: 1,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: SmartHawkerAPIsGroup.customerListAPICall.call(
                          vendorId: FFAppState().vendorId,
                          searchValue: _model.textController.text,
                          authToken: FFAppState().AuthenticationToken,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewCustomerListAPIResponse =
                              snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final customerListRes = getJsonField(
                                listViewCustomerListAPIResponse.jsonBody,
                                r'''$.data''',
                              ).toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: customerListRes.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 8.0),
                                itemBuilder: (context, customerListResIndex) {
                                  final customerListResItem =
                                      customerListRes[customerListResIndex];
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: Color(0x1A000000),
                                          offset: Offset(
                                            0.0,
                                            1.0,
                                          ),
                                          spreadRadius: 0.0,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getJsonField(
                                                    customerListResItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    customerListResItem,
                                                    r'''$.address''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  getJsonField(
                                                    customerListResItem,
                                                    r'''$.mobile''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 4.0)),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            icon: Icon(
                                              Icons.arrow_forward,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'CUSTOMER_POP_U_P_arrow_forward_ICN_ON_TA');
                                              var _shouldSetState = false;
                                              if ((FFAppState().name !=
                                                          '') &&
                                                  (FFAppState().product !=
                                                          '') &&
                                                  ((FFAppState().quantity >
                                                          0.0) &&
                                                      (FFAppState().quantity >
                                                          0.0))) {
                                                logFirebaseEvent(
                                                    'IconButton_alert_dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Message'),
                                                              content: Text(
                                                                  'Do you want to add ${FFAppState().quantity.toString()} ${FFAppState().unit} of ${FFAppState().product} ?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  logFirebaseEvent(
                                                      'IconButton_backend_call');
                                                  _model.apiResultamo =
                                                      await SmartHawkerAPIsGroup
                                                          .salesAddByVoiceCommandCall
                                                          .call(
                                                    customerId: getJsonField(
                                                      customerListResItem,
                                                      r'''$.id''',
                                                    ),
                                                    productName:
                                                        FFAppState().product,
                                                    quantity:
                                                        FFAppState().quantity,
                                                    unit: FFAppState().unit,
                                                    saleDate: dateTimeFormat(
                                                      "yMMMd",
                                                      getCurrentTimestamp,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    authToken: FFAppState()
                                                        .AuthenticationToken,
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.apiResultamo
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'IconButton_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              Text('Message'),
                                                          content:
                                                              Text(getJsonField(
                                                            (_model.apiResultamo
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString()),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'IconButton_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              Text('Message'),
                                                          content:
                                                              Text(getJsonField(
                                                            (_model.apiResultamo
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString()),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }

                                                  logFirebaseEvent(
                                                      'IconButton_bottom_sheet');
                                                  Navigator.pop(context);
                                                  logFirebaseEvent(
                                                      'IconButton_update_app_state');
                                                  FFAppState().name = '';
                                                  FFAppState().product = '';
                                                  FFAppState().quantity = 0.0;
                                                  FFAppState().unit = '';
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                logFirebaseEvent(
                                                    'IconButton_backend_call');
                                                _model.extractSpeechOutput =
                                                    await SmartHawkerAPIsGroup
                                                        .extractSpeechAPICall
                                                        .call(
                                                  input: FFAppState()
                                                      .rawSpeechText,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.extractSpeechOutput
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'IconButton_alert_dialog');
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Message'),
                                                                content: Text(
                                                                    'Do you want to add ${getJsonField(
                                                                  (_model.extractSpeechOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.quantity''',
                                                                ).toString()} ${getJsonField(
                                                                  (_model.extractSpeechOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.unit''',
                                                                ).toString()} of ${getJsonField(
                                                                  (_model.extractSpeechOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.product_name''',
                                                                ).toString()} ?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    logFirebaseEvent(
                                                        'IconButton_backend_call');
                                                    _model.salesAddOutput =
                                                        await SmartHawkerAPIsGroup
                                                            .salesAddByVoiceCommandCall
                                                            .call(
                                                      customerId: getJsonField(
                                                        customerListResItem,
                                                        r'''$.id''',
                                                      ),
                                                      productName: getJsonField(
                                                        (_model.extractSpeechOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.product_name''',
                                                      ).toString(),
                                                      quantity: getJsonField(
                                                        (_model.extractSpeechOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.quantity''',
                                                      ),
                                                      unit: getJsonField(
                                                        (_model.extractSpeechOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.unit''',
                                                      ).toString(),
                                                      saleDate: dateTimeFormat(
                                                        "yMMMd",
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      authToken: FFAppState()
                                                          .AuthenticationToken,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.salesAddOutput
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'IconButton_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Message'),
                                                            content: Text(
                                                                getJsonField(
                                                              (_model.salesAddOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString()),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      logFirebaseEvent(
                                                          'IconButton_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Message'),
                                                            content: Text(
                                                                getJsonField(
                                                              (_model.salesAddOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString()),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    logFirebaseEvent(
                                                        'IconButton_bottom_sheet');
                                                    Navigator.pop(context);
                                                    logFirebaseEvent(
                                                        'IconButton_update_app_state');
                                                    FFAppState().name = '';
                                                    FFAppState().product = '';
                                                    FFAppState().unit = '';
                                                    FFAppState().quantity = 0.0;
                                                    FFAppState().extractedName =
                                                        '';
                                                    FFAppState().rawSpeechText =
                                                        '';
                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  } else {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CUSTOMER_POP_U_P_COMP_CANCEL_BTN_ON_TAP');
                              logFirebaseEvent('Button_bottom_sheet');
                              Navigator.pop(context);
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().name = '';
                              FFAppState().product = '';
                              FFAppState().quantity = 0.0;
                              FFAppState().unit = '';
                              FFAppState().extractedName = '';
                              FFAppState().rawSpeechText = '';
                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'fott4675' /* Cancel */,
                            ),
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
