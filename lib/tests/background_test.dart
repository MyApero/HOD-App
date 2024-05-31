import 'package:flutter/material.dart';

class BackgroundTest extends StatelessWidget {
  const BackgroundTest({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Scaffold.of(context).appBarMaxHeight!;
    // print("Height: $height");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Test'),
      ),
      body:
          // body: SingleChildScrollView(
          //   // child: Container(),
          Stack(
        //     alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 400,
          ),
          //       Container(
          //         margin: const EdgeInsets.all(20),
          //         color: Color.fromARGB(255, 29, 26, 26),
          //         child:
          // SingleChildScrollView(
          //   child: ConstrainedBox(
          //     constraints: BoxConstraints(
          //       maxHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
          //     ),
          Column(
            children: [
              Container(
                color: Colors.purple,
                width: 150,
                height: 150,
              ),
              Text("App HOD",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              const SizedBox(
                height: 100,
              ),
              Container(
                color: Colors.green,
                width: 50,
                height: 50,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        color: Colors.red,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        color: Colors.yellow,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        color: Colors.green,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        color: Colors.blue,
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  // child: SingleChildScrollView(
                  //   child: Column(
                  //     children: [
                  //       Container(
                  //         color: Colors.red,
                  //         width: 50,
                  //         height: 200,
                  //       ),
                  //       Container(
                  //         color: Colors.yellow,
                  //         width: 50,
                  //         height: 200,
                  //       ),
                  //       Container(
                  //         color: Colors.green,
                  //         width: 50,
                  //         height: 200,
                  //       ),
                  //       Container(
                  //         color: Colors.blue,
                  //         width: 50,
                  //         height: 200,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
