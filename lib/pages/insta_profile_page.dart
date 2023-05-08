import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hindi_course/widgets/insta_profile_display_number_widget.dart';

class InstaProfilePage extends StatefulWidget {
  const InstaProfilePage({super.key});

  @override
  State<InstaProfilePage> createState() => _InstaProfilePageState();
}

class _InstaProfilePageState extends State<InstaProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'akshitmadan_',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Display Information
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 40,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    InstaProfileDisplayNumberWidget(
                                        count: '14.4K', label: 'Followers'),
                                    InstaProfileDisplayNumberWidget(
                                      count: '23',
                                      label: 'Following',
                                    ),
                                    InstaProfileDisplayNumberWidget(
                                      count: '34',
                                      label: 'Posts',
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                height: 30,
                                width: double.maxFinite,
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text('Follow')),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Akshit Madan'),
                        Text('A Flutter Developer'),
                        Text('www.akshitmadan.com')
                      ],
                    ),
                  )
                ],
              ),
            ),

            // Highlights
            Container(
                padding: const EdgeInsets.all(4),
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            index % 2 == 0 ? Colors.red : Colors.black,
                      ),
                    );
                  },
                )),

            // Profile Grid
            Expanded(
              child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.black,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
