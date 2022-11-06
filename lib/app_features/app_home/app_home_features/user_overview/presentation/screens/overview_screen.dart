import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_soft_project/extensions/string_extension.dart';
import '../../../../../app_authentication/app_authentication_providers.dart';
import '../../../../../../global_services/hive_services/hive_service.dart';

import 'package:firebase_storage/firebase_storage.dart';

class OverviewScreen extends ConsumerStatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends ConsumerState<OverviewScreen> {
  String profilePicLink = '';
  String uID = '';

  @override
  void initState() {
    if (ref.read(authRepositoryProvider).getUserID() != null) {
      uID = ref.read(authRepositoryProvider).getUserID()!;
      profilePicLink = ref.read(hiveServiceProvider).getAvatarLink();
    }

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Center(child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  pickUploadProfilePic(ref);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 80, bottom: 24),
                  height: 120,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white24),
                  child: Center(
                    child: profilePicLink == ''
                        ? const Icon(Icons.person, color: Colors.grey, size: 80)
                        : ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(profilePicLink)),
                  ),
                ),
              ),
              // ---------------->
              const SizedBox(height: 12),

              Text('${AppLocalizations.of(context).hi.capitalize()}, ${ref.watch(hiveServiceProvider).getUserName()}'),
              const SizedBox(height: 12),
              Text(
                  '${AppLocalizations.of(context).you_have_completed.capitalize()} ${ref.watch(hiveServiceProvider).readTestDataNumberof()} ${AppLocalizations.of(context).mini_quiz.capitalize()}'),
              const SizedBox(height: 12),
              Text(
                  '${AppLocalizations.of(context).average_score.capitalize()} ${ref.watch(hiveServiceProvider).readTestDataAverageScore().toStringAsFixed(2)}'),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => ref.read(hiveServiceProvider).deleteTestData(),
                child: Text(AppLocalizations.of(context).reset_progress.capitalize()),
              ),
            ],
          );
        },
      )),
    );
  }

  // nead to refactor to own file...
  void pickUploadProfilePic(WidgetRef myRef) async {
    final image =
        await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512, imageQuality: 90);

    Reference ref = FirebaseStorage.instance.ref().child('${myRef.read(authRepositoryProvider).user?.uid}_avatar.jpg');

    if (image != null) {
      await ref.putFile(File(image.path));
    }

    // Temp, extract using Riverpod....

    ref.getDownloadURL().then(
          (value) async => setState(
            () {
              profilePicLink = value;
              myRef.read(hiveServiceProvider).setAvatarLink(value);
            },
          ),
        );
  }
}
