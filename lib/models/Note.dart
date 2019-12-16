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
  int midi;

  Note({
    @required this.value,
    this.isSelected = false,
    @required this.isSharp,
    @required this.midi,
  });

  Note copyWith({
    String value,
    bool isSelected,
    bool isSharp,
    int midi
  }) =>
      Note(
        value: value ?? this.value,
        isSelected: isSelected ?? this.isSelected,
        isSharp: isSharp ?? this.isSharp,
        midi: midi ?? this.midi,
      );

  factory Note.fromMap(Map<String, dynamic> json) => Note(
    value: json["value"],
    isSelected: json["is_selected"],
    isSharp: json["is_sharp"],
    midi: json["midi"],
  );

  Map<String, dynamic> toMap() => {
    "value": value,
    "is_selected": isSelected,
    "is_sharp": isSharp,
    "midi": midi,
  };


  @override
  String toString() {
    return '{ $value|$isSelected }';
  }

  @override
  List<Object> get props => [value, isSelected, isSharp, midi];
}