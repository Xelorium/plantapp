import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/init/dependency_injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
void configureDependencies() => getIt.init();
