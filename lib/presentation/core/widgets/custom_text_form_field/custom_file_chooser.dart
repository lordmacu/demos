import 'dart:io';
import 'dart:typed_data';

import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:intl/intl.dart';

class CustomFileChooser extends StatefulWidget {
  /// TextEditingController for the TextFormField inside the file choose
  final TextEditingController fileController;

  final List<String> extensions;

  /// Initial value to be shown when no date is entered. Also, it is the value of the label
  final String initialValue;

  /// Callback function, called when a file is picked, the parameter is the new file object that was selected
  final Function(File) onChanged;

  const CustomFileChooser(
      {Key key,
      this.fileController,
      this.initialValue,
      this.onChanged,
      this.extensions})
      : super(key: key);
  @override
  _CustomFileChooser createState() =>
      _CustomFileChooser(fileController, initialValue, onChanged);
}

class _CustomFileChooser extends State<CustomFileChooser> {
  final TextEditingController fileController;
  bool showLabel;
  final String initialValue;
  final Function(File) onChanged;

  _CustomFileChooser(this.fileController, this.initialValue, this.onChanged);

  File selectedFile;
  @override
  void initState() {
    super.initState();
    showLabel = false;
    fileController.text = initialValue;
  }

  Future<void> _selectFile(BuildContext context) async {
    print("SelectFile");
    int maxSize = 20 * 1024 * 1024;
    File file = await FilePicker.getFile(
        type: FileType.custom, allowedExtensions: widget.extensions);
    int size = await file.length();
    print(size);
    if (file != null && file != selectedFile && size < maxSize) {
      setState(() {
        selectedFile = file;
        showLabel = true;
        onChanged(selectedFile);
      });
      fileController.value =
          fileController.value.copyWith(text: file.path.split("/").last);
    } else {
      print("ERROR SELECTING FILE");
      ToastHelper.createError(message: S.of(context).fileTooBig).show(context);
    }
  }

  _removeFile(BuildContext context) {
    setState(() {
      selectedFile = File.fromRawPath(Uint8List.fromList([0]));
      showLabel = false;
      onChanged(selectedFile);
      fileController.text = initialValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(showLabel ? initialValue : " ", style: AppTextStyles.normal4),
        Container(
            padding: EdgeInsets.only(right: AppDimens.layoutMarginS),
            decoration: BoxDecoration(
                color: AppColors.inputColor,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: AppColors.g10Color,
                )),
            child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () async {
                showLabel ? _removeFile(context) : _selectFile(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      style: AppTextStyles.normal4.copyWith(
                          backgroundColor: Colors.transparent,
                          color: showLabel
                              ? AppColors.g90Color
                              : AppColors.g25Color),
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      readOnly: true,
                      enabled: false,
                      controller: fileController,
                    ),
                  ),
                  Icon(showLabel
                      ? Icons.remove_circle_outline
                      : Icons.attach_file),
                ],
              ),
            )),
      ],
    );
  }
}
