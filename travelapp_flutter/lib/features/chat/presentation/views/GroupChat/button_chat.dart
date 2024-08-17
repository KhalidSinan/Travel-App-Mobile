// import 'package:flutter/material.dart';
// import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
// import 'package:socket_io_client/socket_io_client.dart' as Io;
// import 'package:travelapp_flutter/features/chat/presentation/views/group_chat.dart';

// class ButtonChat extends StatefulWidget {
//   const ButtonChat({super.key});

//   @override
//   State<ButtonChat> createState() => _ButtonChatState();
// }

// Map<String, dynamic> options = {
//   "transports": ['websocket'],
//   "autoConnect": false,
// };

// class _ButtonChatState extends State<ButtonChat> {
//   late Io.Socket socket;
//   String? errorMessage;
//   final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
//       GlobalKey<ScaffoldMessengerState>();

//   @override
//   void initState() {
//     super.initState();
//     socket = Io.io(
//       "https://272f-149-34-244-138.ngrok-free.app/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE2YTgxMTBjY2NmZWI3ZmZlNTk4M2Q0NCIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkF5bGEiLCJsYXN0X25hbWUiOiJEdUJ1cXVlIn0sImlhdCI6MTcyMzUzNDMwOH0.K-NmxLmYaGzsBVpVGfqUHSW45rlbKdP20u81dQnyRLc",
//       options,
//     );
//     socket.connect();

//     socket.onConnect((_) {
//       print('connected with the server');
//     });

//     socket.emit('join-chat', "66bb029ddd35aaff48468f70");

//     socket.on('chat-error', (data) {
//       print("Error occurred: $data");
//       setState(() {
//         errorMessage = data['message'];
//       });
//     });

//     socket.onDisconnect((_) {
//       print('disconnected from the server!');
//     });
//   }

//   void _handleButtonPressed() async {
//     await Future.delayed(const Duration(milliseconds: 100));

//     if (errorMessage != null) {
     
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Row(
//             children: [
//               const Icon(Icons.error, color: Colors.red),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   errorMessage!,
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: Colors.red[100],
//         ),
//       );
//     } else {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => GroupChat(socket: socket,)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldMessengerKey,
//       body: Center(
//         child: CustomTextButton(
//           onPressed: _handleButtonPressed,
//           label: "Test",
//         ),
//       ),
//     );
//   }
// }
