import 'package:flutter/foundation.dart';

class Scale{

  final String root;
  final String type;
  final List<String> notes;

  Scale({@required this.root, @required this.type, @required this.notes});

  @override
  String toString() {
    return '${root.toUpperCase()} ${type[0].toUpperCase() + type.substring(1)}';
  }

}