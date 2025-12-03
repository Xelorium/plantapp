import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/features/onboarding/domain/repositories/onboarding_repository.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {

  OnboardingCubit(this._repository) : super(const OnboardingState.initial());
  final OnboardingRepository _repository;

  void setOnboardingComplete() {
    _repository.setOnboardingComplete();
    emit(const OnboardingState.completed());
  }

// Sayfa değişimlerini takip etmek isterseniz buraya metot ekleyebilirsiniz
// void pageChanged(int index) { ... }
}