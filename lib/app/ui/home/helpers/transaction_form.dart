import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpo_line/app/domain/models/transaction.dart';

transactionForm(
    BuildContext context, void Function(Transaction newTransaction) onPressed) {
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  return Get.bottomSheet(
    Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: description,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
            TextField(
              controller: amount,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(hintText: 'Amount'),
            ),
            const SizedBox(height: 24.0),
            MaterialButton(
              onPressed: () {
                if (amount.text.isNotEmpty &&
                    title.text.isNotEmpty &&
                    description.text.isNotEmpty) {
                  onPressed(
                    Transaction(
                      amount: double.parse(amount.text),
                      date: DateTime.now(),
                      description: description.text,
                      id: '',
                      title: title.text,
                    ),
                  );
                  Get.back();
                }
              },
              color: Theme.of(context).colorScheme.primary,
              minWidth: double.infinity,
              shape: const StadiumBorder(),
              child: const Text(
                'Create Transaction',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
