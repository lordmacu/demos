import 'package:ualet/infrastructure/event_logger/firebase/firebase_event_logger.dart';
import 'package:ualet/injection.dart';
import 'package:ualet/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';
import 'package:ualet/presentation/core/design/app_text_styles.dart';

class Expandable extends StatefulWidget {

  final String text;
  final String title;
  bool isExpanded;
  Function isTabed;
  Expandable(
      {Key key, @required this.text,this.title,this.isExpanded,this.isTabed})
      : super(key: key);

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: (){
          setState(() {

            widget.isExpanded=!widget.isExpanded;
            widget.isTabed();
          });
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  "${widget.title}",
                  textAlign: TextAlign.left,
                  style: AppTextStyles.normal2
                            .copyWith(color: AppColors.g75Color),
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
      widget.isExpanded ? Container(
        margin: EdgeInsets.only(top: 15),
        child: Text("${widget.text}", style: AppTextStyles.normal2
            .copyWith(color: AppColors.g75Color,fontSize: 14,fontWeight: FontWeight.normal)),
      ): Container()
    ],
  );
  }
}
