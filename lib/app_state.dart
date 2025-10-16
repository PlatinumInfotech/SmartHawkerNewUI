import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _MobileNumber = prefs.getString('ff_MobileNumber') ?? _MobileNumber;
    });
    _safeInit(() {
      _UserType = prefs.getString('ff_UserType') ?? _UserType;
    });
    _safeInit(() {
      _AuthenticationToken =
          prefs.getString('ff_AuthenticationToken') ?? _AuthenticationToken;
    });
    _safeInit(() {
      _cutomername = prefs.getString('ff_cutomername') ?? _cutomername;
    });
    _safeInit(() {
      _customerEmail = prefs.getString('ff_customerEmail') ?? _customerEmail;
    });
    _safeInit(() {
      _customerId = prefs.getInt('ff_customerId') ?? _customerId;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_connectedVendors')) {
        try {
          _connectedVendors =
              jsonDecode(prefs.getString('ff_connectedVendors') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _vendorId = prefs.getInt('ff_vendorId') ?? _vendorId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _MobileNumber = '';
  String get MobileNumber => _MobileNumber;
  set MobileNumber(String value) {
    _MobileNumber = value;
    prefs.setString('ff_MobileNumber', value);
  }

  int _APIResponseCode = 1;
  int get APIResponseCode => _APIResponseCode;
  set APIResponseCode(int value) {
    _APIResponseCode = value;
  }

  String _UserType = '';
  String get UserType => _UserType;
  set UserType(String value) {
    _UserType = value;
    prefs.setString('ff_UserType', value);
  }

  String _AuthenticationToken = '';
  String get AuthenticationToken => _AuthenticationToken;
  set AuthenticationToken(String value) {
    _AuthenticationToken = value;
    prefs.setString('ff_AuthenticationToken', value);
  }

  String _inputTextValue = '';
  String get inputTextValue => _inputTextValue;
  set inputTextValue(String value) {
    _inputTextValue = value;
  }

  CustomerSalesRecordStruct _CustomerJSON = CustomerSalesRecordStruct();
  CustomerSalesRecordStruct get CustomerJSON => _CustomerJSON;
  set CustomerJSON(CustomerSalesRecordStruct value) {
    _CustomerJSON = value;
  }

  void updateCustomerJSONStruct(Function(CustomerSalesRecordStruct) updateFn) {
    updateFn(_CustomerJSON);
  }

  List<TextFieldDataStruct> _textFieldList = [];
  List<TextFieldDataStruct> get textFieldList => _textFieldList;
  set textFieldList(List<TextFieldDataStruct> value) {
    _textFieldList = value;
  }

  void addToTextFieldList(TextFieldDataStruct value) {
    textFieldList.add(value);
  }

  void removeFromTextFieldList(TextFieldDataStruct value) {
    textFieldList.remove(value);
  }

  void removeAtIndexFromTextFieldList(int index) {
    textFieldList.removeAt(index);
  }

  void updateTextFieldListAtIndex(
    int index,
    TextFieldDataStruct Function(TextFieldDataStruct) updateFn,
  ) {
    textFieldList[index] = updateFn(_textFieldList[index]);
  }

  void insertAtIndexInTextFieldList(int index, TextFieldDataStruct value) {
    textFieldList.insert(index, value);
  }

  String _cutomername = '';
  String get cutomername => _cutomername;
  set cutomername(String value) {
    _cutomername = value;
    prefs.setString('ff_cutomername', value);
  }

  String _customerEmail = '';
  String get customerEmail => _customerEmail;
  set customerEmail(String value) {
    _customerEmail = value;
    prefs.setString('ff_customerEmail', value);
  }

  int _customerId = 0;
  int get customerId => _customerId;
  set customerId(int value) {
    _customerId = value;
    prefs.setInt('ff_customerId', value);
  }

  double _totalAmount = 0.0;
  double get totalAmount => _totalAmount;
  set totalAmount(double value) {
    _totalAmount = value;
  }

  dynamic _connectedVendors;
  dynamic get connectedVendors => _connectedVendors;
  set connectedVendors(dynamic value) {
    _connectedVendors = value;
    prefs.setString('ff_connectedVendors', jsonEncode(value));
  }

  dynamic _SalesData;
  dynamic get SalesData => _SalesData;
  set SalesData(dynamic value) {
    _SalesData = value;
  }

  double _customerMonthlyPurchaseTotal = 0.0;
  double get customerMonthlyPurchaseTotal => _customerMonthlyPurchaseTotal;
  set customerMonthlyPurchaseTotal(double value) {
    _customerMonthlyPurchaseTotal = value;
  }

  int _vendorId = 0;
  int get vendorId => _vendorId;
  set vendorId(int value) {
    _vendorId = value;
    prefs.setInt('ff_vendorId', value);
  }

  bool _isExpanded = true;
  bool get isExpanded => _isExpanded;
  set isExpanded(bool value) {
    _isExpanded = value;
  }

  int _selectedIndex = -1;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  dynamic _SalesData2;
  dynamic get SalesData2 => _SalesData2;
  set SalesData2(dynamic value) {
    _SalesData2 = value;
  }

  double _totalAmount2 = 0.0;
  double get totalAmount2 => _totalAmount2;
  set totalAmount2(double value) {
    _totalAmount2 = value;
  }

  int _selectedMonth = 0;
  int get selectedMonth => _selectedMonth;
  set selectedMonth(int value) {
    _selectedMonth = value;
  }

  int _selectedYear = 0;
  int get selectedYear => _selectedYear;
  set selectedYear(int value) {
    _selectedYear = value;
  }

  String _verificationId = '';
  String get verificationId => _verificationId;
  set verificationId(String value) {
    _verificationId = value;
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  String _imageBase64 = '';
  String get imageBase64 => _imageBase64;
  set imageBase64(String value) {
    _imageBase64 = value;
  }

  String _businessImage = '';
  String get businessImage => _businessImage;
  set businessImage(String value) {
    _businessImage = value;
  }

  String _qrCodeImage = '';
  String get qrCodeImage => _qrCodeImage;
  set qrCodeImage(String value) {
    _qrCodeImage = value;
  }

  String _CustomerPaymentQR = '';
  String get CustomerPaymentQR => _CustomerPaymentQR;
  set CustomerPaymentQR(String value) {
    _CustomerPaymentQR = value;
  }

  bool _isFirstLoad = true;
  bool get isFirstLoad => _isFirstLoad;
  set isFirstLoad(bool value) {
    _isFirstLoad = value;
  }

  double _InvoiceAdvancAmount = 0.0;
  double get InvoiceAdvancAmount => _InvoiceAdvancAmount;
  set InvoiceAdvancAmount(double value) {
    _InvoiceAdvancAmount = value;
  }

  String _customerMobile = '';
  String get customerMobile => _customerMobile;
  set customerMobile(String value) {
    _customerMobile = value;
  }

  String _AppVersion = '1.1.0';
  String get AppVersion => _AppVersion;
  set AppVersion(String value) {
    _AppVersion = value;
  }

  String _razorpayResult = '';
  String get razorpayResult => _razorpayResult;
  set razorpayResult(String value) {
    _razorpayResult = value;
  }

  String _razorpayOrderId = '';
  String get razorpayOrderId => _razorpayOrderId;
  set razorpayOrderId(String value) {
    _razorpayOrderId = value;
  }

  String _razorpayPaymentId = '';
  String get razorpayPaymentId => _razorpayPaymentId;
  set razorpayPaymentId(String value) {
    _razorpayPaymentId = value;
  }

  dynamic _razorpayStatus;
  dynamic get razorpayStatus => _razorpayStatus;
  set razorpayStatus(dynamic value) {
    _razorpayStatus = value;
  }

  dynamic _razorpayErrorMessage;
  dynamic get razorpayErrorMessage => _razorpayErrorMessage;
  set razorpayErrorMessage(dynamic value) {
    _razorpayErrorMessage = value;
  }

  String _razorpayResponse = '';
  String get razorpayResponse => _razorpayResponse;
  set razorpayResponse(String value) {
    _razorpayResponse = value;
  }

  String _speechJson = '';
  String get speechJson => _speechJson;
  set speechJson(String value) {
    _speechJson = value;
  }

  bool _isListening = false;
  bool get isListening => _isListening;
  set isListening(bool value) {
    _isListening = value;
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String _product = '';
  String get product => _product;
  set product(String value) {
    _product = value;
  }

  double _quantity = 0.0;
  double get quantity => _quantity;
  set quantity(double value) {
    _quantity = value;
  }

  String _unit = '';
  String get unit => _unit;
  set unit(String value) {
    _unit = value;
  }

  String _rawSpeechText = '';
  String get rawSpeechText => _rawSpeechText;
  set rawSpeechText(String value) {
    _rawSpeechText = value;
  }

  String _extractedName = '';
  String get extractedName => _extractedName;
  set extractedName(String value) {
    _extractedName = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
