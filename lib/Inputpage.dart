import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Box.dart';
import 'RoundIconButton.dart';
import 'SexBox.dart';
import 'bottombutton.dart';
import 'const.dart';
import 'package:bmi_calculator/CalculatorBrain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;
  int height = 180;
  int weight = 60;
  int age  = 100;

  //1 = male, female = 2
  void updateColor(Gender selectedGender) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Box(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      content: SexBox(
                        label: "MALE",
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Box(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          color: selectedGender == Gender.female
                              ? kactiveCardColor
                              : kinactiveCardColor,
                          content: SexBox(
                              label: "FEMALE", icon: FontAwesomeIcons.venus)))
                ],
              ),
            ),
            Container(
              child: Expanded(
                  child: Box(
                color: kinactiveCardColor,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: klabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.00),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Box(

                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",style: klabelTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment:  MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                                setState(() {
                                  age--;
                                });
                              },),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                                setState(() {
                                  age++;
                                });
                              },)
                            ],
                          )


                        ],
                      ),
                  color: kinactiveCardColor,
                )),
                Expanded(
                    child: Box(
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: klabelTextStyle,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                            setState(() {
                              weight++;
                            });
                          },)
                        ],
                      )
                    ],
                  ),
                  color: kinactiveCardColor,
                ))
              ],
            )),
            ButtomButton(onTap:() {
              CalculatotBrain calcc = CalculatotBrain(height: height, weight: weight);
              calcc.calculateBMI();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmiResult: calcc.calculateBMI(),
                  resultText: calcc.getResult(),
                  interpretation: calcc.getInterpretation(),
                );
              }));
            },buttonTitle: "CALCULATE",)
          ],
        ));
  }
}




