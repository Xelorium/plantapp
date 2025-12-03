import 'package:injectable/injectable.dart';
import 'package:plantapp/core/network/api_service.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {

  HomeRepositoryImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _apiService.getCategories();
    return response.data;
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    return await _apiService.getQuestions();
  }
}
