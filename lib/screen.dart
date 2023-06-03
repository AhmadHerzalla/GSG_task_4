import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:piano/piano.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
 
 

   void initState() {
    load("assets/Yamaha.sf2");
    super.initState();
  }
  void load(String assets) async {
  FlutterMidi().unmute();
  ByteData _byte = await rootBundle.load(assets);
  FlutterMidi().prepare(sf2: _byte);
}
void playNote(x) {
  FlutterMidi().playMidiNote(
    midi: x,
  );
}

void stopNote(y) {
  FlutterMidi().stopMidiNote(
    midi: y,
  );
}

  
//  void load(String asset) async {
//     FlutterMidi.unmute(); // Optionally Unmute
//     ByteData _byte = await rootBundle.load(asset);
//     FlutterMidi.prepare(sf2: _byte,);
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: CupertinoApp(
            title: 'Piano Demo',
            home: Center(
              child: InteractivePiano(
                highlightedNotes: [
                  NotePosition(note: Note.C, octave: 3),
                ],
                naturalColor: Colors.white,
                accidentalColor: Colors.black,
                keyWidth: 60,
                noteRange: NoteRange.forClefs([
                  Clef.Treble,
                ]),
                onNotePositionTapped: (position) {
                  // print("---------------------------------------");
                  // print(position.name);
          
                  switch (position.name){
                    case "C4":playNote(30); break;
                    case "D4":playNote(35);break;
                    case "E4":playNote(40);break;
                    case "F4":playNote(45);break;
                    case "G4":playNote(50);break;
                    case "A4":playNote(55);break;
                    case "B4":playNote(60);break;
          
                    case "C5":playNote(65);break;
                    case "D5":playNote(70);break;
                    case "E5":playNote(75);break;
                    case "F5":playNote(80);break;
                    case "G5":playNote(85);break;
                    case "A5":playNote(90);break;
                    case "B5":playNote(95);break;
          
                    case "C6":playNote(100);break;
          
                    case "C♯4":playNote(33);break;
                    case "D♯4":playNote(43);break;
                    case "F♯4":playNote(53);break;
                    case "G♯4":playNote(63);break;
                    case "A♯4":playNote(73);break;
          
                    case "C♯5":playNote(83);break;
                    case "D♯5":playNote(93);break;
                    case "F♯5":playNote(68);break;
                    case "G♯5":playNote(78);break;
                    case "A♯5":playNote(105);
                    
          
                  } 
                },
              ),
            ),
            ),
      ),
    );
  }
}