import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';


import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  SmartHawkerLatestAuthUser? initialUser;
  SmartHawkerLatestAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SmartHawkerLatestAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(
            loginUserValue: params.getParam(
              'loginUserValue',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PhoneVerificationWidget.routeName,
          path: PhoneVerificationWidget.routePath,
          builder: (context, params) => PhoneVerificationWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: GetCustomerWidget.routeName,
          path: GetCustomerWidget.routePath,
          builder: (context, params) => GetCustomerWidget(
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
            name: AddCustomerWidget.routeName,
            path: AddCustomerWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddCustomerWidget(),
                )),
        FFRoute(
            name: AddStaffWidget.routeName,
            path: AddStaffWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddStaffWidget(),
                )),
        FFRoute(
          name: GetStaffWidget.routeName,
          path: GetStaffWidget.routePath,
          builder: (context, params) => GetStaffWidget(),
        ),
        FFRoute(
            name: AddProductWidget.routeName,
            path: AddProductWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AddProductWidget(),
                )),
        FFRoute(
          name: GetProductWidget.routeName,
          path: GetProductWidget.routePath,
          builder: (context, params) => GetProductWidget(),
        ),
        FFRoute(
          name: SalesWidget.routeName,
          path: SalesWidget.routePath,
          builder: (context, params) => SalesWidget(
            customerId: params.getParam(
              'customerId',
              ParamType.int,
            ),
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
            name: ProductSaleWidget.routeName,
            path: ProductSaleWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ProductSaleWidget(
                    productname: params.getParam(
                      'productname',
                      ParamType.String,
                    ),
                    productpriceperunit: params.getParam(
                      'productpriceperunit',
                      ParamType.double,
                    ),
                    customerId: params.getParam(
                      'customerId',
                      ParamType.int,
                    ),
                    productId: params.getParam(
                      'productId',
                      ParamType.int,
                    ),
                    productunit: params.getParam(
                      'productunit',
                      ParamType.String,
                    ),
                    vendorId: params.getParam(
                      'vendorId',
                      ParamType.int,
                    ),
                  ),
                )),
        FFRoute(
          name: CustomerHomePageWidget.routeName,
          path: CustomerHomePageWidget.routePath,
          builder: (context, params) => CustomerHomePageWidget(
            connectedVendors: params.getParam(
              'connectedVendors',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: EPageWidget.routeName,
          path: EPageWidget.routePath,
          builder: (context, params) => EPageWidget(
            connectedVendors: params.getParam(
              'connectedVendors',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
            name: EditProductWidget.routeName,
            path: EditProductWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EditProductWidget(
                    productName: params.getParam(
                      'productName',
                      ParamType.String,
                    ),
                    pricePerUnit: params.getParam(
                      'pricePerUnit',
                      ParamType.double,
                    ),
                    unit: params.getParam(
                      'unit',
                      ParamType.String,
                    ),
                    productId: params.getParam(
                      'productId',
                      ParamType.int,
                    ),
                  ),
                )),
        FFRoute(
          name: EGetCustomerWidget.routeName,
          path: EGetCustomerWidget.routePath,
          builder: (context, params) => EGetCustomerWidget(
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
            name: EditCustomerWidget.routeName,
            path: EditCustomerWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EditCustomerWidget(
                    customerId: params.getParam(
                      'customerId',
                      ParamType.int,
                    ),
                    name: params.getParam(
                      'name',
                      ParamType.String,
                    ),
                    email: params.getParam(
                      'email',
                      ParamType.String,
                    ),
                    mobile: params.getParam(
                      'mobile',
                      ParamType.String,
                    ),
                    address: params.getParam(
                      'address',
                      ParamType.String,
                    ),
                    customerUniqueId: params.getParam(
                      'customerUniqueId',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
            name: EditStaffWidget.routeName,
            path: EditStaffWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: EditStaffWidget(
                    staffId: params.getParam(
                      'staffId',
                      ParamType.int,
                    ),
                    staffName: params.getParam(
                      'staffName',
                      ParamType.String,
                    ),
                    staffEmail: params.getParam(
                      'staffEmail',
                      ParamType.String,
                    ),
                    staffMobile: params.getParam(
                      'staffMobile',
                      ParamType.String,
                    ),
                    staffRole: params.getParam(
                      'staffRole',
                      ParamType.String,
                    ),
                    staffAddress: params.getParam(
                      'staffAddress',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: ESalesPageWidget.routeName,
          path: ESalesPageWidget.routePath,
          builder: (context, params) => ESalesPageWidget(
            customerId: params.getParam(
              'customerId',
              ParamType.int,
            ),
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EProductSalePageWidget.routeName,
          path: EProductSalePageWidget.routePath,
          builder: (context, params) => EProductSalePageWidget(
            productname: params.getParam(
              'productname',
              ParamType.String,
            ),
            productpriceperunit: params.getParam(
              'productpriceperunit',
              ParamType.double,
            ),
            customerId: params.getParam(
              'customerId',
              ParamType.int,
            ),
            productId: params.getParam(
              'productId',
              ParamType.int,
            ),
            productunit: params.getParam(
              'productunit',
              ParamType.String,
            ),
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: CustMonthlyPurchaseReportByVendorWidget.routeName,
          path: CustMonthlyPurchaseReportByVendorWidget.routePath,
          builder: (context, params) => CustMonthlyPurchaseReportByVendorWidget(
            customerId: params.getParam(
              'customerId',
              ParamType.int,
            ),
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
            name: MonthlySalesReport2Widget.routeName,
            path: MonthlySalesReport2Widget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: MonthlySalesReport2Widget(
                    customerId: params.getParam(
                      'customerId',
                      ParamType.int,
                    ),
                    vendorId: params.getParam(
                      'vendorId',
                      ParamType.int,
                    ),
                  ),
                )),
        FFRoute(
            name: VProductSaleEditWidget.routeName,
            path: VProductSaleEditWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: VProductSaleEditWidget(
                    productname: params.getParam(
                      'productname',
                      ParamType.String,
                    ),
                    productpriceperunit: params.getParam(
                      'productpriceperunit',
                      ParamType.double,
                    ),
                    productId: params.getParam(
                      'productId',
                      ParamType.int,
                    ),
                    productunit: params.getParam(
                      'productunit',
                      ParamType.String,
                    ),
                    saleId: params.getParam(
                      'saleId',
                      ParamType.int,
                    ),
                    quantity: params.getParam(
                      'quantity',
                      ParamType.String,
                    ),
                    customerId: params.getParam(
                      'customerId',
                      ParamType.int,
                    ),
                    vendorId: params.getParam(
                      'vendorId',
                      ParamType.int,
                    ),
                    date: params.getParam(
                      'date',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: MonthlySalesReportForCustomerWidget.routeName,
          path: MonthlySalesReportForCustomerWidget.routePath,
          builder: (context, params) => MonthlySalesReportForCustomerWidget(
            customerId: params.getParam(
              'customerId',
              ParamType.int,
            ),
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
            vendorMobileNumber: params.getParam(
              'vendorMobileNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MonthlySalesReportForEmployeeWidget.routeName,
          path: MonthlySalesReportForEmployeeWidget.routePath,
          builder: (context, params) => MonthlySalesReportForEmployeeWidget(
            customerId: params.getParam(
              'customerId',
              ParamType.int,
            ),
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EProductSaleEditWidget.routeName,
          path: EProductSaleEditWidget.routePath,
          builder: (context, params) => EProductSaleEditWidget(
            productname: params.getParam(
              'productname',
              ParamType.String,
            ),
            productpriceperunit: params.getParam(
              'productpriceperunit',
              ParamType.double,
            ),
            productId: params.getParam(
              'productId',
              ParamType.int,
            ),
            productunit: params.getParam(
              'productunit',
              ParamType.String,
            ),
            saleId: params.getParam(
              'saleId',
              ParamType.int,
            ),
            quantity: params.getParam(
              'quantity',
              ParamType.String,
            ),
            customerId: params.getParam(
              'customerId',
              ParamType.int,
            ),
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
            date: params.getParam(
              'date',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MyProfileWidget.routeName,
          path: MyProfileWidget.routePath,
          builder: (context, params) => MyProfileWidget(),
        ),
        FFRoute(
          name: PaymentQRWidget.routeName,
          path: PaymentQRWidget.routePath,
          builder: (context, params) => PaymentQRWidget(
            vendorId: params.getParam(
              'vendorId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: InvoicePageWidget.routeName,
          path: InvoicePageWidget.routePath,
          builder: (context, params) => InvoicePageWidget(),
        ),
        FFRoute(
            name: InvoiceWidget.routeName,
            path: InvoiceWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: InvoiceWidget(
                    customerId: params.getParam(
                      'customerId',
                      ParamType.int,
                    ),
                    advanceAmount: params.getParam(
                      'advanceAmount',
                      ParamType.double,
                    ),
                  ),
                )),
        FFRoute(
          name: AdvanceWidget.routeName,
          path: AdvanceWidget.routePath,
          builder: (context, params) => AdvanceWidget(),
        ),
        FFRoute(
          name: SubscriptionPageWidget.routeName,
          path: SubscriptionPageWidget.routePath,
          builder: (context, params) => SubscriptionPageWidget(),
        ),
        FFRoute(
          name: HomeScreenWidget.routeName,
          path: HomeScreenWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomeScreen')
              : HomeScreenWidget(),
        ),
        FFRoute(
            name: CustomersWidget.routeName,
            path: CustomersWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: CustomersWidget(
                    vendorId: params.getParam(
                      'vendorId',
                      ParamType.int,
                    ),
                  ),
                )),
        FFRoute(
            name: ProductsWidget.routeName,
            path: ProductsWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Products')
                : NavBarPage(
                    initialPage: 'Products',
                    page: ProductsWidget(),
                  )),
        FFRoute(
            name: StaffWidget.routeName,
            path: StaffWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Staff')
                : NavBarPage(
                    initialPage: 'Staff',
                    page: StaffWidget(),
                  )),
        FFRoute(
          name: AppDrawerWidget.routeName,
          path: AppDrawerWidget.routePath,
          builder: (context, params) => AppDrawerWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/43sR8TtZxTss_1242_2688.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
