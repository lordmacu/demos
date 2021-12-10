import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:ualet/presentation/core/design/app_colors.dart';

class CardListWidget extends StatefulWidget {
  final List data;
  const CardListWidget({Key key, @required this.data});
  @override
  _CardListWidgetState createState() => _CardListWidgetState();
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

class _CardListWidgetState extends State<CardListWidget> {
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
    return Container(
      child: Column(
        children: <Widget>[
          _optionClick == 1
              ? _optionListSelect(1, _response1, _emoji1)
              : _optionList(1, _response1, _emoji1),
          _optionClick == 2
              ? _optionListSelect(2, _response2, _emoji2)
              : _optionList(2, _response2, _emoji2),
          _optionClick == 3
              ? _optionListSelect(3, _response3, _emoji3)
              : _optionList(3, _response3, _emoji3),
          _optionClick == 4
              ? _optionListSelect(4, _response4, _emoji4)
              : _optionList(4, _response4, _emoji4),
        ],
      ),
    );
  }

  Widget _optionList(id, response, emoji) {
    var media = MediaQuery.of(context).size;
    setState(() {
      _data = widget.data;
    });
    return GestureDetector(
      onTap: () {
        setState(() {
          _optionClick = id;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        height: 82.0,
        width: media.width,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: <Widget>[_iconSection(emoji), _textResponse(1, response)],
        ),
      ),
    );
  }

  Widget _optionListSelect(id, response, emoji) {
    var media = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        height: 82.0,
        width: media.width,
        decoration: BoxDecoration(
            color: AppColors.primarySoftColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: AppColors.primaryColor, width: 2.0)),
        child: Row(
          children: <Widget>[
            _iconSection(emoji),
            _textResponse(2, response),
          ],
        ),
      ),
    );
  }

  Widget _iconSection(nameEmoji) {
    var parser = EmojiParser();
    var setEmoji = parser.info('$nameEmoji');
    nameEmoji = setEmoji.full;
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width * 0.18,
      child: Text(
        parser.emojify(nameEmoji),
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

  Widget _textResponse(color, textResponse) {
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      width: media.width * 0.7,
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
    );
  }
}
