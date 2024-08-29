import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpo_line/app/domain/models/transaction.dart';
import 'package:pulpo_line/app/domain/repositories/home_repository.dart';

class HomeController extends GetxController {
  List<Transaction>? _transactions;
  List<Transaction>? get transactions => _transactions;

  final HomeRepository repository = Get.find();

  HomeController() {
    getTransactions();
  }

  getTransactions() async {
    _transactions = await repository.getTransactions();
    update();
  }

  void newTransaction(Transaction newTransaction) async {
    final Transaction? transaction =
        await repository.newTransaction(newTransaction);
    if (transaction == null) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error',
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Transaction created',
          messageText: Text(transaction.description),
          backgroundColor: Colors.greenAccent,
        ),
      );
      getTransactions();
    }
  }
}
