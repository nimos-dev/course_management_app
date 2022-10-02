import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text('My Profile!')),
        ],
      ),
    );
  }
}
