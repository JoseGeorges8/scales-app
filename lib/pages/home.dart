import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scales_app/bloc_providers/scales_bloc_provider.dart';
import 'package:scales_app/blocs/mode_bloc/bloc.dart';
import 'package:scales_app/blocs/notes_bloc/bloc.dart';
import 'package:scales_app/pages/settings.dart';
import 'package:scales_app/widgets/clear_button.dart';
import 'package:scales_app/widgets/draggable_scales_sheet.dart';
import 'package:scales_app/widgets/home_app_bar.dart';
import 'package:scales_app/widgets/note_button_group.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  NotesBloc _notesBloc;

  @override
  void initState() {
    _notesBloc = BlocProvider.of<NotesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage())))
        ],
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
          builder: (BuildContext context, NotesState state) {
              return SizedBox.expand(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        NotesButtonGroup(notes: state.notes),
                        Divider(),
                        BottomContainer(),
                      ],
                    ),
                    ScalesBlocProvider(child: DraggableScalesSheet())
                  ],
                ),
              );
      }),
      floatingActionButton: ClearButton(onPressed: () => _notesBloc.clearNotes()),
    );
  }

}

//todo: move this to its on file when defined properly
class BottomContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitchModeButton();
  }
}

//todo: move this to its on file when defined properly
class AnimatedSwitchModeButton extends StatefulWidget{
  @override
  _AnimatedSwitchModeButtonState createState() => _AnimatedSwitchModeButtonState();
}
class _AnimatedSwitchModeButtonState extends State<AnimatedSwitchModeButton> {
 
  ModeBloc _modeBloc;

  @override
  void initState() {
    _modeBloc = BlocProvider.of<ModeBloc>(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  
  _toggleMode() => _modeBloc.toggleMode();
}
