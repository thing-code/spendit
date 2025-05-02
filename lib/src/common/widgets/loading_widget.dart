import 'package:spendit/src/common/common.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator.adaptive(strokeCap: StrokeCap.round));
  }
}

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({super.key});

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
        child: LoadingWidget(),
      ),
    );
  }
}

class COSLoading {
  static OverlayEntry? _overlay;

  static void show(BuildContext context) {
    _overlay = OverlayEntry(builder: (context) => LoadingContainer());

    Overlay.of(context).insert(_overlay!);
  }

  static void hide() {
    _overlay?.remove();
    _overlay = null;
  }

  static bool get isLoading => _overlay != null;
}
