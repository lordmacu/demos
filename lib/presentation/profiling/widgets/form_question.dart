import 'package:flutter/material.dart';
import 'package:ualet/domain/profiling/profiling_form_option/profiling_form_option.dart';
import 'package:ualet/domain/profiling/profiling_option.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class FormQuestionRadio extends StatefulWidget {
  final ProfilingFormOption option;
  final Function(
          String optionId, String isValueCheck, String valueFieldObservation)
      action;
  const FormQuestionRadio({
    Key key,
    @required this.option,
    @required this.action
  });
  @override
  _FormQuestionRadioState createState() => _FormQuestionRadioState();
}

class _FormQuestionRadioState extends State<FormQuestionRadio> {
  String radioItem = '';

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: AppDimens.layoutSpacerM,
        ),
        Text(widget.option.description,
            style: AppTextStyles.subtitle4.copyWith(
                color: AppColors.g50Color,
                fontSize: AppDimens.subtitleTextSize)),
        const SizedBox(
          height: AppDimens.layoutSpacerS,
        ),
        if (widget.option.typeInput == ProfilingFormOption.RADIO) ...[
          _radioButton()
        ],
        if (radioItem == 'Si') ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.option.descriptionObservation,
              style: AppTextStyles.normal4.copyWith(color: AppColors.g50Color),
            ),
          ),
          const SizedBox(
            height: AppDimens.layoutSpacerS,
          ),
          TextField(
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            onChanged: (value) =>
                {widget.action('', radioItem, value)},
            decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(20),
                hintText: widget.option.hintTextObservation),
          ),
          const SizedBox(
            height: AppDimens.layoutSpacerL,
          ),
        ],
      ],
    );
  }

  Widget _radioButton() {
    return Column(
      children: <Widget>[
        RadioListTile(
          groupValue: radioItem,
          title: Text('No'),
          value: 'No',
          onChanged: (val) {
            setState(() {
              radioItem = val;
              widget.action('', val, '');
            });
          },
        ),
        RadioListTile(
          groupValue: radioItem,
          title: Text('Si'),
          value: 'Si',
          onChanged: (val) {
            setState(() {
              radioItem = val;
              widget.action('', val, '');
            });
          },
        ),
      ],
    );
  }
}
