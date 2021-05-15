import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String text;
  final String clickText;
  final IconData icon;
  final Function onClickOK;
  final Function onClickCancel;

  InfoDialog(
      {@required this.text, @required this.icon, @required this.onClickOK, this.onClickCancel, this.clickText = "OK"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Center(
        child: Icon(
          icon,
          color: Colors.blue,
          size: 36,
        ),
      ),
      content: Text(text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          )),
      actions: <Widget>[
        onClickCancel != null
            ? OutlineButton(
                onPressed: () => onClickCancel(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                borderSide: BorderSide(color: Colors.blue),
                child: Text(
                  "Batal",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                ),
              )
            : SizedBox(),
        RaisedButton(
          color: Colors.blue,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () => onClickOK(),
          child: Text(
            clickText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
