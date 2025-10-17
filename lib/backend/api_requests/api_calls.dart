import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Hawker App API Group Code

class HawkerAppAPIGroup {
  static String getBaseUrl({
    String? authenticationToken = '',
    String? mobileNo = '',
  }) =>
      'https://vyapar.techfolks.in/API/HawkerApp/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authenticationToken]',
    'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
    'mobile_no': '[mobileNo]',
  };
  static AddCustomerCall addCustomerCall = AddCustomerCall();
  static GetCustomerCall getCustomerCall = GetCustomerCall();
  static AddTeamCall addTeamCall = AddTeamCall();
  static GetTeamCall getTeamCall = GetTeamCall();
  static AddBrandCall addBrandCall = AddBrandCall();
  static GetBrandCall getBrandCall = GetBrandCall();
  static AddCategoryCall addCategoryCall = AddCategoryCall();
  static GetCategoryCall getCategoryCall = GetCategoryCall();
  static AddProductCall addProductCall = AddProductCall();
  static GetProductCall getProductCall = GetProductCall();
  static AddSalesCall addSalesCall = AddSalesCall();
}

class AddCustomerCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? address = '',
    String? employeeMobileNo = '',
    int? isActive,
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    final ffApiRequestBody = '''
{
  "Name": "${name}",
  "Address": "${address}",
  "MobileNo": "${employeeMobileNo}",
  "IsActive": ${isActive}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Customer',
      apiUrl: '${baseUrl}/PostCustomer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic responseData(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  int? responseCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? responseMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response_message''',
      ));
}

