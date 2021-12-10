import 'package:flutter/material.dart';

void main() {
  runApp(const WallE());
}

class WallE extends StatelessWidget {
  const WallE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyGrid()),
    );
  }
}

final urls = [
  'https://picsum.photos/id/237/1080/1920',
  'https://picsum.photos/id/1016/1080/1920',
  'https://picsum.photos/id/1021/1080/1920',
  'https://picsum.photos/id/1022/1080/1920',
  'https://picsum.photos/id/1023/1080/1920',
  'https://picsum.photos/id/1024/1080/1920',
  'https://picsum.photos/id/1025/1080/1920',
  'https://picsum.photos/id/1015/1080/1920',
  'https://picsum.photos/id/1002/1080/1920',
  'https://picsum.photos/id/1003/1080/1920',
  'https://picsum.photos/id/10/1080/1920',
  'https://picsum.photos/id/1049/1080/1920',
];

class MyGrid extends StatelessWidget {
  const MyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        10,
        16,
        0,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 9 / 16,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                // color: index % 3 == 0 ? Colors.red : Colors.blue,
                child: Image.network(
                  urls[index],
                ),
                // Center(
                //   child: Text('${index + 100}'),
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorfulContainer extends StatelessWidget {
  const ColorfulContainer({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 100,
          color: index % 2 == 0 ? Colors.red : Colors.blue,
        );
      },
    );
  }
}
