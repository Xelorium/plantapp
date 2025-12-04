import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:plantapp/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:plantapp/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getCategoriesUseCase, this._getQuestionsUseCase) : super(const HomeState()) {

    on<HomeEvent>((event, emit) async {
      await event.map(
        started: (_) async {
          emit(state.copyWith(status: HomeStatus.loading));

          final results = await Future.wait([
            _getCategoriesUseCase(),
            _getQuestionsUseCase(),
          ], eagerError: true);

          final categoriesResult = results[0] as Either<Failure, List<CategoryModel>>;
          final questionsResult = results[1] as Either<Failure, List<QuestionModel>>;

          List<CategoryModel> currentCategories = state.categories;
          List<QuestionModel> currentQuestions = state.questions;
          String? errorMsg;

          categoriesResult.fold(
            (failure) => errorMsg = failure.message,
            (data) => currentCategories = data,
          );

          questionsResult.fold(
            (failure) => errorMsg = failure.message,
            (data) => currentQuestions = data,
          );

          if (currentCategories.isEmpty && currentQuestions.isEmpty && errorMsg != null) {
            emit(
              state.copyWith(
                status: HomeStatus.failure,
                errorMessage: errorMsg,
              ),
            );
          } else {
            emit(
              state.copyWith(
                status: HomeStatus.success,
                categories: currentCategories,
                questions: currentQuestions,
                errorMessage: errorMsg,
              ),
            );
          }
        },
      );
    });
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetQuestionsUseCase _getQuestionsUseCase;
}
