import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/data/repositories/transactions_repository.dart';
import 'package:spendit/src/features/transactions/data/sources/transactions_data_source.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';

class MockTransactionsDataSource extends Mock
    implements TransactionsDataSource {}

class FakeIncome extends Fake implements Income {}

class FakeExpense extends Fake implements Expense {}

void main() {
  group('Transactions Repository Test', () {
    late MockTransactionsDataSource mockDataSource;
    late TransactionsRepository repository;

    setUp(() {
      registerFallbackValue(FakeIncome());
      registerFallbackValue(FakeExpense());
      mockDataSource = MockTransactionsDataSource();
      repository = TransactionsRepositoryImpl(mockDataSource);
    });

    group('Insert Transaction', () {
      test('Should insert income successfully', () async {
        final income = Income(
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
        );

        when(() => mockDataSource.create(any())).thenAnswer((_) async => 1);

        final result = await repository.create(income);

        expect(result, 1);

        verify(() => mockDataSource.create(any())).called(1);
      });

      test('Should insert expense successfully', () async {
        final expense = Expense(
          amount: 25000,
          category: ExpenseCategory.food,
          notes: 'Beli Nasi Padang',
          createdAt: DateTime.now(),
        );

        when(() => mockDataSource.create(any())).thenAnswer((_) async => 1);

        final result = await repository.create(expense);

        expect(result, 1);

        verify(() => mockDataSource.create(any())).called(1);
      });
    });
  });
}

// Create Mock menggunakan Mocktail
// class MockUserLocalDataSource extends Mock implements UserLocalDataSource {}

// void repositoryTestsWithMocktail() {
//   group('UserRepository Tests with Mocktail', () {
//     late MockUserLocalDataSource mockDataSource;
//     late UserRepository repository;

//     setUp(() {
//       mockDataSource = MockUserLocalDataSource();
//       repository = UserRepository(mockDataSource);
//     });

//     group('Create User - Business Logic', () {
//       test('should create user successfully with valid data', () async {
//         // Arrange
//         final user = User(
//           name: 'John Doe',
//           email: 'john@example.com',
//           age: 25,
//         );

//         // Setup mock behavior
//         when(() => mockDataSource.isEmailExists(any()))
//             .thenAnswer((_) async => false);
        
//         when(() => mockDataSource.insertUser(any()))
//             .thenAnswer((_) async => 1);

//         // Act
//         final result = await repository.createUser(user);

//         // Assert
//         expect(result.id, 1);
//         expect(result.name, 'John Doe');
//         expect(result.email, 'john@example.com');

//         // Verify mock was called correctly
//         verify(() => mockDataSource.isEmailExists('john@example.com')).called(1);
//         verify(() => mockDataSource.insertUser(any())).called(1);
//       });

//       test('should throw error for invalid email format', () async {
//         // Arrange
//         final user = User(
//           name: 'John Doe',
//           email: 'invalid-email',
//           age: 25,
//         );

//         // Act & Assert
//         expect(
//           () => repository.createUser(user),
//           throwsA(isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('Invalid email format'),
//           )),
//         );

//         // Verify data source was NOT called (validation failed before)
//         verifyNever(() => mockDataSource.isEmailExists(any()));
//         verifyNever(() => mockDataSource.insertUser(any()));
//       });

//       test('should throw error for invalid age', () async {
//         // Arrange
//         final user = User(
//           name: 'John Doe',
//           email: 'john@example.com',
//           age: -5,
//         );

//         // Act & Assert
//         expect(
//           () => repository.createUser(user),
//           throwsA(isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('Invalid age'),
//           )),
//         );

//         verifyNever(() => mockDataSource.isEmailExists(any()));
//         verifyNever(() => mockDataSource.insertUser(any()));
//       });

//       test('should throw error for duplicate email', () async {
//         // Arrange
//         final user = User(
//           name: 'John Doe',
//           email: 'john@example.com',
//           age: 25,
//         );

