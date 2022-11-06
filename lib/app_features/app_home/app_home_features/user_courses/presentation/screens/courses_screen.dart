import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:school_soft_project/app_features/app_authentication/app_authentication_providers.dart';
import 'package:school_soft_project/extensions/string_extension.dart';

import '../../../../../../global_services/firebase_services/Firestore_service.dart';
import '../../../../../app_settings/app_settings_features/app_theme/app_theme_state.dart';
import '../../../../../course_quiz/presentation/utils/box_shadow_utils.dart';

class CoursesScreen extends ConsumerWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
        .collection('questions')
        .doc(ref.read(authRepositoryProvider).getUserID())
        .collection('my_questions')
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text(AppLocalizations.of(context).practice_more.capitalize()),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return GestureDetector(
                    onDoubleTap: () {
                      String? uID = ref.read(authRepositoryProvider).getUserID();
                      if (uID != null) {
                        ref.read(firestoreServiceProvider).deleteUser(document.id, uID);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: boxShadow,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          tileColor:
                              ref.watch(appThemeStateNotifier).isDarkModeEnabled! ? Colors.white12 : Colors.black12,
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              stripHtml(data['Question']),
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText2,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: AppLocalizations.of(context).correct_answer.capitalize(),
                                    style: const TextStyle(color: Colors.black54),
                                  ),
                                  TextSpan(
                                    text: ' ${stripHtml(data['Answer'])}',
                                    style: const TextStyle(color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
  // Help function Strip HTML tags from API data...

  static String stripHtml(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }
}
