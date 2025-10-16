// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerSalesRecordStruct extends BaseStruct {
  CustomerSalesRecordStruct({
    int? customerId,
    int? staffId,
    int? productId,
    double? quantity,
    String? saleDate,
    String? quantityString,
  })  : _customerId = customerId,
        _staffId = staffId,
        _productId = productId,
        _quantity = quantity,
        _saleDate = saleDate,
        _quantityString = quantityString;

  // "CustomerId" field.
  int? _customerId;
  int get customerId => _customerId ?? 0;
  set customerId(int? val) => _customerId = val;

  void incrementCustomerId(int amount) => customerId = customerId + amount;

  bool hasCustomerId() => _customerId != null;

  // "StaffId" field.
  int? _staffId;
  int get staffId => _staffId ?? 0;
  set staffId(int? val) => _staffId = val;

  void incrementStaffId(int amount) => staffId = staffId + amount;

  bool hasStaffId() => _staffId != null;

  // "ProductId" field.
  int? _productId;
  int get productId => _productId ?? 0;
  set productId(int? val) => _productId = val;

  void incrementProductId(int amount) => productId = productId + amount;

  bool hasProductId() => _productId != null;

  // "Quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "SaleDate" field.
  String? _saleDate;
  String get saleDate => _saleDate ?? '';
  set saleDate(String? val) => _saleDate = val;

  bool hasSaleDate() => _saleDate != null;

  // "QuantityString" field.
  String? _quantityString;
  String get quantityString => _quantityString ?? '';
  set quantityString(String? val) => _quantityString = val;

  bool hasQuantityString() => _quantityString != null;

  static CustomerSalesRecordStruct fromMap(Map<String, dynamic> data) =>
      CustomerSalesRecordStruct(
        customerId: castToType<int>(data['CustomerId']),
        staffId: castToType<int>(data['StaffId']),
        productId: castToType<int>(data['ProductId']),
        quantity: castToType<double>(data['Quantity']),
        saleDate: data['SaleDate'] as String?,
        quantityString: data['QuantityString'] as String?,
      );

  static CustomerSalesRecordStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerSalesRecordStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'CustomerId': _customerId,
        'StaffId': _staffId,
        'ProductId': _productId,
        'Quantity': _quantity,
        'SaleDate': _saleDate,
        'QuantityString': _quantityString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CustomerId': serializeParam(
          _customerId,
          ParamType.int,
        ),
        'StaffId': serializeParam(
          _staffId,
          ParamType.int,
        ),
        'ProductId': serializeParam(
          _productId,
          ParamType.int,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'SaleDate': serializeParam(
          _saleDate,
          ParamType.String,
        ),
        'QuantityString': serializeParam(
          _quantityString,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerSalesRecordStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CustomerSalesRecordStruct(
        customerId: deserializeParam(
          data['CustomerId'],
          ParamType.int,
          false,
        ),
        staffId: deserializeParam(
          data['StaffId'],
          ParamType.int,
          false,
        ),
        productId: deserializeParam(
          data['ProductId'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.double,
          false,
        ),
        saleDate: deserializeParam(
          data['SaleDate'],
          ParamType.String,
          false,
        ),
        quantityString: deserializeParam(
          data['QuantityString'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerSalesRecordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerSalesRecordStruct &&
        customerId == other.customerId &&
        staffId == other.staffId &&
        productId == other.productId &&
        quantity == other.quantity &&
        saleDate == other.saleDate &&
        quantityString == other.quantityString;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [customerId, staffId, productId, quantity, saleDate, quantityString]);
}

CustomerSalesRecordStruct createCustomerSalesRecordStruct({
  int? customerId,
  int? staffId,
  int? productId,
  double? quantity,
  String? saleDate,
  String? quantityString,
}) =>
    CustomerSalesRecordStruct(
      customerId: customerId,
      staffId: staffId,
      productId: productId,
      quantity: quantity,
      saleDate: saleDate,
      quantityString: quantityString,
    );
