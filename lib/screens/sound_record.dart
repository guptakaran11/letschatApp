// ignore_for_file: unused_local_variable

// import 'dart:html';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/tau.dart';
import 'package:permission_handler/permission_handler.dart';


final pathToSaveAudio = 'audio_example.aac';

class SoundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialised = false;

  bool get isRecording => _audioRecorder!.isRecording;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException(
          'Microphone Permission is not granted');
    }

    await _audioRecorder!.openAudioSession();
    _isRecorderInitialised = true;

     void dispose() {
      if (!_isRecorderInitialised) return;
      _audioRecorder!.closeAudioSession();
      _audioRecorder = null;
      _isRecorderInitialised = false;
    }

    await _audioRecorder!.openAudioSession();
  }

  Future _record() async {
    if (!_isRecorderInitialised) return;
    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }

  Future _stop() async {
    if (!_isRecorderInitialised) return;
    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording() async {
    if (_audioRecorder!.isStopped) {
      await _record();
    } else {
      await _stop();
    }
  }
}
