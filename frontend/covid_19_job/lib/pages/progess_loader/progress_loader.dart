import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class Progress{
  ProgressDialog pr;

  Progress(BuildContext context){

    pr = new ProgressDialog(
        context,
        defaultLoadingWidget: CircularProgressIndicator(),
        blur:10,
        dismissable: false,
        title:Text("Loading",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: Text("Please Wait..."),
        dialogStyle: DialogStyle(
            borderRadius: BorderRadius.all(
                Radius.elliptical(30,30)
            ),
            contentPadding: EdgeInsets.all(15),
            animatePopup: true
        )
    );
  }
}
