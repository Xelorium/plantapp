import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/constants/app_constants.dart';
import 'package:plantapp/core/error/exceptions.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/core/network/api_service.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return Right(response.data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('${AppMessages.unexpectedError}: $e'));
    }
  }

  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions() async {
    try {
      final response = await _apiService.getQuestions();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('${AppMessages.unexpectedError}: $e'));
    }
  }
}
