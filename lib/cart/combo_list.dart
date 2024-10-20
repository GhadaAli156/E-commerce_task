import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComboList extends StatelessWidget {
  final List<Map<String, String>> combos;
  const ComboList({super.key, required this.combos});
  @override
  Widget build(BuildContext context) {
    List<Widget> comboCards = [];
    for (var combo in combos) {
      comboCards.add(
        Expanded(
          child: Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(combo['image']!, height: 80, width: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(combo['name']!, style: const TextStyle(fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(combo['price']!, style: const TextStyle(fontSize: 16, color: Colors.orange)),
                            const Icon(CupertinoIcons.add_circled, size: 30, color: Colors.orange),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: comboCards,
    );
  }
}


