import 'package:flutter/material.dart';
import '../../constants/constants.dart' as constants;

class TextInput extends StatelessWidget {
  TextInput({
    Key? key,
    required this.fieldTitle,
    required this.hintText,
  }) : super(key: key);

  final String fieldTitle;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            // height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffF4F9FE),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 11, right: 20),
                    child: Text(
                      fieldTitle,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff496690),
                        letterSpacing: -0.3,
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 141, 141, 141),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
