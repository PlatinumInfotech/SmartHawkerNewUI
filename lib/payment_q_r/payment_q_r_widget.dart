import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_q_r_model.dart';
export 'payment_q_r_model.dart';

/// Create a simple payment page in FlutterFlow with a clean design featuring
/// a centered QR code, a heading like 'Scan to Pay', a subtitle such as 'Scan
/// this QR code to complete your payment', and a back button at the top-left
/// corner for navigation.
///
/// Keep the page minimalistic and user-friendly, focusing only on essential
/// elements.
class PaymentQRWidget extends StatefulWidget {
  const PaymentQRWidget({
    super.key,
    required this.vendorId,
  });

  final int? vendorId;

  static String routeName = 'PaymentQR';
  static String routePath = '/paymentQR';

  @override
  State<PaymentQRWidget> createState() => _PaymentQRWidgetState();
}

class _PaymentQRWidgetState extends State<PaymentQRWidget> {
  late PaymentQRModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentQRModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PaymentQR'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PAYMENT_Q_R_PAGE_PaymentQR_ON_INIT_STATE');
      logFirebaseEvent('PaymentQR_backend_call');
      _model.qrPayment =
          await SmartHawkerAPIsGroup.qrPaymentCustomerAPICall.call(
        vendorId: widget.vendorId,
        authToken: FFAppState().AuthenticationToken,
      );

      if ((_model.qrPayment?.succeeded ?? true)) {
        logFirebaseEvent('PaymentQR_update_app_state');
        FFAppState().CustomerPaymentQR = getJsonField(
          (_model.qrPayment?.jsonBody ?? ''),
          r'''$.data.qr_code_image''',
        ).toString();
        safeSetState(() {});
      } else {
        logFirebaseEvent('PaymentQR_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent3,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('PAYMENT_Q_R_arrow_back_rounded_ICN_ON_TA');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'hr6qa8yy' /* Back  */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .fontStyle,
                        ),
                        fontSize: 26.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).displaySmall.fontStyle,
                      ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('PAYMENT_Q_R_PAGE_Icon_dvbac1mu_ON_TAP');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed(
                        CustomerHomePageWidget.routeName,
                        queryParameters: {
                          'connectedVendors': serializeParam(
                            FFAppState().connectedVendors,
                            ParamType.JSON,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.home,
                      color: FlutterFlowTheme.of(context).accent3,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 16.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'fcgwrji2' /* Scan to Pay */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Container(
                          width: 400.0,
                          height: 400.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x19000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 300.0,
                                  height: 350.0,
                                  child: custom_widgets.MemoryImageWidget(
                                    width: 300.0,
                                    height: 350.0,
                                    encodedStr: FFAppState().CustomerPaymentQR,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 24.0, 32.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '92smjdj3' /* Scan this QR code to complete ... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
