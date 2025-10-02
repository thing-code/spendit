import 'package:spendit/src/common/common.dart';

import '../widgets/saving_header.dart';
import '../widgets/saving_list.dart';

class SavingPage extends StatelessWidget {
  const SavingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: COSAppBar(title: 'Saving', centerTitle: true),
      body: Column(children: [SavingHeader(), Expanded(child: SavingList())]),
    );
  }
}
