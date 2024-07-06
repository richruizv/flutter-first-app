import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('Uh oh... nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
        const SizedBox(height: 16),
        const Text(''),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground))
      ]),
    );
  }
}
