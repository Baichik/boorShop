import 'package:boor_shop/utils/constanst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final int index;
  final AsyncSnapshot<QuerySnapshot> snapshot;
  const DetailedScreen(this.index, this.snapshot, {Key? key}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0x0fffffff),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                widget.snapshot.data!.docs[widget.index].get('imageURL'),
                fit: BoxFit.cover,
                height: 350,
                width: 400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.snapshot.data!.docs[widget.index].get('name'),
                  style: textFieldInputTextStyle,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.snapshot.data!.docs[widget.index].get('price'),
                  style: textFieldInputTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.snapshot.data!.docs[widget.index].get('description'),
                style: textFieldInputTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
