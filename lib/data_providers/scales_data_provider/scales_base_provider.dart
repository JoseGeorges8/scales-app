import 'package:scales_app/models/Scale.dart';

abstract class ScalesBaseProvider{

  List<Scale> getScales(List<String> selectedNotes);

}