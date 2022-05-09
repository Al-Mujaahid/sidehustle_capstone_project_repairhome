// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidehustle_capstone/utils/colors.dart';

//---------------------------------------------------ICONS-------------------------
class IconOf extends StatelessWidget {
  IconOf(this.type, this.color, this.size, {Key? key}) : super(key: key);
  IconData type;
  Color color;
  double size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      type,
      color: color,
      size: size,
    );
  }
}

class TextOf extends StatelessWidget {
  TextOf(this.text, this.size, this.weight, this.color, {Key? key})
      : super(key: key);
  String text;
  double size;
  FontWeight weight;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          GoogleFonts.mulish(fontSize: size, fontWeight: weight, color: color),
    );
  }
}

class TextOfDecoration extends StatelessWidget {
  TextOfDecoration(this.text, this.size, this.weight, this.color, this.align,
      {Key? key})
      : super(key: key);
  String text;
  double size;
  FontWeight weight;
  TextAlign align;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.poppins(
          fontSize: size - 3, fontWeight: weight, color: color),
    );
  }
}

// ignore: must_be_immutable
class SideSpace extends StatelessWidget {
  SideSpace(this.rl, this.tb, this.content, {Key? key}) : super(key: key);
  double rl;
  Widget content;
  double tb;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(rl, tb, rl, tb),
      child: content,
    );
  }
}

class YSpace extends StatelessWidget {
  final double y;
  // ignore: use_key_in_widget_constructors
  const YSpace(this.y);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

class XSpace extends StatelessWidget {
  final double x;
  const XSpace(this.x);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class TextInput extends StatelessWidget {
  TextInput({
    required this.hint,
    Key? key,
  }) : super(key: key);
  String hint;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                  fontSize: 17, fontWeight: FontWeight.w500, color: ash),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: liteWhite, width: 0))),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({
    required this.action,
    required this.text,
    Key? key,
  }) : super(key: key);
  Function action;
  String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        action();
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: blue,
        child: Container(
          height: 51,
          decoration: BoxDecoration(
              color: blue,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: blue, width: 2)),
          child: Center(
            child: TextOf(text, 17, FontWeight.w500, white),
          ),
        ),
      ),
    );
  }
}

goto(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => page)));
}
