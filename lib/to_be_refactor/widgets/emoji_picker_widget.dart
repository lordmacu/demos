import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';
import 'package:ualet/to_be_refactor/models/Goals/emojiCategory_model.dart';
import 'package:ualet/to_be_refactor/services/Goals/emoji_service.dart';

class EmojiPickerWidget extends StatefulWidget {
  final TextEditingController controller;

  const EmojiPickerWidget({
    Key key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _EmojiPickerWidgetState();
}

List<EmojiCategory> list = List<EmojiCategory>();
final _emojiService = EmojiService();

class _EmojiPickerWidgetState extends State<EmojiPickerWidget> {
  var parser = EmojiParser();
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
      content: StreamBuilder(
        stream: _emojiService.getEmojicategory(),
        builder: (context, AsyncSnapshot<List<EmojiCategory>> snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data;
            return _emokiPicker();
          } else {
            return ModalProgressHUD(
              child: Container(),
              inAsyncCall: true,
              color: AppColors.deepPurpleColor,
              opacity: 0.0,
              progressIndicator: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _emokiPicker() {
    List<String> categorys = List<String>();
    for (var item in list) {
      categorys.add(item.name);
    }
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 0.4,
      child: DefaultTabController(
        length: categorys.length,
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  indicatorColor: AppColors.primaryColor,
                  isScrollable: true,
                  unselectedLabelColor: AppColors.g10Color,
                  labelColor: AppColors.g75Color,
                  tabs: [
                    _valueTitleTab(categorys[0]),
                    _valueTitleTab(categorys[1]),
                    _valueTitleTab(categorys[2]),
                    _valueTitleTab(categorys[3]),
                    _valueTitleTab(categorys[4]),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _valueBodyTab(categorys[0]),
              _valueBodyTab(categorys[1]),
              _valueBodyTab(categorys[2]),
              _valueBodyTab(categorys[3]),
              _valueBodyTab(categorys[4])
            ],
          ),
        ),
      ),
    );
  }

  Widget _valueTitleTab(String valueText) {
    return Tab(
        child: Text(
      valueText,
    ));
  }

  Widget _valueBodyTab(String valueEmoji) {
    return _drawSelectEmoji2ElectricBogaloo(valueEmoji);
  }

  // Widget _drawSelectEmoji(String valueEmoji) {
  //   //TODO: Utilizar Wrap
  //   List<String> emoji = List<String>();
  //   var commentWidgets = List<Widget>();
  //   var row = List<Widget>();
  //   var lstFiltred = list.where((e) => e.name == valueEmoji);
  //   for (var item in lstFiltred.first.emoji) {
  //     emoji.add(item.emojiName);
  //   }
  //   int itemsPerRow = MediaQuery.of(context).size.width < 400 ? 2 : 3;
  //   for (var i = 0; i < emoji.length; i++) {
  //     if (i % itemsPerRow == 0) {
  //       commentWidgets.add(Row(
  //         children: row,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //       ));
  //       commentWidgets.add(SizedBox(height: 15.0));
  //       row = List<Widget>();
  //     }
  //     row.add(FlatButton(
  //       onPressed: () {
  //         setState(() {
  //           widget.controller.text = parser.info(emoji[i]).full;
  //           ExtendedNavigator.rootNavigator.pop();
  //         });
  //       },
  //       child: Text(
  //         parser.emojify(parser.info(emoji[i]).full),
  //         style: TextStyle(fontSize: 33),
  //       ),
  //     ));
  //   }
  //   var limit = itemsPerRow - row.length;
  //   //Llenar los espacios faltantes para que centre correctamente
  //   for (var i = 0; i < limit; i++) {
  //     row.add(FlatButton(
  //       onPressed: () => {},
  //       child: Text(
  //         '',
  //         style: TextStyle(fontSize: 33),
  //       ),
  //     ));
  //   }
  //   commentWidgets.add(Row(
  //     children: row,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //   ));
  //   return Column(children: commentWidgets);
  // }

  Widget _drawSelectEmoji2ElectricBogaloo(String valueEmoji) {
    List<String> emoji = List<String>();
    var row = List<Widget>();
    var lstFiltred = list.where((e) => e.name == valueEmoji);
    for (var item in lstFiltred.first.emoji) {
      emoji.add(item.emojiName);
    }

    for (var i = 0; i < emoji.length; i++) {
      row.add(FlatButton(
        onPressed: () {
          setState(() {
            widget.controller.text = parser.info(emoji[i]).full;
            ExtendedNavigator.rootNavigator.pop();
          });
        },
        child: Text(
          parser.emojify(parser.info(emoji[i]).full),
          style: TextStyle(fontSize: 33),
        ),
      ));
    }

    return GridView.count(
      crossAxisCount: 4,
      children: List.from(row),
      physics: ScrollPhysics(),
      primary: false,
    );
  }
}