//         // Mock: email already exists
//         when(() => mockDataSource.isEmailExists('john@example.com'))
//             .thenAnswer((_) async => true);

//         // Act & Assert
//         expect(
//           () => repository.createUser(user),
//           throwsA(isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('Email already exists'),
//           )),
//         );

//         // Verify email check was called but insert was NOT
//         verify(() => mockDataSource.isEmailExists('john@example.com')).called(1);
//         verifyNever(() => mockDataSource.insertUser(any()));
//       });

//       test('should throw error when data source insert fails', () async {
//         // Arrange
//         final user = User(
//           name: 'John Doe',
//           email: 'john@example.com',
//           age: 25,
//         );

//         when(() => mockDataSource.isEmailExists(any()))
//             .thenAnswer((_) async => false);
        
//         // Mock: insert throws error
//         when(() => mockDataSource.insertUser(any()))
//             .thenThrow(Exception('Database error'));

//         // Act & Assert
//         expect(
//           () => repository.createUser(user),
//           throwsA(isA<Exception>()),
//         );

//         verify(() => mockDataSource.insertUser(any())).called(1);
//       });
//     });

//     group('Get Users - Mapping', () {
//       test('should map data source response to domain model', () async {
//         // Arrange
//         final userMap = {
//           'id': 1,
//           'name': 'John Doe',
//           'email': 'john@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         };

//         when(() => mockDataSource.getUserById(1))
//             .thenAnswer((_) async => userMap);

//         // Act
//         final result = await repository.getUserById(1);

//         // Assert
//         expect(result, isA<User>());
//         expect(result?.name, 'John Doe');
//         expect(result?.email, 'john@example.com');
//         expect(result?.age, 25);

//         verify(() => mockDataSource.getUserById(1)).called(1);
//       });

//       test('should return null when user not found', () async {
//         // Arrange
//         when(() => mockDataSource.getUserById(999))
//             .thenAnswer((_) async => null);

//         // Act
//         final result = await repository.getUserById(999);

//         // Assert
//         expect(result, isNull);
//         verify(() => mockDataSource.getUserById(999)).called(1);
//       });

//       test('should get all users as domain models', () async {
//         // Arrange
//         final userMaps = [
//           {
//             'id': 1,
//             'name': 'User 1',
//             'email': 'user1@example.com',
//             'age': 20,
//             'created_at': DateTime.now().toIso8601String(),
//           },
//           {
//             'id': 2,
//             'name': 'User 2',
//             'email': 'user2@example.com',
//             'age': 30,
//             'created_at': DateTime.now().toIso8601String(),
//           },
//         ];

//         when(() => mockDataSource.getAllUsers())
//             .thenAnswer((_) async => userMaps);

//         // Act
//         final users = await repository.getAllUsers();

//         // Assert
//         expect(users, isA<List<User>>());
//         expect(users.length, 2);
//         expect(users[0].name, 'User 1');
//         expect(users[1].name, 'User 2');

//         verify(() => mockDataSource.getAllUsers()).called(1);
//       });

//       test('should handle empty list from data source', () async {
//         // Arrange
//         when(() => mockDataSource.getAllUsers())
//             .thenAnswer((_) async => []);

//         // Act
//         final users = await repository.getAllUsers();

//         // Assert
//         expect(users, isEmpty);
//         verify(() => mockDataSource.getAllUsers()).called(1);
//       });
//     });

//     group('Business Logic - Adult Users', () {
//       test('should get only adult users (18+)', () async {
//         // Arrange
//         final userMaps = [
//           {
//             'id': 1,
//             'name': 'Adult 1',
//             'email': 'adult1@example.com',
//             'age': 25,
//             'created_at': DateTime.now().toIso8601String(),
//           },
//           {
//             'id': 2,
//             'name': 'Adult 2',
//             'email': 'adult2@example.com',
//             'age': 30,
//             'created_at': DateTime.now().toIso8601String(),
//           },
//         ];

