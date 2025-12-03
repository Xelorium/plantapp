import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success({
    required List<CategoryModel> categories,
    required List<QuestionModel> questions,
  }) = _Success;
  const factory HomeState.error(String message) = _Error;
}
