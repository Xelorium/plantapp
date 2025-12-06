import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/domain/usecases/get_categories_usecase.dart';
import '../../../../../mocks/mock_dependencies.dart';

void main() {
  late GetCategoriesUseCase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetCategoriesUseCase(mockRepository);
  });

  group('GetCategoriesUseCase', () {
    const tCategoryList = [
      CategoryModel(
        id: 1,
        name: 'test_category',
        title: 'Test Category',
        rank: 1,
        image: null,
      ),
    ];

    test('should get categories from the repository', () async {
      when(() => mockRepository.getCategories())
          .thenAnswer((_) async => const Right(tCategoryList));

      final result = await useCase();

      expect(result, const Right(tCategoryList));
      verify(() => mockRepository.getCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return failure when repository call fails', () async {
      final tFailure = ServerFailure('Server error');
      when(() => mockRepository.getCategories())
          .thenAnswer((_) async => Left(tFailure));

      final result = await useCase();

      expect(result, Left(tFailure));
      verify(() => mockRepository.getCategories()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}