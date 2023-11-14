import 'package:bmi_calculator_app/constant.dart';
import 'package:flutter/material.dart';
import 'iconText.dart';
import 'container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result.dart';
import 'calculator.dart';
import 'package:audioplayers/audioplayers.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int sliderHeight = 180;
  int sliderWeight = 60;
  int sliderAge = 20;


  void playSound() {
    final player = AudioPlayer();
    player.play(AssetSource('click.mp3'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: ContainerWidget(
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    colors: selectGender == Gender.male
                        ? activeColor
                        : deActiveColor,
                    cardWidget: IconText(
                      icondata: FontAwesomeIcons.male,
                      lable: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerWidget(
                    onPressed: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    colors: selectGender == Gender.female
                        ? activeColor
                        : deActiveColor,
                    cardWidget: IconText(
                      icondata: FontAwesomeIcons.female,
                      lable: 'Female',
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: ContainerWidget(
                colors: Color(0xFF1D1E33),
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: labelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(sliderHeight.toString(), style: labelStyle2),
                        Text(
                          'cm',
                          style: labelStyle,
                        ),
                      ],
                    ),
                    Slider(
                        value: sliderHeight.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            sliderHeight = newValue.round();
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                    child: ContainerWidget(
                        colors: Color(0xFF1D1E33),
                        cardWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: labelStyle,
                            ),
                            Text(
                              sliderWeight.toString(),
                              style: labelStyle2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIcon(
                                    iconData: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        playSound();
                                        sliderWeight--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIcon(
                                    iconData: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        playSound();
                                        sliderWeight++;
                                      });
                                    })
                              ],
                            )
                          ],
                        ))),
                Expanded(
                  child: ContainerWidget(
                      colors: Color(0xFF1D1E33),
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: labelStyle,
                          ),
                          Text(
                            sliderAge.toString(),
                            style: labelStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                  iconData: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      playSound();
                                      sliderAge--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIcon(
                                  iconData: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      playSound();
                                      sliderAge++;
                                    });
                                  })
                            ],
                          )
                        ],
                      )),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain clac = CalculatorBrain(height: sliderHeight, weight: sliderWeight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultScreen(bmiResult: clac.CalculateBMI(), resultText: clac.getResult(),interpretation: clac.getInterpretation(),)));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calculate',
                    style: labelStyle3,
                  ),
                ),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            )
          ],
        ));
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({required this.iconData, required this.onPress});
  final IconData iconData;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
