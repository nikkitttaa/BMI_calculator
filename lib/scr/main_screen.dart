import 'package:bmi_calcilator/colors.dart';
import 'package:bmi_calcilator/model/model_for_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 
 MyColors col = MyColors();
 
 List<bool> selected = [false,false];

  double height = 160;
  double age = 20;
  double weight = 50;
  double bmi = 0;
  String gender = 'male';
  Color clrBmi = Colors.green;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col.bg,
      appBar: AppBar(
        title: const Text('BMI Calculator', 
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: col.btn,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height/30,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('Severe thinness', style: TextStyle(backgroundColor: Colors.red),),
            Text('Mild thinness', style: TextStyle(backgroundColor: Colors.orange),),
            Text('Normal', style: TextStyle(backgroundColor: Colors.green),),
            Text('Overweight', style: TextStyle(backgroundColor: Colors.orange),),
            Text('Obesity', style: TextStyle(backgroundColor: Colors.red),)
          ],)
        ),
        const Text('Normal BMI = 20 kg/m2', style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),),
        Text('Your BMI = ${bmi.toStringAsFixed(2)}', style: TextStyle(color: clrBmi, fontSize: 26),),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height/10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(color: selected[0]?const Color.fromARGB(255, 77, 102, 122): col.btn, borderRadius: BorderRadius.circular(20),),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width/2.4,
                height: MediaQuery.sizeOf(context).width/2.4,
                child: IconButton(onPressed: (){
                    setState(() {
                      selected = [false,false];
                      selected[0] = true;
                      gender = 'male';
                    });
                  }, 
                  icon: Icon(Icons.male, color: Colors.blue, size: MediaQuery.sizeOf(context).shortestSide/3,), 
                ),
              ),
          
              Container(
                decoration: BoxDecoration(color: selected[1]?const Color.fromARGB(255, 77, 102, 122): col.btn, borderRadius: BorderRadius.circular(20),),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width/2.4,
                height: MediaQuery.sizeOf(context).width/2.4,
                child: IconButton(onPressed: (){
                   setState(() {
                      selected = [false,false];
                      selected[1] = true;
                      gender = 'female';
                    });
                  }, 
                  icon: Icon(Icons.female, color: Colors.pinkAccent, size: MediaQuery.sizeOf(context).shortestSide/3), 
                ),
              ),
            ]),
          ),

          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: col.btn),
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Text('Height', style: TextStyle(color: Colors.white, fontSize: 30, letterSpacing: 3),),
                Slider(value: height,
                min: 50, 
                max: 250,
                onChanged: ((value) {
                  setState(() {
                    height = value;
                  });
                })
                ),
                Text('${height.toStringAsFixed(0)} см', style: const TextStyle(color: Colors.white),),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContainerWithIncDec(count: age, text: 'Age'),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: col.btn),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.sizeOf(context).width/2.2,
                height: MediaQuery.sizeOf(context).width/2.2,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Weight', style: TextStyle(color: Color.fromARGB(255, 227, 225, 255), fontSize: 30, letterSpacing: 3),),
                        Text(weight.toString(), 
                          style: const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 3, 
                            decoration: TextDecoration.underline, decorationColor: Colors.white),)
                      ],),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              weight++;
                            }); 
                          }, 
                          icon: const Icon(Icons.plus_one_rounded, color: Colors.white, size: 30,)),

                          IconButton(onPressed: (){
                            setState(() {
                              weight--;
                            });
                          }, 
                          icon: const Icon(Icons.exposure_minus_1_outlined, color: Colors.white, size: 30))
                        ],
                      )
                    ],)
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width/1.05,
              height: MediaQuery.sizeOf(context).height/20,
              child: ElevatedButton(onPressed: (){
                setState(() {
                  double heightInM = height/100;
                  double kvadheight = heightInM*heightInM;
                  bmi = weight/kvadheight;
                  if(18.5 < bmi && bmi < 25){
                    clrBmi = Colors.green;
                  } else if(17<bmi &&bmi<18.5){
                    clrBmi = Colors.orange;
                  }
                  else if(bmi<17){
                    clrBmi = Colors.red;
                  }
                  else if(25<bmi &&bmi<30){
                    clrBmi = Colors.orange;
                  }
                  else if(30<bmi){
                    clrBmi = Colors.red;
                  }
                });
              }, 
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(col.btn),),
              child: const Text('Calculate', style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 3))),
            ),
          )
          ],
        )
    );
  }
}