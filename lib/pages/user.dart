import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/services/provider.dart';

final response = FutureProvider((ref) async {
  final ApiService = ref.watch(apiServiceProvider);
  return ApiService.getUser();
});

class User extends ConsumerWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseProvider = ref.watch(response);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Center(
        child: responseProvider.when(data: (data) {
          return Text('${data.first_name}, ${data.last_name}');
        }, error: ((error, stackTrace) {
          return Text(error.toString());
        }), loading: () {
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
