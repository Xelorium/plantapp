import 'package:flutter_test/flutter_test.dart';
import 'package:plantapp/core/error/failures.dart';

void main() {
  group('Failure', () {
    test('should create ServerFailure with correct message', () {
      const message = 'Server error occurred';
      final failure = ServerFailure(message);

      expect(failure.message, equals(message));
      expect(failure, isA<Failure>());
    });

    test('should create CacheFailure with correct message', () {
      const message = 'Cache error occurred';
      final failure = CacheFailure(message);

      expect(failure.message, equals(message));
      expect(failure, isA<Failure>());
    });

    test('should create NetworkFailure with correct message', () {
      const message = 'Network error occurred';
      final failure = NetworkFailure(message);

      expect(failure.message, equals(message));
      expect(failure, isA<Failure>());
    });

    test('failures should have correct message properties', () {
      final failure1 = ServerFailure('Error');
      final failure2 = CacheFailure('Cache Error');
      final failure3 = NetworkFailure('Network Error');

      expect(failure1.message, equals('Error'));
      expect(failure2.message, equals('Cache Error'));
      expect(failure3.message, equals('Network Error'));
    });
  });
}