import 'package:flutter/material.dart';
import '../../../constants.dart';

class Option extends StatelessWidget {
  const Option({
    required this.text,
    required this.index,
    required this.press,
    this.isSelected = false,
    this.isCorrect,
  });
  final String text;
  final int index;
  final VoidCallback press;
  final bool isSelected;
  final bool? isCorrect;

  @override
  Widget build(BuildContext context) {
    Color getTheRightColor() {
      if (isSelected) {
        if (isCorrect != null) {
          return isCorrect! ? kGreenColor : kRedColor;
        }
        return kSecondaryColor; // Selected but not yet evaluated
      }
      return kGrayColor; // Not selected
    }

    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: getTheRightColor()),
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? getTheRightColor().withValues(alpha: 0.1) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. $text",
              style: TextStyle(color: getTheRightColor(), fontSize: 16),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: getTheRightColor()),
                color: isSelected ? getTheRightColor() : null,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
