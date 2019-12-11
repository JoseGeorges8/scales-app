import 'package:scales_app/data_providers/scales_data_provider/scales_base_provider.dart';
import 'package:scales_app/models/Scale.dart';

class ScalesFileProvider extends ScalesBaseProvider{


  @override
  Stream<List<Scale>> scales() async* {
    yield [];
  }

}