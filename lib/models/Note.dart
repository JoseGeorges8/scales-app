// To parse this JSON data, do
//
//     final note = noteFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

Note noteFromJson(String str) => Note.fromMap(json.decode(str));

String noteToJson(Note data) => json.encode(data.toMap());

// ignore: must_be_immutable
class Note extends Equatable{
  String value;
  bool isSelected;
  bool isSharp;

  Note({
    @required this.value,
    this.isSelected = false,
    @required this.isSharp,
  });

  factory Note.fromMap(Map<String, dynamic> json) => Note(
    value: json["value"],
    isSelected: json["is_selected"],
    isSharp: json["is_sharp"],
  );

  Map<String, dynamic> toMap() => {
    "value": value,
    "is_selected": isSelected,
    "is_sharp": isSharp,
  };


  @override
  String toString() {
    return '{ $value|$isSelected }';
  }

  @override
  List<Object> get props => [value, isSelected, isSharp];
}