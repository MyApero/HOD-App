import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Theme.of(context).colorScheme.primary,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
            width: double.infinity,
            height: 300,
            child: Container(
              padding: EdgeInsets.fromLTRB(25, 5, 0, 5),
              child: Column(
                children: [
                  const Text(
                    "Carte de \"Status\"",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: 180,
                    child: Row(
                      children: [
                         Container(
                          color: Colors.yellow,
                          height: 180,
                          width: 220,
                          child: const Column(
                            children: [
                              Text("salut"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(),
                  Row(),
                ],
              ),
            )),
      ),
    );
  }
}
