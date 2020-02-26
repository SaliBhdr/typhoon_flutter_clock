import 'package:flutter/material.dart';

class Pallet extends StatelessWidget {
  final double diameter;
  final Color color;
  final List<BoxShadow> boxShadow;
  final Gradient gradient;
  final String image;

  Pallet(
      {@required this.diameter,
      @required this.boxShadow,
      this.image = 'assets/images/blank.png',
      this.color,
      this.gradient})
      : assert(diameter != null),
        assert(boxShadow != null);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        width: this.diameter,
        height: this.diameter,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(this.image),
            fit: BoxFit.cover,
          ),
          gradient: this.gradient,
          color: this.color ?? Colors.white,
          shape: BoxShape.circle,
          boxShadow: this.boxShadow,
          border: Border.all(color: Colors.grey.withOpacity(0.1), width: 0.5),
        ),
      ),
    );
  }
}
