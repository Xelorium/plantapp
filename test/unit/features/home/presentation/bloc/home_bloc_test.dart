import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plantapp/core/error/failures.dart';
import 'package:plantapp/features/home/data/models/category_model.dart';
import 'package:plantapp/features/home/data/models/question_model.dart';
import 'package:plantapp/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp/features/home/presentation/bloc/home_state.dart';
import '../../../../../mocks/mock_dependencies.dart';

void main() {
  late HomeBloc homeBloc;
  late MockGetCategoriesUseCase mockGetCategoriesUseCase;
  late MockGetQuestionsUseCase mockGetQuestionsUseCase;

  const tCategories = [
    CategoryModel(
      id: 1,
      name: 'test_category',
      title: 'Test Category',
      rank: 1,
      image: null,
    ),
  ];

  const tQuestions = [
    QuestionModel(
      id: 1,
      title: 'Test Question',
      subtitle: 'Test subtitle',
      imageUri: 'https://example.com/question.jpg',
      uri: 'test-question',
      order: 1,
    ),
  ];

  setUp(() {
    mockGetCategoriesUseCase = MockGetCategoriesUseCase();
    mockGetQuestionsUseCase = MockGetQuestionsUseCase();
    homeBloc = HomeBloc(mockGetCategoriesUseCase, mockGetQuestionsUseCase);
  });

  tearDown(() {
    homeBloc.close();
  });

  group('HomeBloc', () {
    test('initial state should be HomeState with initial status', () {
      expect(
        homeBloc.state,
        const HomeState(
          status: HomeStatus.initial,
          categories: [],
          questions: [],
          errorMessage: null,
        ),
      );
    });

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when HomeStarted is added and both use cases succeed',
      build: () {
        when(() => mockGetCategoriesUseCase())
            .thenAnswer((_) async => const Right(tCategories));
        when(() => mockGetQuestionsUseCase())
            .thenAnswer((_) async => const Right(tQuestions));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(
          status: HomeStatus.success,
          categories: tCategories,
          questions: tQuestions,
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verify(() => mockGetQuestionsUseCase()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when only categories succeed',
      build: () {
        when(() => mockGetCategoriesUseCase())
            .thenAnswer((_) async => const Right(tCategories));
        when(() => mockGetQuestionsUseCase())
            .thenAnswer((_) async => Left(ServerFailure('Questions error')));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(
          status: HomeStatus.success,
          categories: tCategories,
          questions: [],
          errorMessage: 'Questions error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verify(() => mockGetQuestionsUseCase()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when only questions succeed',
      build: () {
        when(() => mockGetCategoriesUseCase())
            .thenAnswer((_) async => Left(ServerFailure('Categories error')));
        when(() => mockGetQuestionsUseCase())
            .thenAnswer((_) async => const Right(tQuestions));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(
          status: HomeStatus.success,
          categories: [],
          questions: tQuestions,
          errorMessage: 'Categories error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verify(() => mockGetQuestionsUseCase()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, failure] when both use cases fail',
      build: () {
        when(() => mockGetCategoriesUseCase())
            .thenAnswer((_) async => Left(ServerFailure('Categories error')));
        when(() => mockGetQuestionsUseCase())
            .thenAnswer((_) async => Left(ServerFailure('Questions error')));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(
          status: HomeStatus.failure,
          categories: [],
          questions: [],
          errorMessage: 'Categories error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verify(() => mockGetQuestionsUseCase()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, failure] when categories fail and questions return empty list',
      build: () {
        when(() => mockGetCategoriesUseCase())
            .thenAnswer((_) async => Left(ServerFailure('Categories error')));
        when(() => mockGetQuestionsUseCase())
            .thenAnswer((_) async => const Right([]));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(
          status: HomeStatus.failure,
          categories: [],
          questions: [],
          errorMessage: 'Categories error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetCategoriesUseCase()).called(1);
        verify(() => mockGetQuestionsUseCase()).called(1);
      },
    );
  });
}