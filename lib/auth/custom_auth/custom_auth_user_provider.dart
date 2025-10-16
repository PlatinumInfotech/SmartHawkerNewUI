import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class SmartHawkerLatestAuthUser {
  SmartHawkerLatestAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SmartHawkerLatestAuthUser> smartHawkerLatestAuthUserSubject =
    BehaviorSubject.seeded(SmartHawkerLatestAuthUser(loggedIn: false));
Stream<SmartHawkerLatestAuthUser> smartHawkerLatestAuthUserStream() =>
    smartHawkerLatestAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
