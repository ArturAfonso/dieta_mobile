// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final BorderRadiusGeometry borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? icon;

  const CustomButton({
    Key? key,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    required this.text,
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.backgroundColor,
    this.borderColor,
    this.icon,
  }) : super(key: key);

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
            side: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.onSurface),
          ),
        ),
        onPressed: onPressed ??
            () {
              // Ação padrão do botão
            },
        child: icon == null
            ? Text(
                text,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: textStyle ??
                        Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                  ),
                ],
              ),
      ),
    );
  }
}
