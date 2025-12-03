import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/features/home/domain/repositories/home_repository.dart';

@injectable
class GetQuestionsUseCase {
  GetQuestionsUseCase(this._repository);

  final HomeRepository _repository;

  Future<Either<Failure, List<QuestionModel>>> call() async {
    return await _repository.getQuestions();
  }
}
