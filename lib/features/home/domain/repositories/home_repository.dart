import 'package:fpdart/fpdart.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<QuestionModel>>> getQuestions();
}
