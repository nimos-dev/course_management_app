import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SplashProgressIndicator extends ConsumerWidget {
  const SplashProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('School Quiz Project', style: TextStyle(color: Colors.white)),
          SizedBox(height: 20),
          CircularProgressIndicator(color: Colors.white),
        ],
      ),
    );
  }
}
