
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

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
    this.label,
    this.validationMessages,
  });

  final FormControl<T> control;
  final FutureOr<List<T>> Function(String q) items;
  final String Function(T i) stringify;
  final String? hint;
  final Widget? prefixIcon;
  final Widget Function(BuildContext ctx, T i, bool s) itemBuilder;
  final String? label;
  final Map<String, String Function(Object)>? validationMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!, style: kSemiBoldTextStyle.copyWith(fontSize: 14.sp)),
        ReactiveDropdownSearch<T, T>(
          formControl: control,
          items: (f, _) => items(f),
          compareFn: (i1, i2) => i1 == i2,
          itemAsString: stringify,
          validationMessages: validationMessages,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: kRegularTextStyle.copyWith(fontSize: 14.sp),
            decoration: inputDecoration(context, hint: hint, prefixIcon: prefixIcon),
          ),
          suffixProps: DropdownSuffixProps(
            dropdownButtonProps: DropdownButtonProps(
              color: context.colorScheme.primary,
              iconOpened: Icon(SolarIconsOutline.altArrowUp, color: context.colorScheme.primary),
              iconClosed: Icon(SolarIconsOutline.altArrowDown, color: Colors.grey.shade300),
            ),
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
            listViewProps: ListViewProps(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(4),
            ),
          ),
        ),
      ],
    );
  }
}