//         when(() => mockDataSource.getUsersByAgeRange(18, 150))
//             .thenAnswer((_) async => userMaps);

//         // Act
//         final adults = await repository.getAdultUsers();

//         // Assert
//         expect(adults.length, 2);
//         expect(adults.every((u) => u.isAdult()), true);

//         verify(() => mockDataSource.getUsersByAgeRange(18, 150)).called(1);
//       });

//       test('should return empty list when no adults found', () async {
//         // Arrange
//         when(() => mockDataSource.getUsersByAgeRange(18, 150))
//             .thenAnswer((_) async => []);

//         // Act
//         final adults = await repository.getAdultUsers();

//         // Assert
//         expect(adults, isEmpty);
//         verify(() => mockDataSource.getUsersByAgeRange(18, 150)).called(1);
//       });
//     });

//     group('Update User - Validation', () {
//       test('should update user with valid data', () async {
//         // Arrange
//         final user = User(
//           id: 1,
//           name: 'John Updated',
//           email: 'john.updated@example.com',
//           age: 30,
//         );

//         when(() => mockDataSource.updateUser(1, any()))
//             .thenAnswer((_) async => 1);

//         // Act & Assert
//         await expectLater(
//           repository.updateUser(user),
//           completes,
//         );

//         verify(() => mockDataSource.updateUser(1, any())).called(1);
//       });

//       test('should throw error when updating without id', () async {
//         // Arrange
//         final user = User(
//           name: 'John',
//           email: 'john@example.com',
//           age: 25,
//         );

//         // Act & Assert
//         expect(
//           () => repository.updateUser(user),
//           throwsA(isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('User ID is required'),
//           )),
//         );

//         verifyNever(() => mockDataSource.updateUser(any(), any()));
//       });

//       test('should throw error when updating with invalid email', () async {
//         // Arrange
//         final user = User(
//           id: 1,
//           name: 'John',
//           email: 'invalid-email',
//           age: 25,
//         );

//         // Act & Assert
//         expect(
//           () => repository.updateUser(user),
//           throwsA(isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('Invalid email format'),
//           )),
//         );

//         verifyNever(() => mockDataSource.updateUser(any(), any()));
//       });

//       test('should throw error when updating non-existent user', () async {
//         // Arrange
//         final user = User(
//           id: 999,
//           name: 'Ghost',
//           email: 'ghost@example.com',
//           age: 25,
//         );

//         when(() => mockDataSource.updateUser(999, any()))
//             .thenAnswer((_) async => 0);

//         // Act & Assert
//         expect(
//           () => repository.updateUser(user),
//           throwsA(isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('User not found'),
//           )),
//         );

//         verify(() => mockDataSource.updateUser(999, any())).called(1);
//       });
//     });

//     group('Delete User - Business Logic', () {
//       test('should delete existing user', () async {
//         // Arrange
//         final userMap = {
//           'id': 1,
//           'name': 'John',
//           'email': 'john@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         };

//         when(() => mockDataSource.getUserById(1))
//             .thenAnswer((_) async => userMap);
        
//         when(() => mockDataSource.deleteUser(1))
//             .thenAnswer((_) async => 1);

//         // Act & Assert
//         await expectLater(
//           repository.deleteUser(1),
//           completes,
//         );

//         verify(() => mockDataSource.getUserById(1)).called(1);
//         verify(() => mockDataSource.deleteUser(1)).called(1);
//       });

//       test('should throw error when deleting non-existent user', () async {
//         // Arrange
//         when(() => mockDataSource.getUserById(999))
//             .thenAnswer((_) async => null);

//         // Act & Assert
//         expect(
//           () => repository.deleteUser(999),
//           throwsA(isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('User not found'),
//           )),
//         );

//         verify(() => mockDataSource.getUserById(999)).called(1);
//         verifyNever(() => mockDataSource.deleteUser(any()));
//       });

