import 'package:boor_shop/screens/detailed_screen.dart';
import 'package:boor_shop/utils/constanst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('feeds').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return body(context, snapshot);
          } else {
            return const Center(
              child: Text(
                'No goods',
                style: buttonTextStyle,
              ),
            );
          }
        },
      ),
    );
  }

  Widget body(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data!.docs.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailedScreen(index, snapshot))),
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                    snapshot.data!.docs[index].get('imageURL'),
                    fit: BoxFit.cover,
                    height: 350,
                    width: 400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  snapshot.data!.docs[index].get('name'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'San-Francisco',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6A6A),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  snapshot.data!.docs[index].get('price'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'San-Francisco',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D6A6A),
                    letterSpacing: 1.2,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('feeds')
                        .doc(snapshot.data!.docs[index].id)
                        .delete();
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
