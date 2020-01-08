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
  bool isDisabled;

  Note({
    @required this.value,
    @required this.isSharp,
    @required this.midi,
    this.isSelected = false,
    this.isDisabled = false,
  });


  factory Note.C({isDisabled = false, int midi = 60}) => Note(value: 'C', isSharp: false, midi: midi, isDisabled: isDisabled);
  factory Note.dFlat({isDisabled = false, int midi = 61}) => Note(value: 'D♭', isSharp: true, midi: midi, isDisabled: isDisabled);
  factory Note.D({isDisabled = false, int midi = 62}) => Note(value: 'D', isSharp: false, midi: midi, isDisabled: isDisabled);
  factory Note.eFlat({isDisabled = false, int midi = 63}) => Note(value: 'E♭', isSharp: true, midi: midi, isDisabled: isDisabled);
  factory Note.E({isDisabled = false, int midi = 64}) => Note(value: 'E', isSharp: false, midi: midi, isDisabled: isDisabled);
  factory Note.F({isDisabled = false, int midi = 65}) => Note(value: 'F', isSharp: false, midi: midi, isDisabled: isDisabled);
  factory Note.gFlat({isDisabled = false, int midi = 66}) => Note(value: 'G♭', isSharp: true, midi: midi, isDisabled: isDisabled);
  factory Note.G({isDisabled = false, int midi = 67}) => Note(value: 'G', isSharp: false, midi: midi, isDisabled: isDisabled);
  factory Note.aFlat({isDisabled = false, int midi = 68}) => Note(value: 'A♭', isSharp: true, midi: midi, isDisabled: isDisabled);
  factory Note.A({isDisabled = false, int midi = 69}) => Note(value: 'A', isSharp: false, midi: midi, isDisabled: isDisabled);
  factory Note.bFlat({isDisabled = false, int midi = 70}) => Note(value: 'B♭', isSharp: true, midi: midi, isDisabled: isDisabled);
  factory Note.B({isDisabled = false, int midi = 71}) => Note(value: 'B', isSharp: false, midi: midi, isDisabled: isDisabled);

  Note copyWith({
    String value,
    bool isSelected,
    bool isDisabled,
    bool isSharp,
    int midi
  }) =>
      Note(
        value: value ?? this.value,
        isSelected: isSelected ?? this.isSelected,
        isDisabled: isDisabled ?? this.isDisabled,
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