// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// import 'video_call.dart';

// class RequestUsername extends StatefulWidget {
//   const RequestUsername({super.key});

//   @override
//   _RequestUsernameState createState() => _RequestUsernameState();
// }

// class _RequestUsernameState extends State<RequestUsername> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _callIdController = TextEditingController();

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _callIdController.dispose();
//     super.dispose();
//   }

//   Future<bool> _validateCallId(String callId) async {
//     final doc =
//         await FirebaseFirestore.instance.collection('calls').doc(callId).get();
//     return doc.exists;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Join Language Lesson')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter your username',
//                   border: const OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a username';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _callIdController,
//                 decoration: InputDecoration(
//                   labelText: 'Enter Call ID',
//                   border: const OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.grey[100],
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a call ID';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     final callId = _callIdController.text;
//                     final isValid = await _validateCallId(callId);
//                     if (isValid) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (context) => VideoCallScreen(
//                                 userId: const Uuid().v4(),
//                                 userName: _usernameController.text,
//                                 callId: callId,
//                               ),
//                         ),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Invalid Call ID')),
//                       );
//                     }
//                   }
//                 },
//                 child: const Text('Join Video Call'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
