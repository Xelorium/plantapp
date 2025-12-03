import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/error/exceptions.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/features/home/domain/repositories/home_repository.dart';
import 'package:plantapp/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        started: (_) async {
          emit(const HomeState.loading());
          try {
            final results = await Future.wait([
              _repository.getCategories(),
              _repository.getQuestions(),
            ], eagerError: true);

            emit(
              HomeState.success(
                categories: results[0] as List<CategoryModel>,
                questions: results[1] as List<QuestionModel>,
              ),
            );
          } on ServerException catch (e) {
            emit(HomeState.error(e.message));
          } on NetworkException catch (e) {
            emit(HomeState.error(e.message));
          } catch (e) {
            emit(const HomeState.error('Beklenmedik bir hata oluştu.'));
          }
        },
      );
    });
  }

  final HomeRepository _repository;
}
