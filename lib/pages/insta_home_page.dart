import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InstaHomePage extends StatefulWidget {
  const InstaHomePage({super.key});

  @override
  State<InstaHomePage> createState() => _InstaHomePageState();
}

class _InstaHomePageState extends State<InstaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            // Stories
            Container(
                padding: const EdgeInsets.all(4),
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                'https://pbs.twimg.com/media/BduTxWnIUAAKT_5.jpg'),
                            backgroundColor:
                                index % 2 == 0 ? Colors.red : Colors.black,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('username')
                        ],
                      ),
                    );
                  },
                )),

            Expanded(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey.shade200
                            )
                          )
                        ),
                        margin: const EdgeInsets.only(top: 12),
                        height: 400,
                        child: Column(children: [
                          Container(
                            height: 46,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'elena_username',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://media.wired.com/photos/59268c83cfe0d93c474309b0/4:3/w_929,h_697,c_limit/BSP_HP.jpg'))),
                          )),
                          Container(
                            height: 46,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite_border)), 
                                     IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.send_outlined)), 
                                     IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.comment_bank_outlined)), 
                                    Spacer(), 
                                     IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.bookmark_add_outlined))
                              ],
                            ),
                          ),
                        ]),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
