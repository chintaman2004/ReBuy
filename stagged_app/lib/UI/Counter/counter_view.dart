import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stagged_app/UI/Counter/counter_viewmodel.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CounterViewmodel(),
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${model.counter}'),
            ElevatedButton(
              onPressed: model.incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        );
      },
    );
  }
}
