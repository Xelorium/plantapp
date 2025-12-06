import 'package:mocktail/mocktail.dart';
import 'package:plantapp/core/network/api_service.dart';
import 'package:plantapp/features/home/domain/repositories/home_repository.dart';
import 'package:plantapp/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:plantapp/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:plantapp/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:plantapp/features/onboarding/domain/usecases/is_onboarding_complete_usecase.dart';
import 'package:plantapp/features/onboarding/domain/usecases/set_onboarding_complete_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockApiService extends Mock implements ApiService {}

class MockHomeRepository extends Mock implements HomeRepository {}

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

class MockGetQuestionsUseCase extends Mock implements GetQuestionsUseCase {}

class MockIsOnboardingCompleteUseCase extends Mock implements IsOnboardingCompleteUseCase {}

class MockSetOnboardingCompleteUseCase extends Mock implements SetOnboardingCompleteUseCase {}

class MockSharedPreferences extends Mock implements SharedPreferences {}