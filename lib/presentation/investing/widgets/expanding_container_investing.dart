import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';

class ExpandingContainerInvesting extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Widget permanent;

  ExpandingContainerInvesting(
      {Key key,
      this.expand = false,
      @required this.child,
      @required this.permanent})
      : super(key: key);

  @override
  _ExpandingContainerState createState() => _ExpandingContainerState();
}

class _ExpandingContainerState extends State<ExpandingContainerInvesting>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandedCheck();
  }

  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    animation = CurvedAnimation(
        parent: expandController, curve: Curves.fastLinearToSlowEaseIn);
  }

  void _runExpandedCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandingContainerInvesting oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandedCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.expand ? 180 : 110,
      duration: Duration(milliseconds: 700),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
        border: Border.fromBorderSide(
          BorderSide(
              color: widget.expand
                  ? AppColors.successColor
                  : AppColors.whiteColor),
        ),
      ),
      padding: EdgeInsets.all(AppDimens.layoutMarginS),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          widget.permanent,
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.fastLinearToSlowEaseIn,
                height: widget.expand ? 80 : 0,
                child: widget.child,
              )),
        ],
      ),
    );
  }
}
