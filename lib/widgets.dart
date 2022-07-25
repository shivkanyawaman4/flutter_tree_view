import 'package:flutter/material.dart';

import 'const.dart';

class Widgets {
 static Widget nodeContainer({required Size size, required String userName, required String name,required num packageAmount,required num totalAchievedIncome,required num totalExpectedIncome}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: Container(
              height: size.height * 0.04,
              width: size.width * 0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color:getColor(packageAmount, totalAchievedIncome, totalExpectedIncome),
              ),
              child: Center(
                  child: Text(
                userName,
                style: const TextStyle(color: Colors.white),
              ))),
        ),
         Text('-$name'),
      ],
    );
  }
}