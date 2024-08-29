import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pulpo_line/app/domain/models/transaction.dart';
import 'package:pulpo_line/app/domain/repositories/home_repository.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "pulpo-line-api.vercel.app";

class HomeRepositoryImplementation extends HomeRepository {
  final url = Uri.https(baseUrl, '/books');
  @override
  Future<List<Transaction>> getTransactions() async {
    List<Transaction> list = [];
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final List json = jsonDecode(response.body);
        list = json
            .map(
              (t) => Transaction(
                amount: double.parse(t['price'].toString()),
                date: DateTime.fromMicrosecondsSinceEpoch(t['timeEpoch']),
                description: t['description'],
                id: t['_id'],
                title: t['title'],
              ),
            )
            .toList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return list;
  }

  @override
  Future<Transaction?> newTransaction(Transaction transaction) async {
    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            "title": transaction.title,
            "description": transaction.description,
            "price": transaction.amount.toString(),
            "timeEpoch": transaction.date.microsecondsSinceEpoch.toString(),
          },
        ),
      );
      final transactionResponse = jsonDecode(response.body);
      return Transaction(
        amount: double.parse(transactionResponse['price'].toString()),
        date: DateTime.fromMicrosecondsSinceEpoch(
            transactionResponse['timeEpoch']),
        description: transactionResponse['description'],
        id: transactionResponse['_id'],
        title: transactionResponse['title'],
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
