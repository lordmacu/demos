import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/generated/l10n.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:ualet/presentation/profile/widgets/expandable.dart';

class ProfileHelpPage extends StatefulWidget {
  final List items;
  final String name;

  ProfileHelpPage({Key key, @required this.items, @required this.name})
      : super(key: key);

  @override
  _ProfileHelpPage createState() => _ProfileHelpPage();
}

class _ProfileHelpPage extends State<ProfileHelpPage> {
  List isSelected = new List<bool>();
  bool isExpanded = false;

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
    return ListView.builder(
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
                      isTabed: (){
                        getIt<IFireBaseEventLogger>().myProfile(widget.items[index][0]["Id"].toString());
                      },
                      text: "${widget.items[index][0]["ContentDetail"]}",
                      title: "${widget.items[index][0]["Title"]}",
                      isExpanded: isExpanded,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
