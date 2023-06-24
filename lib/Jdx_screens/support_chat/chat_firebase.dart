// import 'package:flutter/material.dart';
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _textEditingController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat Support'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('messages').snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 final messages = snapshot.data!.docs.reversed;
//
//                 return ListView.builder(
//                   reverse: true,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index].data() as Map<String, dynamic>;
//
//                     return ListTile(
//                       title: Text(message['text']),
//                       subtitle: Text(message['sender']),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter a message...',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     _firestore.collection('messages').add({
//                       'text': _textEditingController.text,
//                       'sender': 'User',
//                       'timestamp': DateTime.now(),
//                     });
//
//                     _textEditingController.clear();
//                   },
//                   child: Text('Send'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }