
import 'package:component_v1/extension/textstyle_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:slicing_design/color_scheme.dart';
import 'package:slicing_design/utils.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? backgroundColor;
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final TextTheme? textTheme;
  final bool? centerTitle;
  final double? titleSpacing;
  final double? toolbarOpacity;
  final double? bottomOpacity;
  final Color? foregroundColor;
  final double? scrolledUnderElevation;
  final ShapeBorder? shape;
  final double? toolbarHeight;
  final TextStyle? titleTextStyle;
  final TextStyle? toolbarTextStyle;

  const CustomAppBarWidget({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.textTheme,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarOpacity,
    this.bottomOpacity,
    this.foregroundColor,
    this.scrolledUnderElevation,
    this.shape,
    this.toolbarHeight,
    this.titleTextStyle,
    this.toolbarTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      leading: leading ??
          (ModalRoute.of(context)?.canPop == true
              ? IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    PhosphorIconsRegular.caretLeft,
                    color: foregroundColor ??
                        getTextColor(Theme.of(context)
                            .colorScheme
                            .backgroundColorPrimary),
                  ),
                )
              : null),
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation,
      backgroundColor: backgroundColor ??
          Theme.of(context).colorScheme.backgroundColorPrimary,
      iconTheme: iconTheme,
      centerTitle: centerTitle,
      toolbarOpacity: toolbarOpacity ?? 1.0,
      titleSpacing: titleSpacing,
      foregroundColor:
          foregroundColor ?? Theme.of(context).colorScheme.fontColorPrimary,
      bottomOpacity: bottomOpacity ?? 1.0,
      scrolledUnderElevation: scrolledUnderElevation,
      shape: shape ?? const RoundedRectangleBorder(),
      titleTextStyle: titleTextStyle ??
          Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontSize: 20)
              .boldStyle,
      toolbarHeight: toolbarHeight,
      toolbarTextStyle: toolbarTextStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
