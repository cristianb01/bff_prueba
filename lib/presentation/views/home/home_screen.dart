import 'package:bff_prueba/presentation/views/home/widgets/relevant_talents_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11, right: 4),
                  child: Icon(
                    Icons.star,
                    size: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text('Buscar'),
                )
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          Image.asset('assets/images/bff-logo.png')
        ],
      ),
      body: RelevantTalentsWidget(),
    );
  }
}
