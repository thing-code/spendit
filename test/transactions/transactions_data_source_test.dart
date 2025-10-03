import 'package:flutter_test/flutter_test.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/data/sources/transactions_data_source.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('Transactions Data Source Test', () {
    late Database database;
    late TransactionsDataSource dataSource;

    setUp(() async {
      database = await openDatabase(
        inMemoryDatabasePath,
        version: 2,
        onCreate: (db, version) async {
          await db.execute(SqlCommand.executeTransactionTable);
        },
      );
      dataSource = TransactionsDataSourceImpl(Future.value(database));
    });

    tearDown(() async {
      await database.close();
    });

    group('Insert Transaction', () {
      test('Should insert income and return id', () async {
        final income = Income(
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
        );

        SiLogger.info(income.toJson());

        final id = await dataSource.create(income);

        expect(id, greaterThan(0));
      });

      test('Should insert expense and return id', () async {
        final expense = Expense(
          amount: 25000,
          category: ExpenseCategory.food,
          notes: 'Beli Nasi Padang',
          createdAt: DateTime.now(),
        );

        SiLogger.info(expense.toJson());

        final id = await dataSource.create(expense);

        expect(id, greaterThan(0));
      });

      // TODO : Waiting for goals feature done
      // test('Should insert goals and return id', () async {
      //   final expense = Transfer(
      //     amount: 25000,
      //     goalId: 1,
      //   );

      //   final id = await dataSource.create(expense);

      //   expect(id, greaterThan(0));
      // });
    });
  });
}

// void dataSourceTests() {
//   setUpAll(() {
//     sqfliteFfiInit();
//     databaseFactory = databaseFactoryFfi;
//   });

//   group('UserLocalDataSource Tests', () {
//     late Database database;
//     late UserLocalDataSource dataSource;

//     setUp(() async {
//       database = await openDatabase(
//         inMemoryDatabasePath,
//         version: 1,
//         onCreate: (db, version) async {
//           await db.execute('''
//             CREATE TABLE users (
//               id INTEGER PRIMARY KEY AUTOINCREMENT,
//               name TEXT NOT NULL,
//               email TEXT UNIQUE NOT NULL,
//               age INTEGER,
//               created_at TEXT NOT NULL
//             )
//           ''');
//         },
//       );
//       dataSource = UserLocalDataSource(database);
//     });

//     tearDown(() async {
//       await database.close();
//     });

//     group('Insert', () {
//       test('should insert user and return id', () async {
//         // Arrange
//         final userMap = {
//           'name': 'John Doe',
//           'email': 'john@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         };

//         // Act
//         final id = await dataSource.insertUser(userMap);

//         // Assert
//         expect(id, greaterThan(0));
//       });

//       test('should insert multiple users', () async {
//         // Arrange
//         final users = [
//           {
//             'name': 'User 1',
//             'email': 'user1@example.com',
//             'age': 20,
//             'created_at': DateTime.now().toIso8601String(),
//           },
//           {
//             'name': 'User 2',
//             'email': 'user2@example.com',
//             'age': 30,
//             'created_at': DateTime.now().toIso8601String(),
//           },
//         ];

//         // Act
//         for (var user in users) {
//           await dataSource.insertUser(user);
//         }

//         // Assert
//         final allUsers = await dataSource.getAllUsers();
//         expect(allUsers.length, 2);
//       });
//     });

//     group('Query', () {
//       setUp(() async {
//         // Seed data
//         await dataSource.insertUser({
//           'name': 'Alice',
//           'email': 'alice@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         });
//       });

//       test('should get user by id', () async {
//         // Act
//         final user = await dataSource.getUserById(1);

//         // Assert
//         expect(user, isNotNull);
//         expect(user!['name'], 'Alice');
//         expect(user['email'], 'alice@example.com');
//       });

//       test('should return null for non-existent id', () async {
//         // Act
//         final user = await dataSource.getUserById(999);

//         // Assert
//         expect(user, isNull);
//       });

//       test('should get all users ordered by created_at', () async {
//         // Arrange - Add more users
//         await Future.delayed(Duration(milliseconds: 10));
//         await dataSource.insertUser({
//           'name': 'Bob',
//           'email': 'bob@example.com',
//           'age': 30,
//           'created_at': DateTime.now().toIso8601String(),
//         });

//         // Act
//         final users = await dataSource.getAllUsers();

//         // Assert
//         expect(users.length, 2);
//         expect(users.first['name'], 'Bob'); // Most recent first
//       });

//       test('should filter users by age range', () async {
//         // Arrange
//         await dataSource.insertUser({
//           'name': 'Bob',
//           'email': 'bob@example.com',
//           'age': 30,
//           'created_at': DateTime.now().toIso8601String(),
//         });
//         await dataSource.insertUser({
//           'name': 'Charlie',
//           'email': 'charlie@example.com',
//           'age': 40,
//           'created_at': DateTime.now().toIso8601String(),
//         });

//         // Act
//         final users = await dataSource.getUsersByAgeRange(25, 35);

//         // Assert
//         expect(users.length, 2); // Alice (25) and Bob (30)
//       });

//       test('should check if email exists', () async {
//         // Act & Assert
//         final exists = await dataSource.isEmailExists('alice@example.com');
//         expect(exists, true);

//         final notExists = await dataSource.isEmailExists('ghost@example.com');
//         expect(notExists, false);
//       });
//     });

//     group('Update', () {
//       test('should update user and return affected rows', () async {
//         // Arrange
//         final id = await dataSource.insertUser({
//           'name': 'John',
//           'email': 'john@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         });

//         // Act
//         final rowsAffected = await dataSource.updateUser(id, {
//           'name': 'John Updated',
//           'email': 'john@example.com',
//           'age': 30,
//           'created_at': DateTime.now().toIso8601String(),
//         });

//         // Assert
//         expect(rowsAffected, 1);

//         final updated = await dataSource.getUserById(id);
//         expect(updated!['name'], 'John Updated');
//         expect(updated['age'], 30);
//       });

//       test('should return 0 when updating non-existent user', () async {
//         // Act
//         final rowsAffected = await dataSource.updateUser(999, {
//           'name': 'Ghost',
//           'email': 'ghost@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         });

//         // Assert
//         expect(rowsAffected, 0);
//       });
//     });

//     group('Delete', () {
//       test('should delete user and return affected rows', () async {
//         // Arrange
//         final id = await dataSource.insertUser({
//           'name': 'John',
//           'email': 'john@example.com',
//           'age': 25,
//           'created_at': DateTime.now().toIso8601String(),
//         });

//         // Act
//         final rowsAffected = await dataSource.deleteUser(id);

//         // Assert
//         expect(rowsAffected, 1);

//         final deleted = await dataSource.getUserById(id);
//         expect(deleted, isNull);
//       });
//     });
//   });
// }
