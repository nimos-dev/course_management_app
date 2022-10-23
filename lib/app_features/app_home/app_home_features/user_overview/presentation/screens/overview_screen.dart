import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app_authentication/app_authentication_providers.dart';

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
            Text(
                'You have completed ${ref.watch(authRepositoryProvider).userCredential?.user?.displayName} Mini quiz!'),
            const SizedBox(height: 12),
            Text('Your average scores is ${ref.watch(authRepositoryProvider).userCredential?.user?.displayName}!'),
            const SizedBox(height: 12),
            Text(
                'You completed your last miniquiz ${ref.watch(authRepositoryProvider).userCredential?.user?.displayName}!'),
            const SizedBox(height: 12),
            Text('Mini quiz daily streak: ${ref.watch(authRepositoryProvider).userCredential?.user?.displayName}!'),
          ],
        ),
      )),
    );
  }
}
