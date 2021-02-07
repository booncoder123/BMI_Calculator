import 'package:flutter/cupertino.dart';

import 'const.dart';

class ButtomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  ButtomButton({this.onTap, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(builder:(context) {
      //     return ResultPage();
      //
      //   }));
      //
      // },
      child: Container(
        child: Center(child: Text(buttonTitle,style: klargeButtonTextStyle,)),
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}