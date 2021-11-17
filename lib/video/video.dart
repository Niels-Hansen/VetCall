import "package:flutter/material.dart";
import 'package:permission_handler/permission_handler.dart';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

const String appId = '0deef447329443ef8549b9f563c38a51';
const String token =
    '0060deef447329443ef8549b9f563c38a51IADPL65Fmb34eMWVaHgssvA8q2SaGSFd6Z3K7Y9VQc0l4wrCxmsAAAAAEAD3dRUDUqWGYQEAAQBTpYZh';

class VideoConference extends StatefulWidget {
  @override
  VideoConferenceState createState() => VideoConferenceState();
}

class VideoConferenceState extends State<VideoConference> {
  var remoteUid;
  late RtcEngine engine;
  bool localIsConnected = false;

  @override
  void initState() {
    super.initState();
    initForAgora();
  }

  Future<void> initForAgora() async {
    await [Permission.microphone, Permission.camera].request();

    engine = await RtcEngine.create(appId);

    await engine.enableVideo();
    await engine.enableAudio();

    engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
          setState(() {
            localIsConnected = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            remoteUid = null;
          });
        },
      ),
    );

    await engine.joinChannel(token, "channel1", null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agora Video Call"),
      ),
      body: Stack(
        children: [
          Center(
            child: renderRemoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: renderLocalPreview(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget renderLocalPreview() {
    if (localIsConnected) {
      return RtcLocalView.SurfaceView();
    } else {
      return Text(
        'Joining Channel, Please wait.....',
        textAlign: TextAlign.center,
      );
    }
    return RtcLocalView.SurfaceView();
  }

  Widget renderRemoteVideo() {
    if (remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: remoteUid,
      );
    } else {
      return Text(
        "Please wait remote user join",
        textAlign: TextAlign.center,
      );
    }
  }
}
