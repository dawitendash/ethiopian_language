// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// class VideoCallScreen extends StatefulWidget {
//   final String userId;
//   final String userName;
//   final String callId;

//   const VideoCallScreen({
//     super.key,
//     required this.userId,
//     required this.userName,
//     required this.callId,
//   });

//   @override
//   _VideoCallScreenState createState() => _VideoCallScreenState();
// }

// class _VideoCallScreenState extends State<VideoCallScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final appId = dotenv.env['APP_ID'];
//     final appSign = dotenv.env['APP_SIGN'];

//     if (appId == null || appSign == null) {
//       return const Scaffold(
//         body: Center(
//           child: Text('Error: Missing ZEGOCLOUD credentials in .env file'),
//         ),
//       );
//     }

//     return ZegoUIKitPrebuiltCall(
//       appID: int.parse(appId),
//       appSign: appSign,
//       userID: widget.userId,
//       userName: widget.userName,
//       callID: widget.callId,
//       config:
//           ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
//             ..turnOnCameraWhenJoining = true
//             ..turnOnMicrophoneWhenJoining = true
//             ..useSpeakerWhenJoining = true
//             ..layout = ZegoLayout.pictureInPicture(
//               isSmallViewDraggable: true,
//               switchLargeOrSmallViewByClick: true,
//             ),
//     );
//   }
// }
