import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GradientImageCard extends StatefulWidget {
  const GradientImageCard({super.key, required this.title, required this.image, required this.gradientColor});

final String title;
final String image;
final Color gradientColor;

  @override
  State<GradientImageCard> createState() => _GradientImageCardState();
}

class _GradientImageCardState extends State<GradientImageCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: ShaderMask(
          blendMode:
          BlendMode.srcATop, // Режим смешивания цветов
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                Colors.transparent,
                widget.gradientColor,
              ], // Цвета градиента
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: [0.2,0.6],
            ).createShader(bounds);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
            )
          ),
        ),
      ),
      Positioned(
        bottom: 16, // Задайте нужные значения для позиционирования текста
        left: 16,
        child: Text( widget.title,
          style:const  TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ]
    );
  }
}

