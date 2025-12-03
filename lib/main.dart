import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp/app.dart';
import 'package:plantapp/core/init/dependency_injection.dart';
import 'package:plantapp/core/logging/bloc_observer.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
      Bloc.observer = GlobalBlocObserver();
      runApp(const PlantApp());
    },
    (error, stackTrace) {
      // TODO: Handle uncaught errors
      debugPrint(error.toString());
    },
  );
}
