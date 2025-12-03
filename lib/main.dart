import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plantapp/app.dart';
import 'package:plantapp/core/init/dependency_injection.dart'; // DI dosyanızın yolu

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies(); // DI Başlatma
      runApp(const PlantApp());
    },
    (error, stackTrace) {
      // TODO: Handle uncaught errors
      debugPrint(error.toString());
    },
  );
}
