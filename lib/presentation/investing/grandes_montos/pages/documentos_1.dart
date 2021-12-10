import 'dart:io';
import 'dart:math';

import 'package:ualet/application/investing_grandes_montos/data/grandes_montos_data_bloc.dart';
import 'package:ualet/domain/sarlaft/required_file_item.dart';
import 'package:ualet/domain/sarlaft/file_response_item.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/presentation/core/misc/toast_helper.dart';
import 'package:ualet/presentation/core/widgets/custom_text_form_field/custom_file_chooser.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;

class Documentos1 extends StatefulWidget {
  final GrandesMontosDataBloc dataBloc;

  const Documentos1({Key key, this.dataBloc}) : super(key: key);

  @override
  _Documentos1State createState() => _Documentos1State();
}

class _Documentos1State extends State<Documentos1> {
  TextEditingController _ccController = TextEditingController();
  TextEditingController _rentaController = TextEditingController();
  TextEditingController _certLaboralController = TextEditingController();
  TextEditingController _certIngresosController = TextEditingController();

  getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //Title
      SizedBox(
        height: AppDimens.layoutSpacerL,
      ),
      Text(S.of(context).attachDocuments,
          style: AppTextStyles.title2.copyWith(color: AppColors.g25Color),
          textAlign: TextAlign.right),
      SizedBox(
        height: AppDimens.layoutSpacerL,
      ),
      SizedBox(
        height: AppDimens.layoutSpacerS,
      ),
      //Subtitle
      Container(
        padding: EdgeInsets.only(right: AppDimens.layoutMarginM),
        child: Text(
          S.of(context).attachDocumentsSubtitle,
          style: AppTextStyles.normal4,
          textAlign: TextAlign.start,
        ),
      ),
      //Subtitle 2
      SizedBox(
        height: AppDimens.layoutSpacerS,
      ),
      Container(
        padding: EdgeInsets.only(right: AppDimens.layoutMarginM),
        child: Text(
          S.of(context).attatchDocsFormats,
          style: AppTextStyles.normal4,
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: AppDimens.layoutSpacerS,
      ),
      Container(
        padding: EdgeInsets.only(right: AppDimens.layoutMarginM),
        child: Text(
          "${S.of(context).attatchDocsSize} ${widget.dataBloc.state.requiredFiles.first.maxSizeKB / 1000} MB",
          style: AppTextStyles.normal4,
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: AppDimens.layoutSpacerL,
      ),
      // //CC
      // _customFilePicker(
      //     context,
      //     _ccController,
      //     S.of(context).idColombia,
      //     (file) =>
      //         widget.dataBloc.add(GrandesMontosDataEvent.updateCcFile(file))),
      // SizedBox(
      //   height: AppDimens.layoutSpacerHeader,
      // ),
      // //renta
      // _customFilePicker(
      //     context,
      //     _rentaController,
      //     S.of(context).rentDeclaration,
      //     (file) => widget.dataBloc
      //         .add(GrandesMontosDataEvent.updateDeclaracionRenta(file))),
      // SizedBox(
      //   height: AppDimens.layoutSpacerHeader,
      // ),
      // //laboral
      // _customFilePicker(
      //     context,
      //     _certLaboralController,
      //     S.of(context).workCertification,
      //     (file) => widget.dataBloc
      //         .add(GrandesMontosDataEvent.updateCertLaboral(file))),
      // SizedBox(
      //   height: AppDimens.layoutSpacerHeader,
      // ),
      // //Cert Ingresos
      // _customFilePicker(
      //     context,
      //     _certIngresosController,
      //     S.of(context).incomeCertification,
      //     (file) => widget.dataBloc
      //         .add(GrandesMontosDataEvent.updateCertIngresos(file))),
      // SizedBox(
      //   height: AppDimens.layoutSpacerHeader,
      // ),
      _filesList(context),
    ]);
  }

  Widget _customFilePicker(
      BuildContext context,
      TextEditingController controller,
      String label,
      Function(File) onChanged) {
    return CustomFileChooser(
      extensions: ['pdf', 'png', 'jpg', 'jpeg'],
      fileController: controller,
      initialValue: label,
      onChanged: onChanged,
    );
  }

  _filesList(BuildContext context) {
    List<Widget> rows = [];
    for (var req in widget.dataBloc.state.requiredFiles) {
      rows.add(_customFilePicker(context, TextEditingController(), req.name,
          (file) async {
        if (file != null && file.path != '') {
          print("FILEEEE added");
          final extension = p.extension(file.path); // '.dart'
          List<String> values = [".jpg", ".jpeg", ".pdf", ".png"];

          var fileSize = await getFileSize(file.path, 1);
          var required=widget.dataBloc.state.requiredFiles.first.maxSizeKB / 1000;
          if(fileSize < required){

            if(values.contains(extension)){
              var resFile = FileResponseItem(file: file, id: req.id);
              widget.dataBloc.add(GrandesMontosDataEvent.setResponseFile(resFile));
            }else{
              ToastHelper.createError(
                  message: S.of(context).errorExtension).show(context);
              widget.dataBloc.add(GrandesMontosDataEvent.deleteFile(req.id));
            }

          }else{

            ToastHelper.createError(
                message: S.of(context).errorSize).show(context);
            widget.dataBloc.add(GrandesMontosDataEvent.deleteFile(req.id));
          }

        } else {
          print("FILEEEE deleted");
          print(file);
          widget.dataBloc.add(GrandesMontosDataEvent.deleteFile(req.id));
        }
      }));
      rows.add(
        SizedBox(
          height: AppDimens.layoutSpacerHeader,
        ),
      );
    }
    return Column(
      children: rows,
    );
  }
}
