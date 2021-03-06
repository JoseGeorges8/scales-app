import 'package:scales_app/data_providers/scales_data_provider/scales_base_provider.dart';
import 'package:scales_app/models/Note.dart';
import 'package:scales_app/models/Scale.dart';

class ScalesBasicProvider extends ScalesBaseProvider{


  final List<Scale> _scales = [
    /// Major Scales
    Scale(root: 'C', type: 'Major', notes: ['C', 'D', 'E', 'F', 'G', 'A', 'B'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'D', type: 'Major', notes: ['D', 'E', 'G♭', 'G', 'A', 'B♭', 'B'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(),
      Note.B(),
    ]),
    Scale(root: 'E', type: 'Major', notes: ['E', 'G♭', 'A♭' ,'A',  'B', 'D♭', 'E♭'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'F', type: 'Major', notes: ['F', 'G', 'A', 'B♭', 'C', 'D', 'E'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'G', type: 'Major', notes: ['G', 'A', 'B', 'C', 'D', 'E', 'G♭'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'A', type: 'Major', notes: ['A', 'B', 'D♭', 'D', 'E', 'G♭', 'A♭'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'B', type: 'Major', notes: ['B', 'D♭', 'E♭', 'E', 'G♭', 'A♭','B♭'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(),
    ]),
    Scale(root: 'D♭', type: 'Major', notes: ['D♭', 'E♭', 'F', 'G♭', 'A♭', 'B♭','C'], playableNotes: [
      Note.C(),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'E♭', type: 'Major', notes: ['E♭', 'F', 'G', 'A♭', 'B♭', 'C','D'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'G♭', type: 'Major', notes: ['G♭', 'A♭', 'B♭', 'B', 'D♭', 'E♭','F'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(),
    ]),
    Scale(root: 'A♭', type: 'Major', notes: ['A♭', 'B♭', 'C', 'D♭', 'E♭', 'F', 'G'], playableNotes: [
      Note.C(),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'B♭', type: 'Major', notes: ['B♭', 'C', 'D', 'E♭', 'F', 'G','A'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    /// Minor Scales
    Scale(root: 'C', type: 'Minor', notes: ['C', 'D', 'E♭', 'F', 'G', 'A♭', 'B♭'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'D', type: 'Minor', notes: ['D', 'E', 'F', 'G', 'A', 'B♭', 'C'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'E', type: 'Minor', notes: ['E', 'G♭', 'G' ,'A', 'B', 'C', 'D', 'E'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'F', type: 'Minor', notes: ['F', 'G', 'A♭', 'B♭', 'C', 'D♭', 'E♭'], playableNotes: [
      Note.C(),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'G', type: 'Minor', notes: ['G', 'A', 'B♭', 'C', 'D', 'E♭', 'F'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
    Scale(root: 'A', type: 'Minor', notes: ['A', 'B', 'C', 'D', 'E', 'F', 'G'], playableNotes: [
      Note.C(),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(),
      Note.gFlat(isDisabled: true),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'B', type: 'Minor', notes: ['B', 'D♭', 'D', 'E', 'G♭', 'G','A'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(isDisabled: true),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(),
      Note.aFlat(isDisabled: true),
      Note.A(),
      Note.bFlat(),
      Note.B(),
    ]),
    Scale(root: 'D♭', type: 'Minor', notes: ['D♭', 'E♭', 'E', 'G♭', 'A♭', 'A', 'B'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'E♭', type: 'Minor', notes: ['E♭', 'F', 'G♭', 'A♭', 'B♭', 'C♭','D♭'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(),
    ]),
    Scale(root: 'G♭', type: 'Minor', notes: ['G♭', 'A♭', 'A', 'B', 'D♭', 'D', 'E'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(),
      Note.eFlat(isDisabled: true),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(),
      Note.bFlat(isDisabled: true),
      Note.B(),
    ]),
    Scale(root: 'A♭', type: 'Minor', notes: ['A♭', 'B♭', 'B', 'D♭', 'E♭', 'G♭', 'A♭'], playableNotes: [
      Note.C(isDisabled: true),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(),
      Note.F(isDisabled: true),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(),
    ]),
    Scale(root: 'B♭', type: 'Minor', notes: ['B♭', 'C', 'D♭', 'E♭', 'F', 'G♭','A♭'], playableNotes: [
      Note.C(),
      Note.dFlat(),
      Note.D(isDisabled: true),
      Note.eFlat(),
      Note.E(isDisabled: true),
      Note.F(),
      Note.gFlat(),
      Note.G(isDisabled: true),
      Note.aFlat(),
      Note.A(isDisabled: true),
      Note.bFlat(),
      Note.B(isDisabled: true),
    ]),
  ];


  @override
  List<Scale> getScales(List<String> selectedNotes) {
    if (selectedNotes.isEmpty) return [];
    return List<Scale>.from(_scales).where((scale) => scale.notes.toSet().containsAll(selectedNotes.toSet())).toList();
  }

}