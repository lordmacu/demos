import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';

class CardTableWidget extends StatefulWidget {
  final List data;
  const CardTableWidget({Key key, @required this.data});

  @override
  _CardTableWidgetState createState() => _CardTableWidgetState();
}

int _optionClick = 0;

String _response1 = '';
String _response2 = '';
String _response3 = '';
String _response4 = '';
String _emoji1 = '';
String _emoji2 = '';
String _emoji3 = '';
String _emoji4 = '';
List _data = [];

class _CardTableWidgetState extends State<CardTableWidget> {
  PageController _pageController;
  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  // getData() {
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _data = widget.data;
      var newData = _data;
      _response1 = newData[0].value;
      _response2 = newData[1].value;
      _response3 = newData[2].value;
      _response4 = newData[3].value;
      _emoji1 = newData[0].emojiValue;
      _emoji2 = newData[1].emojiValue;
      _emoji3 = newData[2].emojiValue;
      _emoji4 = newData[3].emojiValue;
    });
    return Table(
      children: [
        TableRow(children: [
          _optionClick == 1
              ? _sectionOptionSelected(1, _response1, _emoji1)
              : _sectionOption(1, _response1, _emoji1),
          _optionClick == 2
              ? _sectionOptionSelected(2, _response2, _emoji2)
              : _sectionOption(2, _response2, _emoji2),
        ]),
        TableRow(children: [
          _optionClick == 3
              ? _sectionOptionSelected(3, _response3, _emoji3)
              : _sectionOption(3, _response3, _emoji3),
          _optionClick == 4
              ? _sectionOptionSelected(4, _response4, _emoji4)
              : _sectionOption(4, _response4, _emoji4),
        ])
      ],
    );
  }

  Widget _sectionOption(id, response, emoji) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _optionClick = id;
        });
      },
      child: Container(
        height: 148.0,
        width: 158.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 5.0),
            _iconSection(emoji),
            _textResponse(1, response),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }

  Widget _sectionOptionSelected(id, response, emoji) {
    return Container(
      height: 148.0,
      width: 158,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: AppColors.primarySoftColor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: AppColors.primaryColor, width: 2.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(height: 5.0),
          _iconSection(emoji),
          _textResponse(2, response),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Widget _iconSection(nameEmoji) {
    var parser = EmojiParser();
    var setEmoji = parser.info('$nameEmoji');
    nameEmoji = setEmoji.full;
    return Container(
      child: Text(
        parser.emojify(nameEmoji),
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

  Widget _textResponse(color, textResponse) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: color == 2
          ? Text(
              "$textResponse",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14.0,
                  fontFamily: 'open-sans-semi-bold'),
              textAlign: TextAlign.center,
            )
          : Text("$textResponse",
              style: TextStyle(
                  color: AppColors.g50Color,
                  fontSize: 14.0,
                  fontFamily: 'open-sans-semi-bold'),
              textAlign: TextAlign.center),
    ));
  }
}
