import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';

import 'custom_bubble.dart';

enum ChatType { user, roboAdvisor }

class BubbleElement extends StatelessWidget {
  const BubbleElement({Key key, @required this.type, this.child})
      : super(key: key);

  final ChatType type;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return type == ChatType.user
        ? CustomBubble(
            alignment: Alignment.centerLeft,
            nip: BubbleNip.leftBottom,
            color: AppColors.whiteColor,
            child: child,
            stick: false,
            radius: Radius.circular(20),
            nipRadius: 0,
            nipHeight: 20.0,
            nipWidth: 0.3,
            elevation: 0.02,
            margin: BubbleEdges.only(
                right: (MediaQuery.of(context).size.width / 2) * 0.64),
            padding: BubbleEdges.only(left: 15, right: 15, top: 10, bottom: 10),
            shadowColor: AppColors.greyColor,
          )
        : CustomBubble(
            alignment: Alignment.centerRight,
            nip: BubbleNip.rightBottom,
            color: AppColors.whiteColor,
            child: child,
            stick: false,
            radius: Radius.circular(20),
            nipRadius: 0,
            nipHeight: 20.0,
            nipWidth: 0.3,
            elevation: 0.02,
            margin: BubbleEdges.only(
                left: (MediaQuery.of(context).size.width / 2) * 0.64),
            padding: BubbleEdges.only(left: 15, right: 15, top: 10, bottom: 10),
            shadowColor: AppColors.greyColor,
            borderColor: AppColors.robotChatBubble,
          );
  }
}
