import 'dart:async';

import 'package:flutter/material.dart';

import 'item.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final List items = [];
  var lastCodeSelected = '';

  @override
  void initState() {
    items.addAll(Item.getLevel1());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flip Cart',
          style: TextStyle(color: Colors.pinkAccent),
        ),
      ),
      body: Column(
        children: [
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            shrinkWrap: true,
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (_, index) {
              final item = items[index];
              if (item.isFlip) {
                return imageNew(index, item);
              }
              return imageW(item: item);
            },
          ),
          GestureDetector(
            onTap: () {
              print('con cu');
              reSet();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.yellow),
              child: const Text(
                'RESET',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageW({required Item item}) {
    return GestureDetector(
      onTap: () {
        print('${item.code}');
        item.isFlip = true;
        print('$lastCodeSelected');
        final count = (items.where((item) =>
            item.isFlip == false && item.code == lastCodeSelected)).length;
        if (count == 0 || item.code == lastCodeSelected) {
          print('mở');
          lastCodeSelected = item.code;
        } else {
          print('đóng');
          lastCodeSelected = '';
          item.isFlip = true;
          Future.delayed(
            const Duration(seconds: 1),
            () {
              for (final item in items) {
                item.isFlip = false;
              }
              setState(() {});
            },
          );
        }
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          '?',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 60,
          ),
        ),
      ),
    );
  }

  Widget imageNew(int index, Item item) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          item.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void reSet() {
    for (final item in items) {
      item.isFlip = false;
    }
    setState(() {});
  }
}
