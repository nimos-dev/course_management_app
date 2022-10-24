import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_authentication/app_authentication_providers.dart';
import '../../../../../app_my_results/services/hive_service.dart';

class OverviewScreen extends ConsumerWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hi, ${ref.watch(authRepositoryProvider).userCredential?.user?.displayName}'),
            const SizedBox(height: 12),
            Text('You have completed ${ref.watch(hiveServiceProvider).readTestDataNumberof()} Mini Quiz!'),
            const SizedBox(height: 12),
            Text(
                'Your average scores is ${ref.watch(hiveServiceProvider).readTestDataAverageScore().toStringAsFixed(2)} !'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => ref.read(hiveServiceProvider).writeTestData(),
                  child: const Text('Add'),
                ),
                TextButton(
                  onPressed: () => ref.read(hiveServiceProvider).deleteTestData(),
                  child: const Text('Delete'),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
