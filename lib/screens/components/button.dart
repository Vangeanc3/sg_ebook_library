import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? cor;
  final Color? corTexto;
  final Color? border;
  final Function() function;

  const Button({
    super.key,
    required this.text,
    this.cor,
    this.corTexto,
    this.border,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 100),
            backgroundColor: MaterialStateProperty.all<Color?>(
                (cor == null) ? Colors.white : cor),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return (corTexto == null) ? Colors.white : corTexto;
              },
            ),
            side: (border != null)
                ? MaterialStateProperty.all(
                    BorderSide(color: border!, width: 4))
                : null,
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 16)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.black87;
                }
                return null;
              },
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          )),
    );
  }
}
