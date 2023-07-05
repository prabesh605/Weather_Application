import 'package:flutter/material.dart';

const wColor = Colors.white;
const sgreyColor = Color(0xffff7f7f7);
const kNormalStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.white);
const kNormalTextStyle =
    TextStyle(fontSize: 20.0, color: Colors.white, fontStyle: FontStyle.italic);
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.black,
    size: 40.0,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);
