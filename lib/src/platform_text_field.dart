/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;
import 'package:fluent_ui/fluent_ui.dart'
    show FluentTextSelectionToolbar, TextBox;
import 'package:flutter/cupertino.dart'
    show
        CupertinoAdaptiveTextSelectionToolbar,
        CupertinoColors,
        CupertinoDynamicColor,
        CupertinoTextField,
        OverlayVisibilityMode;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'
    show
        AdaptiveTextSelectionToolbar,
        InputCounterWidgetBuilder,
        InputDecoration,
        MaterialStatesController,
        TextField;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_extended_platform_widgets/src/platform.dart';
import 'package:flutter_extended_platform_widgets/src/widget_base.dart';

const BorderSide _kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoDynamicColor.withBrightness(
    color: Color(0x33000000),
    darkColor: Color(0x33FFFFFF),
  ),
  width: 0,
);

const Border _kDefaultRoundedBorder = Border(
  top: _kDefaultRoundedBorderSide,
  bottom: _kDefaultRoundedBorderSide,
  left: _kDefaultRoundedBorderSide,
  right: _kDefaultRoundedBorderSide,
);

const BoxDecoration kDefaultRoundedBorderDecoration = BoxDecoration(
  color: CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  ),
  border: _kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(5)),
);

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.dragStartBehavior,
    this.expands,
    this.minLines,
    this.scrollPhysics,
    this.strutStyle,
    this.enableInteractiveSelection,
    this.scrollController,
    this.readOnly,
    this.showCursor,
    this.textAlignVertical,
    this.onTap,
    this.enableSuggestions,
    this.smartDashesType,
    this.smartQuotesType,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.obscuringCharacter,
    this.autofillHints,
    this.cursorHeight,
    this.restorationId,
    this.maxLengthEnforcement,
    this.selectionControls,
    this.enableIMEPersonalizedLearning,
    this.textDirection,
    this.clipBehavior,
    this.scribbleEnabled,
    this.contextMenuBuilder,
    this.onTapOutside,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.contentInsertionConfiguration,
    this.cursorOpacityAnimates,
    this.undoController,
  });

  final Key? widgetKey;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final bool? enableIMEPersonalizedLearning;
  final Clip? clipBehavior;
  final bool? scribbleEnabled;
  final double? cursorHeight;
  final String? restorationId;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final TextSelectionControls? selectionControls;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;

  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? autofocus;
  final bool? obscureText;
  final bool? autocorrect;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;

  final bool? enableInteractiveSelection;
  final DragStartBehavior? dragStartBehavior;
  final bool? expands;
  final int? minLines;
  final ScrollPhysics? scrollPhysics;
  final StrutStyle? strutStyle;
  final ScrollController? scrollController;
  final bool? readOnly;
  final bool? showCursor;
  final TextAlignVertical? textAlignVertical;
  final GestureTapCallback? onTap;
  final bool? enableSuggestions;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final ui.BoxHeightStyle? selectionHeightStyle;
  final ui.BoxWidthStyle? selectionWidthStyle;
  final String? obscuringCharacter;
  final Iterable<String>? autofillHints;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TapRegionCallback? onTapOutside;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final bool? cursorOpacityAnimates;
  final UndoHistoryController? undoController;
}

