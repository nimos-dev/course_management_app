import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../extensions/string_extension.dart';
import '../../../../../../extensions/app_localizations_context.dart';
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
            const Text('My Overview...'),
            const SizedBox(height: 8),
            Text('Active language: ${context.loc.language.capitalize()}'),
            const SizedBox(height: 16),
            const Text('Active User'),
            const SizedBox(height: 8),
            Text('User ID: ${ref.read(authRepositoryProvider).userCredential?.user?.uid}'),
            const SizedBox(height: 8),
            Text('User Name: ${ref.watch(authRepositoryProvider).userCredential?.user?.displayName}'),
            const SizedBox(height: 8),
            Text('User Email: ${ref.watch(authRepositoryProvider).userCredential?.user?.email}'),
            const SizedBox(height: 8),
            Text('User Phone number: ${ref.watch(authRepositoryProvider).userCredential?.user?.phoneNumber}'),
          ],
        ),
      )),
    );
  }
}

/* 
 */