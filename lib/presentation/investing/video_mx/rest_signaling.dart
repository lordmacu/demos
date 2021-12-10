import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class RestSignaling {
  final String serverUrl =
      'https://ec2-3-131-108-71.us-east-2.compute.amazonaws.com:8080';
  // final String serverUrl = 'http://192.168.0.3:8080';
  final String offerEndpoint = '/offer';
  String id;
  Function(MediaStream) onLocalStream;
  Function onIceComplete;
  Function onConnected;
  Function onResponse;
  Function onCompleted;
  Function onIceCandidate;
  Function onOffer;

  /// executes when an error is encountered, string is the error
  Function(String) onError;
  RTCPeerConnection pc;

  MediaStream _localStream;
  RTCVideoRenderer renderer = RTCVideoRenderer();

  Map<String, dynamic> _iceServers = {
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'},
      /*
       * turn server configuration example.
      {
        'url': 'turn:123.45.67.89:3478',
        'username': 'change_to_real_user',
        'credential': 'change_to_real_secret'
      },
       */
    ]
  };

  final Map<String, dynamic> _config = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true},
    ],
  };

  Future<MediaStream> _createStream() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth':
              '720', // Provide your own width, height and frame rate here
          'minHeight': '1280',
          'minFrameRate': '30',
        },
        // 'facingMode': 'user',
        'optional': [],
      }
    };

    var stream = await MediaDevices.getUserMedia(mediaConstraints);
    renderer.srcObject = stream;
    return stream;
  }

  dispose() async {
    print("Dispose....");
    _localStream.getVideoTracks().forEach((element) {
      element.dispose();
    });
    _localStream.getAudioTracks().forEach((element) {
      element.dispose();
    });
    await _localStream.dispose();
    await pc.close();
    await pc.dispose();
  }

  makeCall(String pId) async {
    id = pId;
    renderer.initialize();
    var config = {"sdpSemantics": 'unified-plan'};
    var peerCon = await createPeerConnection(_iceServers, _config);
    pc = peerCon;
    peerCon.createDataChannel("test", RTCDataChannelInit());
    var localStream = await _createStream();
    _localStream = localStream;
    pc.addStream(localStream);
    onLocalStream(localStream);
    peerCon.onIceCandidate = (candidate) {
      print("onIceCandidate");
    };
    peerCon.onIceConnectionState = (state) {
      switch (state) {
        case RTCIceConnectionState.RTCIceConnectionStateConnected:
          print('================================');
          print("ICE CONNECTION: CONNECTED!!!!!!!");
          print('================================');
          print('================================');
          print("ICE CONNECTION: CONNECTED!!!!!!!");
          print('================================');
          print('================================');
          print("ICE CONNECTION: CONNECTED!!!!!!!");
          print('================================');
          onConnected();
          break;
        case RTCIceConnectionState.RTCIceConnectionStateFailed:
          print('================================');
          print("ICE CONNECTION: ERROR!!!!!!!");
          print('================================');
          onError("Error con ICE. Por favor vuelva a intentarlo");
          break;

        case RTCIceConnectionState.RTCIceConnectionStateDisconnected:
          print('================================');
          print("ICE CONNECTION: ERROR!!!!!!!");
          print('================================');
          onError(
              "Ocurrió un error mientras se enviaba el vídeo. Por favor vuelva a intentarlo");
          break;
        default:
      }

      onIceCandidate();
      print("ICE CONNECTION STATE CHANGE");
      print(state);
      print('================================');
    };

    peerCon.onIceGatheringState = (state) {
      onIceCandidate();
      print('================================');
      print("ICE GATHERING STATE CHANGE");
      print('================================');
      print(state);

      if (state == RTCIceGatheringState.RTCIceGatheringStateComplete) {
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        print("ICE COMPLETE!!!!");
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        onIceCandidate();
        // sendOffer();
        onIceComplete();
      }
      if (state == RTCIceGatheringState.RTCIceGatheringStateGathering) {
        Future.delayed(Duration(seconds: 2)).then((value) => sendOffer());
      }
    };
    var offer = await pc.createOffer({});
    print('===========================');
    print("Offer Created: ");
    print(offer);
    print('===========================');
    pc.setLocalDescription(offer);
    onIceCandidate();
  }

  sendOffer() async {
    var offer = await pc.getLocalDescription();
    Map offerData = {
      "sdp": offer.sdp,
      "type": offer.type,
      "video_transform": 'No transform',
      "id": id,
    };
    print('===========================');
    print("SENDING OFFER to $serverUrl$offerEndpoint");
    print('===========================');
    bool timeout = false;
    var client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    var ioClient = IOClient(client);
    try {
      var response = await ioClient
          .post(
        "$serverUrl$offerEndpoint",
        body: json.encode(offerData),
      )
          .timeout(Duration(seconds: 10), onTimeout: () {
        timeout = true;
        return Response("", 404);
      });
      onOffer();
      if (timeout) {
        onError("Error: El servidor no está disponible");
        return;
      }

      print('===========================');
      print("response:");
      print('===========================');
      Map resMap = json.decode(response.body);
      onResponse();
      print(resMap);
      String sdp = resMap['sdp'];
      String type = resMap['type'];
      pc.setRemoteDescription(RTCSessionDescription(sdp, type));
    } catch (e) {
      onError("Error inesperado: ${e.toString()}");
    }
  }
}
