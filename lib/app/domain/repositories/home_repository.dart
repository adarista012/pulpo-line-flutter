import 'package:pulpo_line/app/domain/models/transaction.dart';

abstract class HomeRepository {
  Future<List<Transaction>> getTransactions();
  Future<Transaction?> newTransaction(Transaction transaction);
}
