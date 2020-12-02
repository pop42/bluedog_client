import 'package:bluedog_client/common/theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide required;
import 'package:flutter/services.dart';
import 'package:quiver/strings.dart';

class DecoratedTextFormField extends StatefulWidget {
  final String label;
  final String placeholder;
  final String helperText;
  final String originalValue;
  final String currentValue;
  final bool required;
  final bool disabled;
  final bool obscureText;
  final bool autofocus;
  final bool autocorrect;
  final AutovalidateMode autovalidateMode;
  final bool enableSuggestions;
  final bool hideInputBorder;
  final int maxLines;
  final int errorMaxLines;
  final Widget prefix;
  final Widget suffix;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldValidator<String> validator;
  final Function onChanged;
  final GestureTapCallback onTap;
  final ValueChanged<String> onFieldSubmitted;
  final EdgeInsetsGeometry padding;

  DecoratedTextFormField({
    Key key,
    this.label,
    this.placeholder,
    this.helperText,
    this.originalValue,
    this.required = false,
    this.disabled = false,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enableSuggestions = false,
    this.hideInputBorder = false,
    this.maxLines = 1,
    this.errorMaxLines = 1,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.padding = Styles.formFieldPadding,
    this.currentValue,
  })  : assert(required != null),
        assert(disabled != null),
        assert(obscureText != null),
        assert(autofocus != null),
        assert(autocorrect != null),
        assert(autovalidateMode != null),
        assert(enableSuggestions != null),
        assert(hideInputBorder != null),
        super(key: key);

  @override
  DecoratedTextFormFieldState createState() {
    return DecoratedTextFormFieldState(originalValue);
  }
}

class DecoratedTextFormFieldState extends State<DecoratedTextFormField> {
  final GlobalKey<FormFieldState<String>> _fieldKey = GlobalKey();
  final TextEditingController _fieldController;

  DecoratedTextFormFieldState(String originalValue)
      : _fieldController = TextEditingController(text: originalValue);

  @override
  void initState() {
    super.initState();

    _fieldController.addListener(onFieldValueChanged);
    widget.focusNode?.addListener(_onFocusLost);
  }

  @override
  void didUpdateWidget(DecoratedTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentValue != widget.currentValue &&
        _fieldController.text != widget.currentValue) {
      _overrideCurrentValue(widget.currentValue);
    }
  }

  Future<void> _overrideCurrentValue(String value) async {
    // Can't set the field controller's value during the build, so we have to do it asynchronously.
    // Just waiting a nominal amount of time so that the build can complete synchronously.
    await Future.delayed(Duration(milliseconds: 1));
    _fieldController.value = TextEditingValue(
      text: widget.currentValue,
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: widget.currentValue.length,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fieldController?.removeListener(onFieldValueChanged);
    widget.focusNode?.removeListener(_onFocusLost);

    super.dispose();
  }

  String get value => _fieldKey.currentState.value;

  String get originalValueAsString => widget.originalValue;

  void onFieldValueChanged() {
    setState(() {
      if (widget.onChanged != null) {
        widget.onChanged(_fieldController.text);
      }
    });
  }

  void _onFocusLost() {
    if (widget.focusNode != null && !widget.focusNode.hasFocus) {
      !_fieldKey.currentState.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        key: _fieldKey,
        controller: _fieldController,
        enabled: !widget.disabled,
        readOnly: widget.disabled,
        obscureText: widget.obscureText,
        autofocus: widget.autofocus,
        autocorrect: widget.autocorrect,
        autovalidateMode: widget.autovalidateMode,
        enableSuggestions: widget.enableSuggestions,
        minLines: 1,
        maxLines: widget.maxLines,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters ?? <TextInputFormatter>[],
        validator: (value) {
          if (widget.required) {
            if (isBlank(value)) {
              return 'Value is required'; // TODO: I10N
            } else if (widget.validator != null) {
              return widget.validator(value);
            }
          }
          return widget.validator?.call(value);
        },
        onTap: widget.onTap,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          labelText: isNotBlank(widget.label)
              ? (widget.required
                  ? '${widget.label} *' // TODO: I10N
                  : widget.label)
              : null,
          hintText: widget.placeholder,
          helperText: widget.helperText,
          errorMaxLines: widget.errorMaxLines,
          enabled: !widget.disabled,
          prefix: widget.prefix,
          suffix: widget.suffix,
          border: widget.hideInputBorder == true ? InputBorder.none : null,
        ),
      ),
    );
  }
}
