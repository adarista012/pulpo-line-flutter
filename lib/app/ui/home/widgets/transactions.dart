import 'package:flutter/material.dart';
import 'package:pulpo_line/app/domain/models/transaction.dart';

Widget transactions(List<Transaction> list) => ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(list[index].title),
            trailing: Text('${list[index].amount.toString()} \$'),
            subtitle: Text('${list[index].date}'),
            // Text(
            //     '${list[index].date.day}/${list[index].date.month}/${list[index].date.year}'),
          ),
        );
      },
    );
