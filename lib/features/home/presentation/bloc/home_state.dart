import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';

part 'home_state.freezed.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<QuestionModel> questions,
    String? errorMessage,
  }) = _HomeState;
}
