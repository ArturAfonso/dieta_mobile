import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final BorderRadiusGeometry borderRadius;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    this.text = '+ Nova refeição',
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Largura configurável
      height: height, // Altura configurável
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: onPressed ??
            () {
              // Ação padrão do botão
            },
        child: Text(
          text, // Texto configurável
          style: textStyle ??
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
        ),
      ),
    );
  }
}
