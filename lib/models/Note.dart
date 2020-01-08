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
  final String value;
  final bool isSharp;
  final int midi;
  bool isSelected;

  Note({
    @required this.value,
    @required this.isSharp,
    @required this.midi,
    this.isSelected = false,
  });


  factory Note.C({isSelected = false, int midi = 60}) => Note(value: 'C', isSharp: false, midi: midi, isSelected: isSelected);
  factory Note.dFlat({isSelected = false, int midi = 61}) => Note(value: 'D♭', isSharp: true, midi: midi, isSelected: isSelected);
  factory Note.D({isSelected = false, int midi = 62}) => Note(value: 'D', isSharp: false, midi: midi, isSelected: isSelected);
  factory Note.eFlat({isSelected = false, int midi = 63}) => Note(value: 'E♭', isSharp: true, midi: midi, isSelected: isSelected);
  factory Note.E({isSelected = false, int midi = 64}) => Note(value: 'E', isSharp: false, midi: midi, isSelected: isSelected);
  factory Note.F({isSelected = false, int midi = 65}) => Note(value: 'F', isSharp: false, midi: midi, isSelected: isSelected);
  factory Note.gFlat({isSelected = false, int midi = 66}) => Note(value: 'G♭', isSharp: true, midi: midi, isSelected: isSelected);
  factory Note.G({isSelected = false, int midi = 67}) => Note(value: 'G', isSharp: false, midi: midi, isSelected: isSelected);
  factory Note.aFlat({isSelected = false, int midi = 68}) => Note(value: 'A♭', isSharp: true, midi: midi, isSelected: isSelected);
  factory Note.A({isSelected = false, int midi = 69}) => Note(value: 'A', isSharp: false, midi: midi, isSelected: isSelected);
  factory Note.bFlat({isSelected = false, int midi = 70}) => Note(value: 'B♭', isSharp: true, midi: midi, isSelected: isSelected);
  factory Note.B({isSelected = false, int midi = 71}) => Note(value: 'B', isSharp: false, midi: midi, isSelected: isSelected);

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