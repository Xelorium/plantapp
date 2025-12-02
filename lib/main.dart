import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plantapp/app.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const PlantApp());
    },
    (error, stackTrace) {
      //TODO: Handle uncaught errors here
    },
  );
}
