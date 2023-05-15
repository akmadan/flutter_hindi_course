import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateTodoPage extends StatefulWidget {
  final String title;
  final String desscription;
  final String todoDocId;
  const UpdateTodoPage(
      {super.key,
      required this.title,
      required this.desscription,
      required this.todoDocId});

  @override
  State<UpdateTodoPage> createState() => _UpdateTodoPageState();
}

class _UpdateTodoPageState extends State<UpdateTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.title;
    descriptionController.text = widget.desscription;
    super.initState();
  }

  User? currUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update TODO'),
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
                          child: Text('Update TODO'),
                          onPressed: () async {
                            if (currUser != null) {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(currUser!.uid)
                                  .collection('todos')
                                  .doc(widget.todoDocId)
                                  .update({
                                'title': titleController.text,
                                'description': descriptionController.text
                              });
                            }
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
