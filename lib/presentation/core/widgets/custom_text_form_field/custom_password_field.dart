// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

export 'package:flutter/services.dart' show SmartQuotesType, SmartDashesType;

class CustomPasswordField extends FormField<String> {
  CustomPasswordField(
      {Key key,
      this.controller,
      String initialValue,
      FocusNode focusNode,
      InputDecoration decoration = const InputDecoration(),
      TextInputType keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextInputAction textInputAction,
      TextStyle style,
      StrutStyle strutStyle,
      TextDirection textDirection,
      TextAlign textAlign = TextAlign.start,
      TextAlignVertical textAlignVertical,
      bool autofocus = false,
      bool readOnly = false,
      ToolbarOptions toolbarOptions,
      bool showCursor,
      String obscuringCharacter = '•',
      bool obscureText = false,
      bool autocorrect = true,
      SmartDashesType smartDashesType,
      SmartQuotesType smartQuotesType,
      bool enableSuggestions = true,
      AutovalidateMode autovalidate = AutovalidateMode.disabled,
      bool maxLengthEnforced = true,
      int maxLines = 1,
      int minLines,
      bool expands = false,
      int maxLength,
      ValueChanged<String> onChanged,
      GestureTapCallback onTap,
      VoidCallback onEditingComplete,
      ValueChanged<String> onFieldSubmitted,
      FormFieldSetter<String> onSaved,
      FormFieldValidator<String> validator,
      List<TextInputFormatter> inputFormatters,
      bool enabled,
      double cursorWidth = 2.0,
      Radius cursorRadius,
      Color cursorColor,
      Brightness keyboardAppearance,
      EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
      bool enableInteractiveSelection = true,
      InputCounterWidgetBuilder buildCounter,
      ScrollPhysics scrollPhysics,
      double sizeIcon = 20.0,
      bool enableFloatingLabel = true})
      : assert(initialValue == null || controller == null),
        assert(textAlign != null),
        assert(autofocus != null),
        assert(readOnly != null),
        assert(obscuringCharacter != null && obscuringCharacter.length == 1),
        assert(obscureText != null),
        assert(autocorrect != null),
        assert(enableSuggestions != null),
        assert(autovalidate != null),
        assert(maxLengthEnforced != null),
        assert(scrollPadding != null),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(expands != null),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null || maxLength > 0),
        assert(enableInteractiveSelection != null),
        super(
          key: key,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate,
          enabled: enabled ?? decoration?.enabled ?? true,
          builder: (FormFieldState<String> field) {
            final _CustomPasswordFieldState state =
                field as _CustomPasswordFieldState;
            final InputDecoration effectiveDecoration = (decoration ??
                    const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (enableFloatingLabel == true) ...[
                  Padding(
                    padding: const EdgeInsets.all(AppDimens.layoutSpacerXs),
                    child: Text(
                      state._effectiveController?.text?.isEmpty == true
                          ? ''
                          : decoration?.hintText,
                      style: AppTextStyles.normal4
                          .copyWith(color: AppColors.g75Color),
                    ),
                  )
                ],
                TextField(
                  controller: state._effectiveController,
                  focusNode: focusNode,
                  decoration: effectiveDecoration.copyWith(
                      errorText: field.errorText,
                      suffixIcon: GestureDetector(
                          onTap: () => state.handleObscureChange(),
                          child: Icon(
                            state._obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                            size: sizeIcon,
                          ))),
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  style: style,
                  strutStyle: strutStyle,
                  textAlign: textAlign,
                  textAlignVertical: textAlignVertical,
                  textDirection: textDirection,
                  textCapitalization: textCapitalization,
                  autofocus: autofocus,
                  toolbarOptions: toolbarOptions,
                  readOnly: readOnly,
                  showCursor: showCursor,
                  obscureText: state._obscureText,
                  autocorrect: autocorrect,
                  smartDashesType: smartDashesType ??
                      (state._obscureText
                          ? SmartDashesType.disabled
                          : SmartDashesType.enabled),
                  smartQuotesType: smartQuotesType ??
                      (state._obscureText
                          ? SmartQuotesType.disabled
                          : SmartQuotesType.enabled),
                  enableSuggestions: enableSuggestions,
                  maxLengthEnforced: maxLengthEnforced,
                  maxLines: maxLines,
                  minLines: minLines,
                  expands: expands,
                  maxLength: maxLength,
                  onChanged: onChangedHandler,
                  onTap: onTap,
                  onEditingComplete: onEditingComplete,
                  onSubmitted: onFieldSubmitted,
                  inputFormatters: inputFormatters,
                  enabled: enabled ?? decoration?.enabled ?? true,
                  cursorWidth: cursorWidth,
                  cursorRadius: cursorRadius,
                  cursorColor: cursorColor,
                  scrollPadding: scrollPadding,
                  scrollPhysics: scrollPhysics,
                  keyboardAppearance: keyboardAppearance,
                  enableInteractiveSelection: enableInteractiveSelection,
                  buildCounter: buildCounter,
                ),
              ],
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController controller;

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends FormFieldState<String> {
  TextEditingController _controller;
  bool _obscureText;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  void handleObscureChange() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  CustomPasswordField get widget => super.widget as CustomPasswordField;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller.addListener(_handleControllerChanged);
    }
    _obscureText = true;
  }

  @override
  void didUpdateWidget(CustomPasswordField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null)
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      if (widget.controller != null) {
        setValue(widget.controller.text);
        if (oldWidget.controller == null) _controller = null;
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didChange(String value) {
    super.didChange(value);

    if (_effectiveController.text != value) _effectiveController.text = value;
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue;
    });
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);
  }
}
