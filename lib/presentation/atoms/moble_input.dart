import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput(
      {Key? key, required this.hintText, required this.fieldTitle})
      : super(key: key);

  final String fieldTitle;
  final String hintText;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
                  padding: const EdgeInsets.only(left: 20, top: 11),
                  child: Text(
                    widget.fieldTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff496690),
                      letterSpacing: -0.3,
                    ),
                  )),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: TextField(
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      suffixIcon: IconButton(
                          onPressed: () => setState(
                              () => isHiddenPassword = !isHiddenPassword),
                            alignment: Alignment.topRight,
                          icon: Icon(
                            isHiddenPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          )),
                      hintStyle: const TextStyle(
                        color: Color(0xff313f51),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: -0.3,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
