import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/presentation/core/design/app_dimens.dart';

class ExpandingContainer extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Widget permanent;
  final double expandedSize;
  final double size;
  final double animatedContainerHeight;

  ExpandingContainer({
    Key key,
    this.expand = false,
    @required this.child,
    @required this.permanent,
    this.expandedSize = 170.0,
    this.size = 105,
    this.animatedContainerHeight = 60.0,
  }) : super(key: key);

  @override
  _ExpandingContainerState createState() => _ExpandingContainerState();
}

class _ExpandingContainerState extends State<ExpandingContainer>
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
  void didUpdateWidget(ExpandingContainer oldWidget) {
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
      height: widget.expand ? widget.expandedSize : widget.size,
      duration: Duration(milliseconds: 700),
      curve: Curves.fastLinearToSlowEaseIn,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimens.dialogBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
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
                height: widget.expand ? widget.animatedContainerHeight : 0,
                child: widget.child,
              )),
        ],
      ),
    );
  }
}
