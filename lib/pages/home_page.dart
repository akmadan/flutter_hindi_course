import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  User? currUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple TODO'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 200,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: 'Enter TODO Title'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    decoration:
                        InputDecoration(hintText: 'Enter TODO Description'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text('Save'),
                          onPressed: () async {
                            if (currUser != null) {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(currUser!.uid)
                                  .collection('todos')
                                  .add({
                                'title': titleController.text,
                                'description': descriptionController.text
                              });
                            }
                          }))
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(currUser!.uid)
                    .collection('todos')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(docs[index]['title']),
                            subtitle: Text(docs[index]['description']),
                          );
                        }));
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
