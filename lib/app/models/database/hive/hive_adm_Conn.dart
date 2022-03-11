import 'package:flutter/material.dart';
import 'package:todo_medium/app/models/database/hive/hive_connection_factory.dart';

class HiveAdmConn extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final conn = HiveConnectionFactory();
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        conn.closeConnection();
        break;
    }

    super.didChangeAppLifecycleState(state);
  }
}