class MaterialTextFieldData extends _BaseData {
  MaterialTextFieldData({
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.keyboardType,
    super.textInputAction,
    super.textCapitalization,
    super.style,
    super.textAlign,
    super.textDirection,
    super.autofocus,
    super.obscureText,
    super.autocorrect,
    super.maxLines,
    super.maxLength,
    super.onChanged,
    super.onEditingComplete,
    super.onSubmitted,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth,
    super.cursorRadius,
    super.cursorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.enableInteractiveSelection,
    super.onTap,
    super.dragStartBehavior,
    super.expands,
    super.minLines,
    super.scrollPhysics,
    super.strutStyle,
    super.scrollController,
    super.readOnly,
    super.showCursor,
    super.textAlignVertical,
    super.enableSuggestions,
    super.smartDashesType,
    super.smartQuotesType,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.obscuringCharacter,
    super.autofillHints,
    super.cursorHeight,
    super.restorationId,
    super.maxLengthEnforcement,
    super.selectionControls,
    super.enableIMEPersonalizedLearning,
    super.clipBehavior,
    super.scribbleEnabled,
    super.contextMenuBuilder,
    super.onTapOutside,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.contentInsertionConfiguration,
    super.cursorOpacityAnimates,
    super.undoController,
    this.decoration,
    this.buildCounter,
    this.mouseCursor,
    this.onAppPrivateCommand,
    this.canRequestFocus,
    this.cursorErrorColor,
    this.onTapAlwaysCalled,
    this.statesController,
  });

  final InputDecoration? decoration;

  final InputCounterWidgetBuilder? buildCounter;
  final MouseCursor? mouseCursor;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final bool? canRequestFocus;
  final Color? cursorErrorColor;
  final bool? onTapAlwaysCalled;
  final MaterialStatesController? statesController;
}

class CupertinoTextFieldData extends _BaseData {
  CupertinoTextFieldData({
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.keyboardType,
    super.textInputAction,
    super.textCapitalization,
    super.style,
    super.textAlign,
    super.autofocus,
    super.obscureText,
    super.autocorrect,
    super.maxLines,
    super.maxLength,
    super.onChanged,
    super.onEditingComplete,
    super.onSubmitted,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth,
    super.cursorRadius,
    super.cursorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.dragStartBehavior,
    super.expands,
    super.minLines,
    super.scrollPhysics,
    super.strutStyle,
    super.enableInteractiveSelection,
    super.scrollController,
    super.readOnly,
    super.showCursor,
    super.textAlignVertical,
    super.onTap,
    super.enableSuggestions,
    super.smartDashesType,
    super.smartQuotesType,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.obscuringCharacter,
    super.autofillHints,
    super.cursorHeight,
    super.restorationId,
    super.maxLengthEnforcement,
    super.selectionControls,
    super.enableIMEPersonalizedLearning,
    super.textDirection,
    super.clipBehavior,
    super.scribbleEnabled,
    super.contextMenuBuilder,
    super.onTapOutside,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    this.decoration,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.suffix,
    this.suffixMode,
    this.clearButtonMode,
    this.clearButtonSemanticLabel,
  });

  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final Widget? prefix;
  final OverlayVisibilityMode? prefixMode;
  final Widget? suffix;
  final OverlayVisibilityMode? suffixMode;
  final OverlayVisibilityMode? clearButtonMode;
  final String? clearButtonSemanticLabel;
}

class FluentTextFieldData extends _BaseData {
  FluentTextFieldData({
    super.widgetKey,
    super.controller,
    super.focusNode,
    super.keyboardType,
    super.textInputAction,
    super.textCapitalization,
    super.style,
    super.textAlign,
    super.textDirection,
    super.autofocus,
    super.obscureText,
    super.autocorrect,
    super.maxLines,
    super.maxLength,
    super.onChanged,
    super.onEditingComplete,
    super.onSubmitted,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth,
    super.cursorRadius,
    super.cursorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.enableInteractiveSelection,
    super.onTap,
    super.dragStartBehavior,
    super.expands,
    super.minLines,
    super.scrollPhysics,
    super.strutStyle,
    super.scrollController,
    super.readOnly,
    super.showCursor,
    super.textAlignVertical,
    super.enableSuggestions,
    super.smartDashesType,
    super.smartQuotesType,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.obscuringCharacter,
    super.autofillHints,
    super.cursorHeight,
    super.restorationId,
    super.maxLengthEnforcement,
    super.selectionControls,
    super.enableIMEPersonalizedLearning,
    super.clipBehavior,
    super.scribbleEnabled,
    super.contextMenuBuilder,
    super.onTapOutside,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.contentInsertionConfiguration,
    super.cursorOpacityAnimates,
    super.undoController,
    this.decoration,
  });

