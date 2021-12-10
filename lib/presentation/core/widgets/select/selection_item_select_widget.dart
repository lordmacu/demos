import 'package:flutter/material.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';

class SelectionItemSelect extends StatelessWidget {
  final String title;
  final bool isForList;
  final String labelTextTitle;

  const SelectionItemSelect(
      {Key key, this.title, this.isForList = true, this.labelTextTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Column(
              children: <Widget>[
                labelTextTitle != null
                    ? _labelTextField(labelTextTitle)
                    : Container(),
                Container(
                  height: 46,
                  decoration: BoxDecoration(
                      color: AppColors.inputColor,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: AppColors.g10Color,
                      )),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.centerLeft,
                          child: Text(title,
                              style: TextStyle(
                                  fontFamily: 'open-sans-regular',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.g90Color)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.keyboard_arrow_down,
                              color: AppColors.g25Color, size: 25.0),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _labelTextField(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          labelText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: AppColors.g75Color,
          ),
        ),
      ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title),
    );
  }
}
