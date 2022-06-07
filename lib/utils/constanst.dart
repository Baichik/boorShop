import 'package:flutter/material.dart';

const backgroundImage = BoxDecoration(
  color: Colors.white,
  image: DecorationImage(
    fit: BoxFit.contain,
    alignment: Alignment.topCenter,
    image: AssetImage('assets/images/background.png'),
    filterQuality: FilterQuality.high,
  ),
);

const buttonTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'San-Francisco',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.1);

const loginFieldDecoration = InputDecoration(
  hintText: 'Enter email address',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF6C6A6A), width: 0.8),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF6C6A6A), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

const passFieldDecoration = InputDecoration(
  hintText: 'Enter password',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF6C6A6A), width: 0.8),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF6C6A6A), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

const textFieldInputTextStyle = TextStyle(
    fontSize: 15,
    fontFamily: 'San-Francisco',
    fontWeight: FontWeight.w400,
    color: Color(0xFF6D6A6A),
    letterSpacing: 1.2);

const accountTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: 'San-Francisco',
  fontWeight: FontWeight.w400,
  color: Color.fromARGB(255, 0, 0, 0),
);