class GetCustomerCall {
  Future<ApiCallResponse> call({
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Customer',
      apiUrl: '${baseUrl}GetCustomers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic getCustomerData(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class AddTeamCall {
  Future<ApiCallResponse> call({
    String? staffName = '',
    String? staffContactNumber = '',
    String? staffAddress = '',
    int? isActive = 1,
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    final ffApiRequestBody = '''
{
  "Name": "${staffName}",
  "Address": "${staffAddress}",
  "MobileNo": "${staffContactNumber}",
  "IsActive": ${isActive}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Team',
      apiUrl: '${baseUrl}PostStaff',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTeamCall {
  Future<ApiCallResponse> call({
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Team',
      apiUrl: '${baseUrl}GetStaff',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic listTeamMembers(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class AddBrandCall {
  Future<ApiCallResponse> call({
    String? brandName = '',
    int? isVisible = 1,
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    final ffApiRequestBody = '''
{
  "Name": "${brandName}",
  "IsVisible": ${isVisible}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Brand',
      apiUrl: '${baseUrl}PostBrand',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBrandCall {
  Future<ApiCallResponse> call({
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get brand',
      apiUrl: '${baseUrl}GetBrands',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allBrandList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  int? productId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].Id''',
      ));
  String? productName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Name''',
      ));
}

class AddCategoryCall {
  Future<ApiCallResponse> call({
    String? categoryName = '',
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    final ffApiRequestBody = '''
{
  "Name": "${categoryName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Category',
      apiUrl: '${baseUrl}PostProductCategory',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoryCall {
  Future<ApiCallResponse> call({
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Category',
      apiUrl: '${baseUrl}GetProductCategories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allCategoriesList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class AddProductCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    String? itemCode = '',
    String? hSNCode = '',
    String? unit = '',
    double? price = 0.00,
    double? igst = 0.00,
    int? brandId,
    int? productTypeId,
    int? isAvailable,
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    final ffApiRequestBody = '''
{
  "Name": "${name}",
  "Description": "${description}",
  "ItemCode": "${itemCode}",
  "HSNCode": "${hSNCode}",
  "Unit": "${unit}",
  "Price": ${price},
  "IGST": ${igst},
  "BrandId": ${brandId},
  "ProductTypeId": ${productTypeId},
  "IsAvailable": ${isAvailable}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Product',
      apiUrl: '${baseUrl}PostProduct',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductCall {
  Future<ApiCallResponse> call({
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Product',
      apiUrl: '${baseUrl}GetProducts',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? allProductList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class AddSalesCall {
  Future<ApiCallResponse> call({
    dynamic salesJSONJson,
    String? authenticationToken = '',
    String? mobileNo = '',
  }) async {
    final baseUrl = HawkerAppAPIGroup.getBaseUrl(
      authenticationToken: authenticationToken,
      mobileNo: mobileNo,
    );

    final salesJSON = _serializeJson(salesJSONJson, true);
    final ffApiRequestBody = '''
${salesJSON}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Sales',
      apiUrl: '${baseUrl}PostDailySales',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authenticationToken}',
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'mobile_no': '${mobileNo}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Hawker App API Group Code

/// Start Smart Hawker APIs Group Code

class SmartHawkerAPIsGroup {
  static String getBaseUrl() => 'https://shprod.platinum-infotech.com';
  static Map<String, String> headers = {};
  static VendorRegistrationAPICall vendorRegistrationAPICall =
      VendorRegistrationAPICall();
  static LoginAPICall loginAPICall = LoginAPICall();
  static CustomerListAPICall customerListAPICall = CustomerListAPICall();
  static AddCustomerInfoAPICall addCustomerInfoAPICall =
      AddCustomerInfoAPICall();
  static AddProductInfoAPICall addProductInfoAPICall = AddProductInfoAPICall();
  static ProductsByVendorAPICall productsByVendorAPICall =
      ProductsByVendorAPICall();
  static AddStaffAPICall addStaffAPICall = AddStaffAPICall();
  static StaffListAPICall staffListAPICall = StaffListAPICall();
  static SalesAddAPICall salesAddAPICall = SalesAddAPICall();
  static GenerateInvoiceAPICall generateInvoiceAPICall =
      GenerateInvoiceAPICall();
  static VendorViewInvoiceAPICall vendorViewInvoiceAPICall =
      VendorViewInvoiceAPICall();
  static CustomerOrderListAPICall customerOrderListAPICall =
      CustomerOrderListAPICall();
  static ProductEditByVendorAPICall productEditByVendorAPICall =
      ProductEditByVendorAPICall();
  static EditCustomerAPICall editCustomerAPICall = EditCustomerAPICall();
  static EditStaffAPICall editStaffAPICall = EditStaffAPICall();
  static TotalActiveCustomersAPICall totalActiveCustomersAPICall =
      TotalActiveCustomersAPICall();
  static TotalSaleYesterdayAPICall totalSaleYesterdayAPICall =
      TotalSaleYesterdayAPICall();
  static EmployeeProductListByVendorAPICall employeeProductListByVendorAPICall =
      EmployeeProductListByVendorAPICall();
  static EmployeeSaleAPICall employeeSaleAPICall = EmployeeSaleAPICall();
  static HighestSellingProductAPICall highestSellingProductAPICall =
      HighestSellingProductAPICall();
  static ActiveProductsCountAPICall activeProductsCountAPICall =
      ActiveProductsCountAPICall();
  static ProductSmallSummaryAPICall productSmallSummaryAPICall =
      ProductSmallSummaryAPICall();
  static MonthlySummaryAPICall monthlySummaryAPICall = MonthlySummaryAPICall();
  static SalesUpdateByVendorAPICall salesUpdateByVendorAPICall =
      SalesUpdateByVendorAPICall();
  static SalesDeleteByVendorAPICall salesDeleteByVendorAPICall =
      SalesDeleteByVendorAPICall();
  static VendorProfileAPICall vendorProfileAPICall = VendorProfileAPICall();
  static VendorProfileUpdateAPICall vendorProfileUpdateAPICall =
      VendorProfileUpdateAPICall();
  static QrPaymentCustomerAPICall qrPaymentCustomerAPICall =
      QrPaymentCustomerAPICall();
  static ViewInvoiceDetailsAPICall viewInvoiceDetailsAPICall =
      ViewInvoiceDetailsAPICall();
  static MakePaymentAPIByVendorCall makePaymentAPIByVendorCall =
      MakePaymentAPIByVendorCall();
  static GetAdvancePymentAPICall getAdvancePymentAPICall =
      GetAdvancePymentAPICall();
  static AddAdvancePaymentCall addAdvancePaymentCall = AddAdvancePaymentCall();
  static UpdateAdvancePaymentCall updateAdvancePaymentCall =
      UpdateAdvancePaymentCall();
  static MonthlyDueAPICall monthlyDueAPICall = MonthlyDueAPICall();
  static AppVersionAPICall appVersionAPICall = AppVersionAPICall();
  static SubscriptionPlansAPICall subscriptionPlansAPICall =
      SubscriptionPlansAPICall();
  static GetVendorByIdAPICall getVendorByIdAPICall = GetVendorByIdAPICall();
  static CheckAppVersionCall checkAppVersionCall = CheckAppVersionCall();
  static VendorSubscriptionOrderCall vendorSubscriptionOrderCall =
      VendorSubscriptionOrderCall();
  static VendorConfirmSubsciptionOrderCall vendorConfirmSubsciptionOrderCall =
      VendorConfirmSubsciptionOrderCall();
  static SalesAddByVoiceCommandCall salesAddByVoiceCommandCall =
      SalesAddByVoiceCommandCall();
  static ExtractSpeechAPICall extractSpeechAPICall = ExtractSpeechAPICall();
}

class VendorRegistrationAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? mobile = '',
    String? address = '',
    String? businessName = '',
    String? gstNumber = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "mobile": "${escapeStringForJson(mobile)}",
  "address": "${escapeStringForJson(address)}",
  "business_name": "${escapeStringForJson(businessName)}",
  "gst_number": "${escapeStringForJson(gstNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Vendor Registration API',
      apiUrl: '${baseUrl}/register/vendor',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginAPICall {
  Future<ApiCallResponse> call({
    String? mobile = '',
    String? userType = '',
    String? fcmToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "mobile": "${escapeStringForJson(mobile)}",
  "userType": "${escapeStringForJson(userType)}",
  "fcmToken": "${escapeStringForJson(fcmToken)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login API',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CustomerListAPICall {
  Future<ApiCallResponse> call({
    int? vendorId,
    String? searchValue = '',
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Customer List API',
      apiUrl: '${baseUrl}/vendors/${vendorId}/customers?search=${searchValue}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddCustomerInfoAPICall {
  Future<ApiCallResponse> call({
    String? customerName = '',
    String? customerEmail = '',
    String? customerMobile = '',
    String? customerAddress = '',
    String? authToken = '',
    String? customerUniqueId = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(customerName)}",
  "email": "${escapeStringForJson(customerEmail)}",
  "mobile": "${escapeStringForJson(customerMobile)}",
  "address": "${escapeStringForJson(customerAddress)}",
  "customer_unique_id": "${escapeStringForJson(customerUniqueId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Customer Info API',
      apiUrl: '${baseUrl}/vendors/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddProductInfoAPICall {
  Future<ApiCallResponse> call({
    String? productName = '',
    int? productPricePerUnit,
    String? unit = '',
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(productName)}",
  "price_per_unit": ${productPricePerUnit},
  "unit": "${escapeStringForJson(unit)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Product Info API',
      apiUrl: '${baseUrl}/products',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductsByVendorAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Products By Vendor API',
      apiUrl: '${baseUrl}/productByVendor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddStaffAPICall {
  Future<ApiCallResponse> call({
    String? staffName = '',
    String? staffEmail = '',
    String? staffMobile = '',
    String? staffRole = '',
    String? staffAddress = '',
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(staffName)}",
  "email": "${escapeStringForJson(staffEmail)}",
  "mobile": "${escapeStringForJson(staffMobile)}",
  "role": "${escapeStringForJson(staffRole)}",
  "address": "${escapeStringForJson(staffAddress)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Staff API',
      apiUrl: '${baseUrl}/employees',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StaffListAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Staff List API',
      apiUrl: '${baseUrl}/vendors/employees',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesAddAPICall {
  Future<ApiCallResponse> call({
    int? customerId,
    int? productId,
    double? quantity,
    double? pricePerUnit,
    String? saleDate = '',
    double? totalAmount,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "product_id": ${productId},
  "quantity": ${quantity},
  "price_per_unit": ${pricePerUnit},
  "sale_date":"${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sales Add API',
      apiUrl: '${baseUrl}/sales',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateInvoiceAPICall {
  Future<ApiCallResponse> call({
    int? customerId,
    int? month,
    int? year,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "month": ${month},
  "year": ${year}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Invoice API',
      apiUrl: '${baseUrl}/generate-invoice',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorViewInvoiceAPICall {
  Future<ApiCallResponse> call({
    int? customerId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Vendor View Invoice API ',
      apiUrl: '${baseUrl}/view-invoice',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CustomerOrderListAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? vendorId,
    int? customerId,
    int? month,
    int? year,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId},
  "customerId": ${customerId},
  "month": ${month},
  "year": ${year}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Order List API',
      apiUrl: '${baseUrl}/sales/customer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductEditByVendorAPICall {
  Future<ApiCallResponse> call({
    String? name = '',
    double? pricePerUnit,
    String? unit = '',
    String? status = '',
    String? authToken = '',
    int? productId,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "price_per_unit": ${pricePerUnit},
  "unit": "${escapeStringForJson(unit)}",
  "status":"${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Product Edit By Vendor API',
      apiUrl: '${baseUrl}/products/${productId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditCustomerAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? customerId,
    String? name = '',
    String? email = '',
    String? mobile = '',
    String? address = '',
    String? status = '',
    String? customerUniqueId = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "mobile": "${escapeStringForJson(mobile)}",
  "address": "${escapeStringForJson(address)}",
  "status":"${escapeStringForJson(status)}",
  "customer_unique_id":"${escapeStringForJson(customerUniqueId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Customer API',
      apiUrl: '${baseUrl}/vendors/customers/${customerId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditStaffAPICall {
  Future<ApiCallResponse> call({
    String? staffName = '',
    String? staffEmail = '',
    String? staffMobile = '',
    String? staffRole = '',
    String? staffAddress = '',
    String? status = '',
    String? authToken = '',
    int? employeeId,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(staffName)}",
  "email": "${escapeStringForJson(staffEmail)}",
  "mobile": "${escapeStringForJson(staffMobile)}",
  "role": "${escapeStringForJson(staffRole)}",
  "address": "${escapeStringForJson(staffAddress)}",
  "status":"${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Staff API',
      apiUrl: '${baseUrl}/employees/${employeeId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TotalActiveCustomersAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Total Active Customers API',
      apiUrl: '${baseUrl}/customers/count',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TotalSaleYesterdayAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Total Sale Yesterday API',
      apiUrl: '${baseUrl}/sales/yesterday',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmployeeProductListByVendorAPICall {
  Future<ApiCallResponse> call({
    int? vendorId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Employee Product List By Vendor API',
      apiUrl: '${baseUrl}/employee/productByVendor/${vendorId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmployeeSaleAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? vendorId,
    int? customerId,
    int? productId,
    int? quantity,
    double? pricePerUnit,
    String? saleDate = '',
    double? totalAmount,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "vendor_id": ${vendorId},
  "customer_id": ${customerId},
  "product_id": ${productId},
  "quantity": ${quantity},
  "price_per_unit": ${pricePerUnit},
  "sale_date":"${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Employee Sale API',
      apiUrl: '${baseUrl}/employee/sales',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HighestSellingProductAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Highest Selling Product API',
      apiUrl: '${baseUrl}/sales/highest-product',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActiveProductsCountAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Active Products Count API',
      apiUrl: '${baseUrl}/active-products/count',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductSmallSummaryAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? vendorId,
    int? customerId,
    int? month,
    int? year,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId},
  "customerId": ${customerId},
  "month": ${month},
  "year": ${year}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Product Small Summary API',
      apiUrl: '${baseUrl}/sales/product-summary',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MonthlySummaryAPICall {
  Future<ApiCallResponse> call({
    int? vendorId,
    int? customerId,
    int? month,
    int? year,
    int? productId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId},
  "customerId": ${customerId},
  "month": ${month},
  "year": ${year},
  "productId":${productId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Monthly Summary API',
      apiUrl: '${baseUrl}/sales/customer-monthly',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesUpdateByVendorAPICall {
  Future<ApiCallResponse> call({
    double? quantity,
    double? pricePerUnit,
    String? saleDate = '',
    int? saleId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
    "quantity":${quantity} ,
    "price_per_unit": ${pricePerUnit},
    "sale_date":"${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sales Update By Vendor API',
      apiUrl: '${baseUrl}/sales/${saleId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesDeleteByVendorAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? saleId,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Sales Delete By Vendor API',
      apiUrl: '${baseUrl}/sales/${saleId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorProfileAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Vendor Profile API',
      apiUrl: '${baseUrl}/vendor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorProfileUpdateAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? name = '',
    String? email = '',
    String? mobile = '',
    String? address = '',
    String? businessName = '',
    String? gstNumber = '',
    String? businessImage = '',
    String? qrCodeImage = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "mobile": "${escapeStringForJson(mobile)}",
  "address": "${escapeStringForJson(address)}",
  "business_name": "${escapeStringForJson(businessName)}",
  "gst_number": "${escapeStringForJson(gstNumber)}",
  "business_image": "${escapeStringForJson(businessImage)}",
  "qr_code_image": "${escapeStringForJson(qrCodeImage)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Vendor Profile Update API',
      apiUrl: '${baseUrl}/vendor',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QrPaymentCustomerAPICall {
  Future<ApiCallResponse> call({
    int? vendorId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Qr Payment Customer API',
      apiUrl: '${baseUrl}/customer/qr',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ViewInvoiceDetailsAPICall {
  Future<ApiCallResponse> call({
    int? customerId,
    int? invoiceId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "invoice_id": ${invoiceId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'View Invoice Details API',
      apiUrl: '${baseUrl}/view-invoice-detail',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MakePaymentAPIByVendorCall {
  Future<ApiCallResponse> call({
    int? invoiceId,
    int? customerId,
    double? amount,
    String? paymentMode = '',
    String? notes = '',
    String? authToken = '',
    bool? advancePayment,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "invoice_id": ${invoiceId},
  "customer_id": ${customerId},
  "amount": ${amount},
  "payment_mode": "${escapeStringForJson(paymentMode)}",
  "notes": "${escapeStringForJson(notes)}",
  "advancePayment": ${advancePayment}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Make Payment API By Vendor',
      apiUrl: '${baseUrl}/api/make-payment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAdvancePymentAPICall {
  Future<ApiCallResponse> call({
    int? customerId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Advance Pyment API',
      apiUrl: '${baseUrl}/api/advance-payment/${customerId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddAdvancePaymentCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? customerId,
    int? advanceAmount,
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "advance_amount": ${advanceAmount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Advance Payment',
      apiUrl: '${baseUrl}/api/advance-payment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAdvancePaymentCall {
  Future<ApiCallResponse> call({
    int? customerId,
    int? advanceAmount,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "advance_amount": ${advanceAmount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Advance Payment',
      apiUrl: '${baseUrl}/api/update-advance-payment',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MonthlyDueAPICall {
  Future<ApiCallResponse> call({
    int? customerId,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Monthly Due API',
      apiUrl: '${baseUrl}/api/monthly-due',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AppVersionAPICall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'App Version API',
      apiUrl: '${baseUrl}/version-info',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubscriptionPlansAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Subscription Plans API',
      apiUrl: '${baseUrl}/api/subscription-plans',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetVendorByIdAPICall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Vendor By Id API',
      apiUrl: '${baseUrl}/vendor/getVendorById',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckAppVersionCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Check App Version',
      apiUrl: '${baseUrl}/version-info',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorSubscriptionOrderCall {
  Future<ApiCallResponse> call({
    int? planId,
    String? planName = '',
    int? amount,
    int? durationInDays,
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "plan_id": ${planId},
  "plan_name": "${escapeStringForJson(planName)}",
  "amount": ${amount},
  "duration_in_days": ${durationInDays}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Vendor Subscription Order',
      apiUrl: '${baseUrl}/api/vendor/create-subscription-order',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorConfirmSubsciptionOrderCall {
  Future<ApiCallResponse> call({
    String? razorpayOrderId = '',
    String? razorpayPaymentId = '',
    String? paymentResponse = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "razorpay_order_id": "${escapeStringForJson(razorpayOrderId)}",
  "razorpay_payment_id": "${escapeStringForJson(razorpayPaymentId)}",
  "payment_response": "${escapeStringForJson(paymentResponse)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Vendor Confirm Subsciption  Order',
      apiUrl: '${baseUrl}/api/vendor/confirm-subscription',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesAddByVoiceCommandCall {
  Future<ApiCallResponse> call({
    int? customerId,
    String? productName = '',
    double? quantity,
    String? unit = '',
    String? saleDate = '',
    String? authToken = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "product_name": "${escapeStringForJson(productName)}",
  "quantity": ${quantity},
  "unit": "${escapeStringForJson(unit)}",
  "sale_date": "${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sales add by voice command',
      apiUrl: '${baseUrl}/sales/by-voiceCommand',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ExtractSpeechAPICall {
  Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    final baseUrl = SmartHawkerAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "input": "${escapeStringForJson(input)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Extract speech API',
      apiUrl: '${baseUrl}/api/extract-speech',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Smart Hawker APIs Group Code

class LoginCall {
  static Future<ApiCallResponse> call({
    String? mobile = '',
    String? userType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mobile": "${mobile}",
  "userType": "${userType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VendorRegistrationCall {
  static Future<ApiCallResponse> call({
    String? businessName = '',
    String? contactNo = '',
    String? vendorName = '',
    String? email = '',
    String? address = '',
    String? gstNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "business_name": "${businessName}",
  "contact_no": "${contactNo}",
  "vendor_name": "${vendorName}",
  "email": "${email}",
  "address": "${address}",
  "gst_number": "${gstNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Vendor Registration',
      apiUrl: 'https://vyapar.techfolks.in/API/HawkerApp/PostProfile',
      callType: ApiCallType.POST,
      headers: {
        'client_id': 'b73c03y4q8v5gr16b540bqbgzsohfd9x',
        'client_secret': 'd8ipyj8tmnbxsm592zpyelji5nw31ujc',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CustomerListCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? vendorId,
    String? searchValue = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Customer List',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/vendors/${vendorId}/customers?search=${searchValue}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? customerList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AddCustomerInfoCall {
  static Future<ApiCallResponse> call({
    String? customerName = '',
    String? customerEmail = '',
    String? customerMobile = '',
    String? customerAddress = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(customerName)}",
  "email": "${escapeStringForJson(customerEmail)}",
  "mobile": "${escapeStringForJson(customerMobile)}",
  "address": "${escapeStringForJson(customerAddress)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Customer Info',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/vendors/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddProductInfoCall {
  static Future<ApiCallResponse> call({
    String? productName = '',
    int? productPricePerUnit,
    String? productUnit = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(productName)}",
  "price_per_unit": ${productPricePerUnit},
  "unit": "${escapeStringForJson(productUnit)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Product Info',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/products',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductListCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Product List',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/productByVendor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? productList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class AddStaffCall {
  static Future<ApiCallResponse> call({
    String? staffName = '',
    String? staffEmail = '',
    String? staffMobile = '',
    String? staffRole = '',
    String? staffAddress = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(staffName)}",
  "email": "${escapeStringForJson(staffEmail)}",
  "mobile": "${escapeStringForJson(staffMobile)}",
  "role": "${escapeStringForJson(staffRole)}",
  "address": "${escapeStringForJson(staffAddress)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Staff',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/employees',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StaffListCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Staff List',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/vendors/employees',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? staffList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ProductsByVendorCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Products By Vendor',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/productByVendor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesAddCall {
  static Future<ApiCallResponse> call({
    int? customerId,
    int? productId,
    double? quantity,
    double? pricePerUnit,
    double? totalAmount,
    String? authToken = '',
    String? saleDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "product_id": ${productId},
  "quantity": ${quantity},
  "price_per_unit": ${pricePerUnit},
  "sale_date":"${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sales Add',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CustomerOrderListCall {
  static Future<ApiCallResponse> call({
    int? customerId,
    String? authToken = '',
    int? vendorId,
    int? month,
    int? year,
  }) async {
    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId},
  "customerId": ${customerId},
  "month": ${month},
  "year": ${year}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'customer order list',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales/customer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductEditByVendorCall {
  static Future<ApiCallResponse> call({
    String? productName = '',
    double? pricePerUnit,
    String? unit = '',
    String? authToken = '',
    int? productId,
    String? status = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(productName)}",
  "price_per_unit": "${pricePerUnit}",
  "unit": "${escapeStringForJson(unit)}",
  "status":"${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Product Edit By Vendor',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/products/${productId}',
      callType: ApiCallType.PUT,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditCustomerCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? customerId,
    String? name = '',
    String? email = '',
    String? mobile = '',
    String? address = '',
    String? status = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "mobile": "${escapeStringForJson(mobile)}",
  "address": "${escapeStringForJson(address)}",
  "status":"${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Customer',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/vendors/customers/${customerId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditStaffCall {
  static Future<ApiCallResponse> call({
    String? staffName = '',
    String? staffEmail = '',
    String? staffMobile = '',
    String? staffRole = '',
    String? staffAddress = '',
    int? employeeId,
    String? authToken = '',
    String? status = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(staffName)}",
  "email": "${escapeStringForJson(staffEmail)}",
  "mobile": "${escapeStringForJson(staffMobile)}",
  "role": "${escapeStringForJson(staffRole)}",
  "address": "${escapeStringForJson(staffAddress)}",
  "status":"${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Staff',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/employees/${employeeId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TotalActiveCustomersCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Total Active Customers',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/customers/count',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TotalSaleYesterdayCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Total Sale Yesterday',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales/yesterday',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmployeeProductListByVendorCall {
  static Future<ApiCallResponse> call({
    int? vendorId,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Employee Product List By Vendor',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/employee/productByVendor/${vendorId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EmployeeSaleCall {
  static Future<ApiCallResponse> call({
    int? vendorId,
    int? customerId,
    int? productId,
    int? quantity,
    double? pricePerUnit,
    String? authToken = '',
    String? saleDate = '',
    double? totalAmount,
  }) async {
    final ffApiRequestBody = '''
{
  "vendor_id": ${vendorId},
  "customer_id": ${customerId},
  "product_id": ${productId},
  "quantity": ${quantity},
  "price_per_unit": ${pricePerUnit},
  "sale_date":"${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Employee sale',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/employee/sales',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HighestSellingProductCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Highest Selling Product',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales/highest-product',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActiveProductsCountCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Active Products count',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/active-products/count',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductSmallSummaryCall {
  static Future<ApiCallResponse> call({
    int? vendorId,
    int? customerId,
    int? month,
    int? year,
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId},
  "customerId": ${customerId},
  "month": ${month},
  "year": ${year}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Product Small Summary',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales/product-summary',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MonthlySummaryCall {
  static Future<ApiCallResponse> call({
    int? vendorId,
    int? customerId,
    int? month,
    int? year,
    int? productId,
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId},
  "customerId": ${customerId},
  "month": ${month},
  "year": ${year},
  "productId":${productId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Monthly Summary',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales/customer-monthly',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesUpdateByVendorCall {
  static Future<ApiCallResponse> call({
    double? quantity,
    int? saleId,
    String? authToken = '',
    String? saleDate = '',
    double? pricePerUnit,
  }) async {
    final ffApiRequestBody = '''
{
    "quantity":${quantity} ,
    "price_per_unit": ${pricePerUnit},
    "sale_date":"${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sales Update By Vendor',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales/${saleId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesDeleteByVendorCall {
  static Future<ApiCallResponse> call({
    int? saleId,
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Sales Delete By Vendor',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/sales/${saleId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendOTPCall {
  static Future<ApiCallResponse> call({
    String? mobileNumber = '',
    String? authToken =
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJDLUM1RTRDRTg5RjkzNzQyNyIsImlhdCI6MTc0MTI0MDE2NSwiZXhwIjoxODk4OTIwMTY1fQ.qcHZTiUGd1c-r6DKW8tJ-pT3lMdgLcnD8Ul-n9AABTsFDVGPbICbGA_Bs9tvuPV8bSuvbLR-i7SHpWaQAkvrAQ',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send OTP',
      apiUrl:
          'https://cpaas.messagecentral.com/verification/v3/send?countryCode=91&customerId=C-C5E4CE89F937427&flowType=SMS&mobileNumber=${mobileNumber}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'authToken': '${authToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ValidateOTPCall {
  static Future<ApiCallResponse> call({
    String? verificationId = '',
    String? mobileNumber = '',
    String? code = '',
    String? authToken =
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJDLUM1RTRDRTg5RjkzNzQyNyIsImlhdCI6MTc0MTI0MDE2NSwiZXhwIjoxODk4OTIwMTY1fQ.qcHZTiUGd1c-r6DKW8tJ-pT3lMdgLcnD8Ul-n9AABTsFDVGPbICbGA_Bs9tvuPV8bSuvbLR-i7SHpWaQAkvrAQ',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Validate OTP',
      apiUrl:
          'https://cpaas.messagecentral.com/verification/v3/validateOtp?countryCode=91&mobileNumber=${mobileNumber}&verificationId=${verificationId}&customerId=C-C5E4CE89F937427&code=${code}',
      callType: ApiCallType.GET,
      headers: {
        'authToken': '${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProfileAPICall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Profile API',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/vendor',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProfileUpdateAPICall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? mobile = '',
    String? address = '',
    String? businessName = '',
    String? gstNumber = '',
    String? businessImage = '',
    String? qrCodeImage = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "email": "${escapeStringForJson(email)}",
  "mobile": "${escapeStringForJson(mobile)}",
  "address": "${escapeStringForJson(address)}",
  "business_name": "${escapeStringForJson(businessName)}",
  "gst_number": "${escapeStringForJson(gstNumber)}",
  "business_image": "${escapeStringForJson(businessImage)}",
  "qr_code_image": "${escapeStringForJson(qrCodeImage)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Profile Update API',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/vendor',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class QrPaymentCustomerCall {
  static Future<ApiCallResponse> call({
    int? vendorId,
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "vendorId": ${vendorId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Qr Payment Customer',
      apiUrl:
          'http://ec2-13-232-141-62.ap-south-1.compute.amazonaws.com:3000/customer/qr',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendSMSCall {
  static Future<ApiCallResponse> call({
    String? mobileNumber = '',
    String? authToken =
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJDLUM1RTRDRTg5RjkzNzQyNyIsImlhdCI6MTc0MTI0MDE2NSwiZXhwIjoxODk4OTIwMTY1fQ.qcHZTiUGd1c-r6DKW8tJ-pT3lMdgLcnD8Ul-n9AABTsFDVGPbICbGA_Bs9tvuPV8bSuvbLR-i7SHpWaQAkvrAQ',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send SMS',
      apiUrl:
          'https://cpaas.messagecentral.com/verification/v3/send?countryCode=91&customerId=C-C5E4CE89F937427&senderId=UTOMOB&type=SMS&flowType=SMS&mobileNumber=${mobileNumber}&message=Welcome to Message Central. We are delighted to have you here!',
      callType: ApiCallType.POST,
      headers: {
        'authToken': '${authToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SalesAddByVoicceCommandCall {
  static Future<ApiCallResponse> call({
    int? customerId,
    String? productName = '',
    double? quantity,
    String? unit = '',
    String? saleDate = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "customer_id": ${customerId},
  "product_name": "${escapeStringForJson(productName)}",
  "quantity": ${quantity},
  "unit": "${escapeStringForJson(unit)}",
  "sale_date": "${escapeStringForJson(saleDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sales add by voicce command',
      apiUrl:
          'http://shcanary.platinum-infotech.com:3000/sales/by-voiceCommand',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
