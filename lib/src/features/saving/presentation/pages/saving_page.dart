import 'package:spendit/src/common/common.dart';

class SavingPage extends StatelessWidget {
  const SavingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: COSAppBar(title: 'Savings', centerTitle: true),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(16.w),
            color: context.colorScheme.secondaryContainer,
            child: SizedBox(
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Savings',
                          style: kMediumTextStyle.copyWith(
                            fontSize: 16.sp,
                            color: context.colorScheme.secondary,
                          ),
                        ),
                        Text(20000000.currency, style: kBoldTextStyle.copyWith(fontSize: 24.sp)),
                      ],
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    margin: EdgeInsets.all(8.w),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: context.colorScheme.secondary,
                    ),
                    child: Text(
                      'Last Updated - ${now.getDate}',
                      style: kMediumTextStyle.copyWith(color: context.colorScheme.onSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