  final BoxDecoration? decoration;
}

class PlatformTextField extends PlatformWidgetBase<
    TextField,
    CupertinoTextField,
    TextBox,
    CupertinoTextField,
    TextField,
    TextField,
    TextField> {
  final Key? widgetKey;

  final PlatformBuilder<MaterialTextFieldData>? material;
  final PlatformBuilder<CupertinoTextFieldData>? cupertino;
  final PlatformBuilder<FluentTextFieldData>? windows;
  final PlatformBuilder<CupertinoTextFieldData>? macos;
  final PlatformBuilder<MaterialTextFieldData>? linux;
  final PlatformBuilder<MaterialTextFieldData>? fuchsia;
  final PlatformBuilder<MaterialTextFieldData>? web;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;

  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? autofocus;
  final bool? obscureText;
  final bool? autocorrect;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? cursorWidth;
  final Radius? cursorRadius;
  final DragStartBehavior? dragStartBehavior;
  final bool? expands;
  final int? minLines;
  final ScrollPhysics? scrollPhysics;
  final StrutStyle? strutStyle;
  final bool? enableInteractiveSelection;
  final ScrollController? scrollController;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final bool? showCursor;
  final TextAlignVertical? textAlignVertical;

  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;

  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final ui.BoxHeightStyle? selectionHeightStyle;
  final ui.BoxWidthStyle? selectionWidthStyle;

  final String? obscuringCharacter;
  final Iterable<String>? autofillHints;

  final double? cursorHeight;
  final String? restorationId;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final TextSelectionControls? selectionControls;
  final bool makeCupertinoDecorationNull;
  final String? hintText;
  final bool? enableIMEPersonalizedLearning;
  final Clip clipBehavior;
  final bool scribbleEnabled;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TapRegionCallback? onTapOutside;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final bool? cursorOpacityAnimates;
  final UndoHistoryController? undoController;

  static Widget _defaultMaterialContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) =>
      AdaptiveTextSelectionToolbar.editableText(
        editableTextState: editableTextState,
      );

  static Widget _defaultCupertinoContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) =>
      CupertinoAdaptiveTextSelectionToolbar.editableText(
        editableTextState: editableTextState,
      );

  static Widget _defaultFluentContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) =>
      FluentTextSelectionToolbar.editableText(
        editableTextState: editableTextState,
      );

  const PlatformTextField({
    super.key,
    this.widgetKey,
    this.controller,
    this.focusNode,
    TextInputType? keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.textAlign,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.dragStartBehavior,
    this.minLines,
    this.expands,
    this.scrollPhysics,
    this.strutStyle,
    this.enableInteractiveSelection,
    this.scrollController,
    this.onTap,
    this.readOnly,
    this.showCursor,
    this.textAlignVertical,
    this.smartDashesType,
    this.smartQuotesType,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.obscuringCharacter,
    this.autofillHints,
    this.cursorHeight,
    this.restorationId,
    this.maxLengthEnforcement,
    this.selectionControls,
    this.hintText,
    this.enableIMEPersonalizedLearning,
    this.makeCupertinoDecorationNull = false,
    this.clipBehavior = Clip.hardEdge,
    this.scribbleEnabled = true,
    this.contextMenuBuilder,
    this.onTapOutside,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.contentInsertionConfiguration,
    this.cursorOpacityAnimates,
    this.undoController,
    this.material,
    this.cupertino,
    this.windows,
    this.macos,
    this.linux,
    this.fuchsia,
    this.web,
  }) : keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline);

  @override
  TextField createMaterialWidget(BuildContext context) {
    final data = material?.call(context, platform(context));

    final hintText = this.hintText;
    final decoration = hintText == null
        ? (data?.decoration ?? const InputDecoration())
        : _inputDecorationWithHint(
            hintText,
            data?.decoration ?? const InputDecoration(),
          );

    return TextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect ?? true,
      autofocus: data?.autofocus ?? autofocus ?? false,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor,
      cursorRadius: data?.cursorRadius ?? cursorRadius,
      cursorWidth: data?.cursorWidth ?? cursorWidth ?? 2.0,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText ?? false,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding:
          data?.scrollPadding ?? scrollPadding ?? const EdgeInsets.all(20),
      style: data?.style ?? style,
      textAlign: data?.textAlign ?? textAlign ?? TextAlign.start,
      textCapitalization: data?.textCapitalization ??
          textCapitalization ??
          TextCapitalization.none,
      textInputAction: data?.textInputAction ?? textInputAction,
      decoration: decoration,
      textDirection: data?.textDirection,
      buildCounter: data?.buildCounter,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      expands: data?.expands ?? expands ?? false,
      minLines: data?.minLines ?? minLines,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      strutStyle: data?.strutStyle ?? strutStyle,
      enableInteractiveSelection: data?.enableInteractiveSelection ??
          enableInteractiveSelection ??
          true,
      scrollController: data?.scrollController ?? scrollController,
      onTap: data?.onTap ?? onTap,
      readOnly: data?.readOnly ?? readOnly ?? false,
      showCursor: data?.showCursor ?? showCursor,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      enableSuggestions: data?.enableSuggestions ?? true,
      smartQuotesType: data?.smartQuotesType ?? smartQuotesType,
      smartDashesType: data?.smartDashesType ?? smartDashesType,
      selectionHeightStyle: data?.selectionHeightStyle ??
          selectionHeightStyle ??
          ui.BoxHeightStyle.tight,
      selectionWidthStyle: data?.selectionWidthStyle ??
          selectionWidthStyle ??
          ui.BoxWidthStyle.tight,
      obscuringCharacter: data?.obscuringCharacter ?? obscuringCharacter ?? '•',
      autofillHints: data?.autofillHints ?? autofillHints,
      mouseCursor: data?.mouseCursor ?? MouseCursor.defer,
      onAppPrivateCommand: data?.onAppPrivateCommand,
      cursorHeight: data?.cursorHeight ?? cursorHeight,
      restorationId: data?.restorationId ?? restorationId,
      maxLengthEnforcement: data?.maxLengthEnforcement ?? maxLengthEnforcement,
      selectionControls: data?.selectionControls ?? selectionControls,
      enableIMEPersonalizedLearning: data?.enableIMEPersonalizedLearning ??
          enableIMEPersonalizedLearning ??
          true,
      clipBehavior: data?.clipBehavior ?? clipBehavior,
      scribbleEnabled: data?.scribbleEnabled ?? scribbleEnabled,
      contextMenuBuilder: data?.contextMenuBuilder ??
          contextMenuBuilder ??
          _defaultMaterialContextMenuBuilder,
      onTapOutside: data?.onTapOutside ?? onTapOutside,
      spellCheckConfiguration:
          data?.spellCheckConfiguration ?? spellCheckConfiguration,
      magnifierConfiguration:
          data?.magnifierConfiguration ?? magnifierConfiguration,
      canRequestFocus: data?.canRequestFocus ?? true,
      contentInsertionConfiguration:
          data?.contentInsertionConfiguration ?? contentInsertionConfiguration,
      cursorOpacityAnimates:
          data?.cursorOpacityAnimates ?? cursorOpacityAnimates,
      undoController: data?.undoController ?? undoController,
      cursorErrorColor: data?.cursorErrorColor,
      onTapAlwaysCalled: data?.onTapAlwaysCalled ?? false,
      statesController: data?.statesController,
      // toolbarOptions: Deprecated
    );
  }

  @override
  CupertinoTextField createCupertinoWidget(BuildContext context) {
    final data = cupertino?.call(context, platform(context));

    return CupertinoTextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect ?? true,
      autofocus: data?.autofocus ?? autofocus ?? false,
      controller: data?.controller ?? controller,
      cursorColor:
          data?.cursorColor ?? cursorColor ?? CupertinoColors.activeBlue,
      cursorRadius:
          data?.cursorRadius ?? cursorRadius ?? const Radius.circular(2),
      cursorWidth: data?.cursorWidth ?? cursorWidth ?? 2.0,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText ?? false,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding:
          data?.scrollPadding ?? scrollPadding ?? const EdgeInsets.all(20),
      style: data?.style ?? style,
      textAlign: data?.textAlign ?? textAlign ?? TextAlign.start,
      textCapitalization: data?.textCapitalization ??
          textCapitalization ??
          TextCapitalization.none,
      textInputAction: data?.textInputAction ?? textInputAction,
      decoration: data?.decoration ??
          (makeCupertinoDecorationNull
              ? null
              : kDefaultRoundedBorderDecoration),
      clearButtonMode: data?.clearButtonMode ?? OverlayVisibilityMode.never,
      padding: data?.padding ?? const EdgeInsets.all(6),
      placeholder: data?.placeholder ?? hintText,
      placeholderStyle: data?.placeholderStyle ??
          const TextStyle(
            fontWeight: FontWeight.w400,
            color: CupertinoColors.placeholderText,
          ),
      prefix: data?.prefix,
      prefixMode: data?.prefixMode ?? OverlayVisibilityMode.always,
      suffix: data?.suffix,
      suffixMode: data?.suffixMode ?? OverlayVisibilityMode.always,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      expands: data?.expands ?? expands ?? false,
      minLines: data?.minLines ?? minLines,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      strutStyle: data?.strutStyle ?? strutStyle,
      enableInteractiveSelection: data?.enableInteractiveSelection ??
          enableInteractiveSelection ??
          true,
      scrollController: data?.scrollController ?? scrollController,
      onTap: data?.onTap ?? onTap,
      readOnly: data?.readOnly ?? readOnly ?? false,
      showCursor: data?.showCursor ?? showCursor,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      enableSuggestions: data?.enableSuggestions ?? true,
      smartQuotesType: data?.smartQuotesType ?? smartQuotesType,
      smartDashesType: data?.smartDashesType ?? smartDashesType,
      selectionHeightStyle: data?.selectionHeightStyle ??
          selectionHeightStyle ??
          ui.BoxHeightStyle.tight,
      selectionWidthStyle: data?.selectionWidthStyle ??
          selectionWidthStyle ??
          ui.BoxWidthStyle.tight,
      obscuringCharacter: data?.obscuringCharacter ?? obscuringCharacter ?? '•',
      autofillHints: data?.autofillHints ?? autofillHints,
      cursorHeight: data?.cursorHeight ?? cursorHeight,
      restorationId: data?.restorationId ?? restorationId,
      maxLengthEnforcement: data?.maxLengthEnforcement ?? maxLengthEnforcement,
      selectionControls: data?.selectionControls ?? selectionControls,
      enableIMEPersonalizedLearning: data?.enableIMEPersonalizedLearning ??
          enableIMEPersonalizedLearning ??
          true,
      textDirection: data?.textDirection,
      clipBehavior: data?.clipBehavior ?? clipBehavior,
      scribbleEnabled: data?.scribbleEnabled ?? scribbleEnabled,
      contextMenuBuilder: data?.contextMenuBuilder ??
          contextMenuBuilder ??
          _defaultCupertinoContextMenuBuilder,
      onTapOutside: data?.onTapOutside ?? onTapOutside,
      spellCheckConfiguration:
          data?.spellCheckConfiguration ?? spellCheckConfiguration,
      magnifierConfiguration:
          data?.magnifierConfiguration ?? magnifierConfiguration,
      contentInsertionConfiguration:
          data?.contentInsertionConfiguration ?? contentInsertionConfiguration,
      cursorOpacityAnimates:
          data?.cursorOpacityAnimates ?? cursorOpacityAnimates ?? true,
      undoController: data?.undoController ?? undoController,
      clearButtonSemanticLabel: data?.clearButtonSemanticLabel,
      // toolbarOptions: Deprecated
    );
  }

  @override
  TextBox createWindowsWidget(BuildContext context) {
    final data = windows?.call(context, platform(context));

    return TextBox(
      key: data?.widgetKey ?? widgetKey,
      placeholder: hintText,
      autocorrect: data?.autocorrect ?? autocorrect ?? true,
      autofocus: data?.autofocus ?? autofocus ?? false,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor,
      cursorRadius:
          data?.cursorRadius ?? cursorRadius ?? const Radius.circular(2),
      cursorWidth: data?.cursorWidth ?? cursorWidth ?? 2.0,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText ?? false,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding:
          data?.scrollPadding ?? scrollPadding ?? const EdgeInsets.all(20),
      style: data?.style ?? style,
      textAlign: data?.textAlign ?? textAlign ?? TextAlign.start,
      textCapitalization: data?.textCapitalization ??
          textCapitalization ??
          TextCapitalization.none,
      textInputAction: data?.textInputAction ?? textInputAction,
      decoration: WidgetStateProperty.all(data!.decoration!),
      textDirection: data?.textDirection,
      dragStartBehavior: data?.dragStartBehavior ??
          dragStartBehavior ??
          DragStartBehavior.start,
      expands: data?.expands ?? expands ?? false,
      minLines: data?.minLines ?? minLines,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      strutStyle: data?.strutStyle ?? strutStyle,
      enableInteractiveSelection: data?.enableInteractiveSelection ??
          enableInteractiveSelection ??
          true,
      scrollController: data?.scrollController ?? scrollController,
      onTap: data?.onTap ?? onTap,
      readOnly: data?.readOnly ?? readOnly ?? false,
      showCursor: data?.showCursor ?? showCursor,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      enableSuggestions: data?.enableSuggestions ?? true,
      smartQuotesType: data?.smartQuotesType ?? smartQuotesType,
      smartDashesType: data?.smartDashesType ?? smartDashesType,
      selectionHeightStyle: data?.selectionHeightStyle ??
          selectionHeightStyle ??
          ui.BoxHeightStyle.tight,
      selectionWidthStyle: data?.selectionWidthStyle ??
          selectionWidthStyle ??
          ui.BoxWidthStyle.tight,
      obscuringCharacter: data?.obscuringCharacter ?? obscuringCharacter ?? '•',
      autofillHints: data?.autofillHints ?? autofillHints,
      cursorHeight: data?.cursorHeight ?? cursorHeight,
      restorationId: data?.restorationId ?? restorationId,
      maxLengthEnforcement: data?.maxLengthEnforcement ?? maxLengthEnforcement,
      selectionControls: data?.selectionControls ?? selectionControls,
      enableIMEPersonalizedLearning: data?.enableIMEPersonalizedLearning ??
          enableIMEPersonalizedLearning ??
          true,
      clipBehavior: data?.clipBehavior ?? clipBehavior,
      scribbleEnabled: data?.scribbleEnabled ?? scribbleEnabled,
      contextMenuBuilder: data?.contextMenuBuilder ??
          contextMenuBuilder ??
          _defaultFluentContextMenuBuilder,
      onTapOutside: data?.onTapOutside ?? onTapOutside,
      spellCheckConfiguration:
          data?.spellCheckConfiguration ?? spellCheckConfiguration,
      magnifierConfiguration:
          data?.magnifierConfiguration ?? magnifierConfiguration,
    );
  }

  //Todo(mehul): change themes here
  @override
  CupertinoTextField createMacosWidget(BuildContext context) =>
      createCupertinoWidget(context);

  @override
  TextField createLinuxWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  TextField createFuchsiaWidget(BuildContext context) =>
      createMaterialWidget(context);

  @override
  TextField createWebWidget(BuildContext context) =>
      createMaterialWidget(context);

  InputDecoration _inputDecorationWithHint(
    String hintText,
    InputDecoration inputDecoration,
  ) {
    return inputDecoration.copyWith(
      hintText: inputDecoration.hintText ?? hintText,
    );
  }
}
