import 'package:flutter/material.dart';
import 'package:koofit/main_screen/fitness_screen/show_fitness_screen.dart';

class FitnessCard extends StatefulWidget {
  const FitnessCard({super.key});


  @override
  State<FitnessCard> createState() => _FitnessCardState();
}

class _FitnessCardState extends State<FitnessCard> {

  bool isOuter = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), // 여기서 숫자를 조절하여 둥근 정도를 결정할 수 있습니다.
        ),
        child:
        InkWell(
            onTap: () async {
              await ShowFitness(context);
            },

            child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child:
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text("운동",
                            style: TextStyle(
                              color: Color(0xA5222B45),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),),
                          SizedBox(height: 20,),
                          Text("30분/60분",
                            style: TextStyle(
                              color: Color(0xFF222B45),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )
                            ,),
                          SizedBox(height: 13,),

                        ]))
            )
        )
    );


  }

}