import 'dart:async';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import '../Receipt.dart';

const String appId = '0deef447329443ef8549b9f563c38a51';
const String token =
    '0060deef447329443ef8549b9f563c38a51IAB7DxihN4EI487rAoO9eMqGvMNblCRiKHGlu5JjAnGSeTfn3+AAAAAAEADsTG0XXJabYQEAAQBelpth';
const String channel = "vet";

class VideoConference extends StatefulWidget {
  @override
  VideoConferenceState createState() => VideoConferenceState();
}

class VideoConferenceState extends State<VideoConference> {
  var remoteUid;
  late RtcEngine engine;
  bool localIsConnected = false;
  Stopwatch stopWatch = new Stopwatch();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    initForAgora();

    _timer = new Timer.periodic(new Duration(milliseconds: 10), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    // destroy sdk
    engine.leaveChannel();
    engine.destroy();
    super.dispose();
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
          stopWatch.start();
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
        leaveChannel: (stats) => {
          setState(() {
            print('Leaving channel');
          })
        }
      ),
    );

    await engine.joinChannel(token, channel, null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VetCall Video Conference"),
      ),
      body: Stack(
        children: [
          Center(
            child: renderRemoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    formatTime(stopWatch.elapsedMilliseconds),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle:  FontStyle.normal,
                        fontSize: 25
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    formatPrice(stopWatch.elapsedMilliseconds),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "HelveticaNeue",
                        fontStyle:  FontStyle.normal,
                        fontSize: 25
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: renderLocalPreview(),
              ),
            ),
          ),
          _toolbar(),
        ],
      ),
    );
  }

  Widget _toolbar() {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: RawMaterialButton(
          onPressed: () => _onCallEnd(context),
          child: Icon(
            Icons.call_end,
            color: Colors.white,
            size: 35.0,
          ),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.redAccent,
          padding: const EdgeInsets.all(15.0),
        ),
    );
  }

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  String formatPrice(int milliseconds) {
    final secondPrice = 500/60/60;
    var secs = milliseconds ~/ 1000;
    final price = (secondPrice * secs).toStringAsFixed(2);
    return "$price DKK";
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
  }

  void _onCallEnd(BuildContext context) {
    stopWatch.stop();
    Duration time = stopWatch.elapsed;
    int seconds = time.inSeconds;
    Navigator.push(context, MaterialPageRoute(builder: (_) => Receipt(seconds: seconds,)));
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
