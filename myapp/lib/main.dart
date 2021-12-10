import 'package:flutter/material.dart';

//--------------------------------------
//bootcamp day 3 code
void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             height: 100,
//             width: 100,
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }

//---------------------------------------------
//bootcamp day 4 code

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnyColorContainer(
          myColor: Colors.black,
        ),
      ),
    );
  }
}

class AnyColorContainer extends StatelessWidget {
  const AnyColorContainer({Key? key, this.myColor}) : super(key: key);

  final Color? myColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: myColor,
      ),
    );
  }
}

class GreenContainer extends StatelessWidget {
  const GreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.green,
      ),
    );
  }
}

class ShowVertically extends StatelessWidget {
  const ShowVertically({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Myname(),
        BlueContainer(),
      ],
    );
  }
}

class ShowHorizontally extends StatelessWidget {
  const ShowHorizontally({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Myname(),
        BlueContainer(),
      ],
    );
  }
}

class BlueContainer extends StatelessWidget {
  const BlueContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      ),
    );
  }
}

class Myname extends StatelessWidget {
  const Myname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My name is Satyam',
      ),
    );
  }
}



















//myname
//horizomtaly
//vertically
//green color
//custom color
//tapable cont stateless
//tapable stateful
//overflow
//listview

//app bar
//widget catalogue share https://docs.flutter.dev/development/ui/widgets