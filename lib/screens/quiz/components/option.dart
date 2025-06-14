import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    Color getBackgroundColor() {
      if (isSelected && isCorrect != null) {
        return isCorrect! ? kSuccessColor : kErrorColor;
      } else if (isSelected) {
        return kPrimaryColor;
      }
      return kCardColor;
    }

    Color getBorderColor() {
      if (isSelected && isCorrect != null) {
        return isCorrect! ? kSuccessColor : kErrorColor;
      } else if (isSelected) {
        return kPrimaryColor;
      }
      return kGrayColor.withOpacity(0.3);
    }

    Color getTextColor() {
      if (isSelected) {
        return Colors.white;
      }
      return kTextPrimaryColor;
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: kSmallPadding),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          borderRadius: BorderRadius.circular(kDefaultRadius),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: getBackgroundColor(),
              borderRadius: BorderRadius.circular(kDefaultRadius),
              border: Border.all(color: getBorderColor(), width: 1.5),
              boxShadow: isSelected ? kCardShadow : [],
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white.withOpacity(0.2) : kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      String.fromCharCode(65 + index), // A, B, C, D
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: kSmallPadding),
                Expanded(
                  child: Text(
                    text,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: getTextColor(),
                      height: 1.3,
                    ),
                  ),
                ),
                if (isSelected && isCorrect != null)
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      isCorrect! ? Icons.check_rounded : Icons.close_rounded,
                      size: 16,
                      color: isCorrect! ? kSuccessColor : kErrorColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
