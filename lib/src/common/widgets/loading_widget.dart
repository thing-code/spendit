import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/common/common.dart';

class COSLoading extends StatelessWidget {
  const COSLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(strokeCap: StrokeCap.round),
    );
  }
}

class LoadingOverlay extends ConsumerWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingProvider);
    return isLoading ? _loading(context) : Container();
  }

  Widget _loading(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: LoadingContainer(),
    );
  }
}

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 12,
              spreadRadius: 4,
              color: const Color.fromARGB(31, 43, 43, 43),
            ),
          ],
        ),
        child: COSLoading(),
      ),
    );
  }
}
