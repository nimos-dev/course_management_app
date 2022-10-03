import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'l10n_state.dart';

final l10nStateNotifier = ChangeNotifierProvider((ref) => L10nState());
