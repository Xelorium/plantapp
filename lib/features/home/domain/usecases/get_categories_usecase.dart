import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/domain/repositories/home_repository.dart';

@injectable
class GetCategoriesUseCase {
  GetCategoriesUseCase(this._repository);

  final HomeRepository _repository;

  Future<Either<Failure, List<CategoryModel>>> call() async {
    return await _repository.getCategories();
  }
}
