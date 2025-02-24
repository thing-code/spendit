import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spendit/src/common/common.dart';

import '../../../../common/widgets/base_cupertino.dart';

class TargetForm extends HookConsumerWidget {
  const TargetForm({super.key});
  


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return BaseCupertinoPage(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        physics: BouncingScrollPhysics(),
        children: [
          Text(
            'Masukkan Target',
            style: kMediumTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Gap(8),
          TextFormField(
            controller: controller,
            style: kRegularTextStyle.copyWith(fontSize: 14),
            decoration: inputDecoration(context),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),
        ],
      ),
      onSave: () {
        log(controller.text);
      },
    );
  }

  InputDecoration inputDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      border: baseInputBorder(),
      enabledBorder: baseInputBorder(),
      focusedBorder: baseInputBorder(color: context.colorScheme.primary.withAlpha(200)),
      hintText: 'Placeholder',
      hintStyle: kRegularTextStyle.copyWith(color: Colors.grey.shade300, fontSize: 14),
      filled: true,
      fillColor: Colors.white30,
    );
  }

  OutlineInputBorder baseInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.grey.shade300, width: 1.5),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
