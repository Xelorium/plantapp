import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/features/onboarding/domain/usecases/set_onboarding_complete_usecase.dart';

part 'onboarding_state.dart';

part 'onboarding_cubit.freezed.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._setOnboardingCompleteUseCase) : super(const OnboardingState.initial());
  final SetOnboardingCompleteUseCase _setOnboardingCompleteUseCase;

  Future<void> setOnboardingComplete() async {
    final result = await _setOnboardingCompleteUseCase();

    result.fold(
      (failure) => emit(OnboardingState.error(failure.message)),
      (_) => emit(const OnboardingState.completed()),
    );
  }
}
