import 'package:bmi_calcilator/colors.dart';
import 'package:flutter/material.dart';

class ContainerWithIncDec extends StatefulWidget {
  const ContainerWithIncDec({super.key, required this.count, required this.text});

  final String text;
  final double count;
  

  @override
  State<ContainerWithIncDec> createState() => _ContainerWithIncDecState();
}

class _ContainerWithIncDecState extends State<ContainerWithIncDec> {

  late double count;
  late String text;
  MyColors col = MyColors();

  @override
  void initState() {
    super.initState();
    text = widget.text;
    count = widget.count;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(text, style: const TextStyle(color: Color.fromARGB(255, 227, 225, 255), fontSize: 30, letterSpacing: 3),),
              Text(count.toString(), 
                style: const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 3, 
                  decoration: TextDecoration.underline, decorationColor: Colors.white),)
            ],),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    count++;
                  }); 
                }, 
                icon: const Icon(Icons.plus_one_rounded, color: Colors.white, size: 30,)),

                IconButton(onPressed: (){
                  setState(() {
                    count--;
                  });
                }, 
                icon: const Icon(Icons.exposure_minus_1_outlined, color: Colors.white, size: 30))
              ],
            )
          ],)
    );
  }
}