import 'package:scales_app/models/Scale.dart';

abstract class ScalesBaseProvider{

  Stream<List<Scale>> scales();

  List<Scale> getScales(List<String> selectedNotes);

}