import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plantapp/app.dart';
import 'package:plantapp/core/init/dependency_injection.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
      runApp(const PlantApp());
    },
    (error, stackTrace) {
      // TODO: Handle uncaught errors
      debugPrint(error.toString());
    },
  );
}
