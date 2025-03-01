import '../common.dart';

class COSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const COSAppBar({super.key, this.centerTitle, required this.title});

  final bool? centerTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: centerTitle, title: Text(title, style: kMediumTextStyle));
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}

class COSAppBarAlt extends StatelessWidget implements PreferredSizeWidget {
  const COSAppBarAlt({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 8.w,
        children: [
          Text('Hi, ${COSGreetingUtil.greeting}', style: kMediumTextStyle),
          Icon(SolarIconsOutline.handShake),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.h);
}
