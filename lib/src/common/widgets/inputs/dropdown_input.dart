import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../common.dart';

class COSDropdownInput<T> extends StatelessWidget {
  const COSDropdownInput({
    super.key,
    required this.control,
    required this.items,
    required this.stringify,
    this.hint,
    this.prefixIcon,
    required this.itemBuilder,
  });

  final FormControl<T> control;
  final FutureOr<List<T>> Function(String q) items;
  final String Function(T i) stringify;
  final String? hint;
  final Widget? prefixIcon;
  final Widget Function(BuildContext ctx, T i, bool s) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownSearch<T, T>(
      formControl: control,
      items: (f, _) => items(f),
      compareFn: (i1, i2) => i1 == i2,
      itemAsString: stringify,
      dropdownDecoratorProps: DropDownDecoratorProps(
        decoration: inputDecoration(context, hint: hint, prefixIcon: prefixIcon),
      ),
      popupProps: PopupProps.menu(
        itemClickProps: ClickProps(borderRadius: BorderRadius.circular(12)),
        disableFilter: true, //data will be filtered by the backend
        showSearchBox: false,
        showSelectedItems: true,
        fit: FlexFit.loose,
        menuProps: MenuProps(
          borderRadius: BorderRadius.circular(12),
          margin: EdgeInsets.symmetric(vertical: 4),
        ),
        suggestedItemProps: SuggestedItemProps(),
        loadingBuilder: (ctx, se) => Center(child: CircularProgressIndicator()),
        emptyBuilder: (ctx, se) => Center(child: Text('No Data.')),
        errorBuilder: (ctx, se, _) => Center(child: Text('An Error Ocurred.')),
        containerBuilder: (ctx, pw) => Container(padding: EdgeInsets.all(4), child: pw),
        itemBuilder: (ctx, i, _, s) => itemBuilder(ctx, i, s),
        listViewProps: ListViewProps(physics: BouncingScrollPhysics(), padding: EdgeInsets.all(4)),
      ),
    );
  }
}