import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger_mx.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/presentation/profile/widgets/expandable.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class FAQProfilePage extends StatefulWidget {
  final List items;
  final String name;
  final String namePage;

  FAQProfilePage(
      {Key key, @required this.items, @required this.name, this.namePage})
      : super(key: key);

  @override
  _FAQProfilePageState createState() => _FAQProfilePageState();
}

class _FAQProfilePageState extends State<FAQProfilePage> {
  List isSelected = new List<bool>();
  bool isExpanded = false;
  @override
  void initState() {
    for (int i = 0; i < widget.items.length; i++) {
      //Remplaza {{nombre}} con nada ya que en el preference no hay info del usuario.
      if (widget.name.length > 0) {
        widget.items[i][0]["ContentDetail"] =
            widget.items[i][0]["ContentDetail"].replaceAll("(nombre)",
                "${widget.name[0]}${widget.name.substring(1).toLowerCase()}");
        widget.items[i][0]["ContentDetail"] =
            widget.items[i][0]["ContentDetail"].replaceAll("{{nombre}}",
                "${widget.name[0]}${widget.name.substring(1).toLowerCase()}");
      } else {
        widget.items[i][0]["ContentDetail"] = widget.items[i][0]
                ["ContentDetail"]
            .replaceAll("(nombre)", "querido usuario");
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
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Expandable(
                        text: "${widget.items[index][0]["ContentDetail"]}",
                        title: "${widget.items[index][0]["Title"]}",
                        isExpanded: isExpanded,
                        isTabed: () {
                          widget.namePage == 'about'
                              ? getIt<IFireBaseEventLogger>().aboutUalet(
                                  "${widget.items[index][0]["Title"]}")
                              : widget.namePage == 'help_faq'
                                  ? getIt<IFireBaseEventLogger>().helpFaqs(
                                      "${widget.items[index][0]["Title"]}")
                                  : getIt<IFireBaseEventLogger>().helpSupport( // support
                                      "${widget.items[index][0]["Title"]}");
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
