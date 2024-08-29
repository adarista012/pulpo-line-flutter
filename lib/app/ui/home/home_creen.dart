import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulpo_line/app/ui/home/helpers/transaction_form.dart';
import 'package:pulpo_line/app/ui/home/home_controller.dart';
import 'package:pulpo_line/app/ui/home/widgets/custom_bar_chart.dart';
import 'package:pulpo_line/app/ui/home/widgets/transactions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: controller.transactions == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(
                            top: 64.0,
                            bottom: 8.0,
                            left: 8.0,
                            right: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1.6,
                            child: CustomBarChart(
                              list: controller.transactions!,
                            ),
                          ),
                        ),
                ),
                Expanded(
                  flex: 3,
                  child: controller.transactions == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        )
                      : transactions(controller.transactions!),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                transactionForm(context, controller.newTransaction),
            child: const Text('+'),
          ),
        );
      },
    );
  }
}
