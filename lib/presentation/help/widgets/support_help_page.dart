import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/router/router.gr.dart';

class SupportHelpPage extends StatefulWidget {
  final List items;
  final String name;

  SupportHelpPage({Key key, @required this.items, @required this.name})
      : super(key: key);

  @override
  _SupportHelpPageState createState() => _SupportHelpPageState();
}

class _SupportHelpPageState extends State<SupportHelpPage> {
  List isSelected = new List<bool>();
  @override
  void initState() {
    //Remplaza {{nombre}} con nada ya que en el preference no hay info del usuario
    for (int i = 0; i < widget.items.length; i++) {
      if (widget.name.length > 0) {
        widget.items[i][0]["ContentDetail"] =
            widget.items[i][0]["ContentDetail"].replaceAll("{{nombre}}",
                "${widget.name[0]}${widget.name.substring(1).toLowerCase()}");
      } else {
        widget.items[i][0]["ContentDetail"] = widget.items[i][0]
                ["ContentDetail"]
            .replaceAll("{{nombre}}", "querido usuario");
      }
      isSelected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        accentColor: AppColors.g50Color,
        unselectedWidgetColor: AppColors.g50Color);
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.1),
              offset: Offset(0, 4),
              spreadRadius: 0.5,
              blurRadius: 8.0)
        ],
      ),
      height: 400,
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              getIt<IFireBaseEventLogger>()
                  .helpSupport(widget.items[index][0]["Title"].toString());

              ExtendedNavigator.rootNavigator.pushNamed(
                Routes.helpSupportFormPage,
                arguments: HelpSupportFormPageArguments(
                    topic: widget.items[index][0]["Title"]),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        "${widget.items[index][0]["Title"]}",
                        textAlign: TextAlign.left,
                        style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