//       test('should handle data source delete failure', () async {
//         // Arrange
//         final userMap = {
//           'id': 1,
//           'name': 'John',
//           'email': 'john@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         };

//         when(() => mockDataSource.getUserById(1))
//             .thenAnswer((_) async => userMap);
        
//         when(() => mockDataSource.deleteUser(1))
//             .thenThrow(Exception('Database constraint violation'));

//         // Act & Assert
//         expect(
//           () => repository.deleteUser(1),
//           throwsA(isA<Exception>()),
//         );

//         verify(() => mockDataSource.deleteUser(1)).called(1);
//       });
//     });

//     group('Verify Interactions', () {
//       test('should verify call order', () async {
//         // Arrange
//         final user = User(
//           name: 'John Doe',
//           email: 'john@example.com',
//           age: 25,
//         );

//         when(() => mockDataSource.isEmailExists(any()))
//             .thenAnswer((_) async => false);
        
//         when(() => mockDataSource.insertUser(any()))
//             .thenAnswer((_) async => 1);

//         // Act
//         await repository.createUser(user);

//         // Assert - verify call order
//         verifyInOrder([
//           () => mockDataSource.isEmailExists('john@example.com'),
//           () => mockDataSource.insertUser(any()),
//         ]);
//       });

//       test('should verify exact arguments', () async {
//         // Arrange
//         final user = User(
//           id: 1,
//           name: 'John Updated',
//           email: 'john@example.com',
//           age: 30,
//         );

//         when(() => mockDataSource.updateUser(any(), any()))
//             .thenAnswer((_) async => 1);

//         // Act
//         await repository.updateUser(user);

//         // Assert - capture and verify exact arguments
//         final captured = verify(
//           () => mockDataSource.updateUser(1, captureAny())
//         ).captured;

//         expect(captured.length, 1);
//         final capturedMap = captured.first as Map<String, dynamic>;
//         expect(capturedMap['name'], 'John Updated');
//         expect(capturedMap['age'], 30);
//       });

//       test('should verify method was never called', () async {
//         // Arrange
//         final user = User(
//           name: 'John',
//           email: 'invalid-email',
//           age: 25,
//         );

//         // Act & Assert
//         try {
//           await repository.createUser(user);
//         } catch (e) {
//           // Expected to throw
//         }

//         // Verify these were never called due to validation failure
//         verifyNever(() => mockDataSource.isEmailExists(any()));
//         verifyNever(() => mockDataSource.insertUser(any()));
//       });
//     });

//     group('Complex Scenarios', () {
//       test('should handle multiple sequential operations', () async {
//         // Arrange
//         final user1 = User(
//           name: 'User 1',
//           email: 'user1@example.com',
//           age: 25,
//         );

//         final user2 = User(
//           name: 'User 2',
//           email: 'user2@example.com',
//           age: 30,
//         );

//         when(() => mockDataSource.isEmailExists(any()))
//             .thenAnswer((_) async => false);
        
//         when(() => mockDataSource.insertUser(any()))
//             .thenAnswer((_) async => 1);

//         // Act
//         await repository.createUser(user1);
//         await repository.createUser(user2);

//         // Assert
//         verify(() => mockDataSource.isEmailExists(any())).called(2);
//         verify(() => mockDataSource.insertUser(any())).called(2);
//       });

//       test('should mock different return values for same method', () async {
//         // Arrange - different behaviors for different arguments
//         when(() => mockDataSource.getUserById(1))
//             .thenAnswer((_) async => {
//               'id': 1,
//               'name': 'User 1',
//               'email': 'user1@example.com',
//               'age': 25,
//               'created_at': DateTime.now().toIso8601String(),
//             });

//         when(() => mockDataSource.getUserById(2))
//             .thenAnswer((_) async => null);

//         // Act
//         final user1 = await repository.getUserById(1);
//         final user2 = await repository.getUserById(2);

//         // Assert
//         expect(user1, isNotNull);
//         expect(user2, isNull);
//       });
//     });
//   });
// }