import '/backend/api_requests/api_calls.dart';
import '/components/app_update_widget.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    bool? loginUserValue,
  }) : this.loginUserValue = loginUserValue ?? false;

  final bool loginUserValue;

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Login'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_PAGE_Login_ON_INIT_STATE');
      logFirebaseEvent('Login_custom_action');
      _model.internetConnection = await actions.checkMyInternet();
      if (_model.internetConnection == true) {
        logFirebaseEvent('Login_backend_call');
        _model.appVersionResponse =
            await SmartHawkerAPIsGroup.checkAppVersionCall.call();

        if ('${getJsonField(
              (_model.appVersionResponse?.jsonBody ?? ''),
              r'''$.data.latest_version''',
            ).toString()}' !=
            FFAppState().AppVersion) {
          logFirebaseEvent('Login_alert_dialog');
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: AppUpdateWidget(
                    updateURL: getJsonField(
                      (_model.appVersionResponse?.jsonBody ?? ''),
                      r'''$.data.update_url''',
                    ).toString(),
                  ),
                ),
              );
            },
          );
        } else {
          if ((FFAppState().isFirstLoad == true) &&
              (FFAppState().AuthenticationToken != '')) {
            if ((FFAppState().UserType == 'vendor') &&
                (FFAppState().AuthenticationToken != '')) {
              logFirebaseEvent('Login_navigate_to');

              context.pushNamed(
                HomeScreenWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else if ((FFAppState().UserType == 'employee') &&
                (FFAppState().AuthenticationToken != '')) {
              logFirebaseEvent('Login_navigate_to');

              context.pushNamed(
                EPageWidget.routeName,
                queryParameters: {
                  'connectedVendors': serializeParam(
                    FFAppState().connectedVendors,
                    ParamType.JSON,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else if ((FFAppState().UserType == 'customer') &&
                (FFAppState().AuthenticationToken != '')) {
              logFirebaseEvent('Login_navigate_to');

              context.pushNamed(
                CustomerHomePageWidget.routeName,
                queryParameters: {
                  'connectedVendors': serializeParam(
                    FFAppState().connectedVendors,
                    ParamType.JSON,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              logFirebaseEvent('Login_navigate_to');

              context.pushNamed(
                LoginWidget.routeName,
                queryParameters: {
                  'loginUserValue': serializeParam(
                    false,
                    ParamType.bool,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }

            logFirebaseEvent('Login_custom_action');
            _model.fcmtoken = await actions.getFcmToken();
            logFirebaseEvent('Login_backend_call');
            _model.signInResponse =
                await SmartHawkerAPIsGroup.loginAPICall.call(
              mobile: FFAppState().MobileNumber,
              userType: FFAppState().UserType,
              fcmToken: _model.fcmtoken,
            );

            if ((_model.signInResponse?.succeeded ?? true)) {
              logFirebaseEvent('Login_update_app_state');
              FFAppState().AuthenticationToken = getJsonField(
                (_model.signInResponse?.jsonBody ?? ''),
                r'''$.token''',
              ).toString();
              FFAppState().MobileNumber = FFAppState().MobileNumber;
              FFAppState().UserType = FFAppState().UserType;
              FFAppState().connectedVendors = getJsonField(
                (_model.signInResponse?.jsonBody ?? ''),
                r'''$.user''',
              );
              safeSetState(() {});
              if (FFAppState().UserType == 'customer') {
                logFirebaseEvent('Login_navigate_to');

                context.goNamed(
                  CustomerHomePageWidget.routeName,
                  queryParameters: {
                    'connectedVendors': serializeParam(
                      FFAppState().connectedVendors,
                      ParamType.JSON,
                    ),
                  }.withoutNulls,
                );
              } else {
                if (FFAppState().UserType == 'vendor') {
                  logFirebaseEvent('Login_navigate_to');

                  context.goNamed(HomeScreenWidget.routeName);

                  logFirebaseEvent('Login_update_app_state');
                  FFAppState().vendorId = getJsonField(
                    (_model.signInResponse?.jsonBody ?? ''),
                    r'''$.user.id''',
                  );
                  safeSetState(() {});
                } else {
                  if (FFAppState().UserType == 'employee') {
                    logFirebaseEvent('Login_navigate_to');

                    context.goNamed(
                      EPageWidget.routeName,
                      queryParameters: {
                        'connectedVendors': serializeParam(
                          FFAppState().connectedVendors,
                          ParamType.JSON,
                        ),
                      }.withoutNulls,
                    );
                  } else {
                    logFirebaseEvent('Login_show_snack_bar');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'failed',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }
                }
              }
            } else {
              logFirebaseEvent('Login_alert_dialog');
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: Text('Message'),
                    content: Text(
                        'Invalid Details, Please Login With Correct Details'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  );
                },
              );
              logFirebaseEvent('Login_navigate_to');

              context.pushNamed(
                LoginWidget.routeName,
                queryParameters: {
                  'loginUserValue': serializeParam(
                    false,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            }
          }
        }
      } else {
        logFirebaseEvent('Login_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please check your internet connection',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).accent1,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    });

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: 100.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 118.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .darkInfo,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, 0.87),
                                          end:
                                              AlignmentDirectional(-1.0, -0.87),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ksc943mk' /* SH */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'r6xewj5h' /* Smart Hawker */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontStyle,
                                            ),
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 100.0, 32.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'c3b9xa9w' /* Welcome */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmall
                                                      .fontStyle,
                                            ),
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'j00hcvev' /* Let's get started by selecting... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      child: Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 16.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  FlutterFlowRadioButton(
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ndu1ni1k' /* Vendor */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rzsx3pp1' /* Employee */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gc6yr6us' /* Customer */,
                                                      )
                                                    ].toList(),
                                                    onChanged: (val) =>
                                                        safeSetState(() {}),
                                                    controller: _model
                                                            .radioButtonValueController ??=
                                                        FormFieldController<
                                                                String>(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                      'pjgc3qpf' /* Vendor */,
                                                    )),
                                                    optionHeight: 32.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                    textPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                6.0, 0.0),
                                                    buttonPosition:
                                                        RadioButtonPosition
                                                            .left,
                                                    direction: Axis.horizontal,
                                                    radioButtonColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .darkInfo,
                                                    inactiveRadioButtonColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    toggleable: false,
                                                    horizontalAlignment:
                                                        WrapAlignment.start,
                                                    verticalAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 16.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .phoneNumberTextController,
                                                focusNode:
                                                    _model.phoneNumberFocusNode,
                                                autofocus: true,
                                                autofillHints: [
                                                  AutofillHints.name
                                                ],
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0hvdbqqu' /* Mobile Number */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                  alignLabelWithHint: false,
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hklln2hb' /* Enter your mobile number */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lightInfo,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                maxLength: 11,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .phoneNumberTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(
                                                          RegExp('[a-zA-Z0-9]'))
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .darkInfo,
                                                  ),
                                                  child: Checkbox(
                                                    value:
                                                        _model.checkboxValue ??=
                                                            false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() =>
                                                          _model.checkboxValue =
                                                              newValue!);
                                                    },
                                                    side:
                                                        (FlutterFlowTheme.of(
                                                                        context)
                                                                    .darkInfo !=
                                                                null)
                                                            ? BorderSide(
                                                                width: 2,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .darkInfo,
                                                              )
                                                            : null,
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'LOGIN_PAGE_Text_lhnfowv8_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_launch_u_r_l');
                                                    await launchURL(
                                                        'https://platinuminfo.tech/terms-and-conditions');
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xfx9893v' /* I accept the Terms & Condition... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 16.0),
                                              child: FFButtonWidget(
                                                onPressed: ((_model
                                                                .checkboxValue !=
                                                            true) ||
                                                        (_model.phoneNumberTextController
                                                                    .text ==
                                                                ''))
                                                    ? null
                                                    : () async {
                                                        logFirebaseEvent(
                                                            'LOGIN_PAGE_GET_O_T_P_BTN_ON_TAP');
                                                        if ((_model.phoneNumberTextController.text == '9828143053') ||
                                                            (_model.phoneNumberTextController
                                                                    .text ==
                                                                '9664232630') ||
                                                            (_model
                                                                    .phoneNumberTextController
                                                                    .text ==
                                                                '8107113785') ||
                                                            (_model.phoneNumberTextController
                                                                    .text ==
                                                                '8440821748') ||
                                                            (_model.phoneNumberTextController
                                                                    .text ==
                                                                '8502098106')) {
                                                          logFirebaseEvent(
                                                              'Button_update_app_state');
                                                          FFAppState()
                                                                  .MobileNumber =
                                                              _model
                                                                  .phoneNumberTextController
                                                                  .text;
                                                          FFAppState()
                                                              .UserType = () {
                                                            if (_model
                                                                    .radioButtonValue ==
                                                                'Vendor') {
                                                              return 'vendor';
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                'Employee') {
                                                              return 'employee';
                                                            } else {
                                                              return 'customer';
                                                            }
                                                          }();
                                                          safeSetState(() {});
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_backend_call');
                                                          _model.sendOTPResponse =
                                                              await SendOTPCall
                                                                  .call(
                                                            mobileNumber: _model
                                                                .phoneNumberTextController
                                                                .text,
                                                          );

                                                          logFirebaseEvent(
                                                              'Button_update_app_state');
                                                          FFAppState()
                                                                  .MobileNumber =
                                                              _model
                                                                  .phoneNumberTextController
                                                                  .text;
                                                          FFAppState()
                                                              .UserType = () {
                                                            if (_model
                                                                    .radioButtonValue ==
                                                                'Vendor') {
                                                              return 'vendor';
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                'Employee') {
                                                              return 'employee';
                                                            } else {
                                                              return 'customer';
                                                            }
                                                          }();
                                                          FFAppState()
                                                                  .verificationId =
                                                              getJsonField(
                                                            (_model.sendOTPResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.data.verificationId''',
                                                          ).toString();
                                                          safeSetState(() {});
                                                        }

                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context.pushNamed(
                                                            PhoneVerificationWidget
                                                                .routeName);

                                                        safeSetState(() {});
                                                      },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '57905q57' /* Get OTP */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 150.0,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                  elevation: 5.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  disabledColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  disabledTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                            ),
                                            if (_model.radioButtonValue ==
                                                'Vendor')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 30.0, 0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'oxfvj7mu' /* Don't have an account, Click h... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .readexPro(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3rxoo2i9' /* Sign Up! */,
                                                        ),
                                                        style: GoogleFonts
                                                            .readexPro(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .darkInfo,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ),
                                                        mouseCursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap =
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'LOGIN_PAGE_RichTextSpan_fb1i33oq_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'RichTextSpan_navigate_to');

                                                                context.pushNamed(
                                                                    SignUpWidget
                                                                        .routeName);

                                                                logFirebaseEvent(
                                                                    'RichTextSpan_update_app_state');

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                          width: 100.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                'https://images.unsplash.com/photo-1514924013411-cbf25faa35bb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1380&q=80',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
