import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

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

  // void myFunction() {
  //   print('My function running');
  // }

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
          return GestureDetector(
            // onTap: myFunction,
            onTap: () {
              //print('print anything');
              //move to another screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageScreen(
                    url: urls[index],
                  ),
                ),
              );
            },
            child: Card(
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
            ),
          );
        },
      ),
    );
  }
}

// class TapableContainer extends StatefulWidget {
//   TapableContainer({Key? key}) : super(key: key);

//   @override
//   State<TapableContainer> createState() => _TapableContainerState();
// }

// class _TapableContainerState extends State<TapableContainer> {
//   Color color = Colors.red;

//   void changeColor() {
//     // print(color);
//     if (color == Colors.red)
//       color = Colors.green;
//     else
//       color = Colors.red;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GestureDetector(
//         onTap: changeColor,
//         child: Container(
//           height: 150,
//           width: 150,
//           color: color,
//         ),
//       ),
//     );
//   }
// }

class ImageScreen extends StatefulWidget {
  ImageScreen({Key? key, this.url}) : super(key: key);

  final String? url;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  bool isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              widget.url!,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!isDownloading)
                    IconButton(
                      onPressed: () async {
                        setState(() {
                          isDownloading = true;
                        });
                        final response = await Dio().get(widget.url!,
                            options: Options(responseType: ResponseType.bytes));
                        final result = await ImageGallerySaver.saveImage(
                            Uint8List.fromList(response.data),
                            quality: 100,
                            name: 'Myimagename23455');
                        if (result['isSuccess'] == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Image saved successfuly'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Image not saved, Somwthing went wrong'),
                            ),
                          );
                        }
                        setState(() {
                          isDownloading = false;
                        });
                      },
                      icon: Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                    ),
                  if (isDownloading) CircularProgressIndicator(),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          // height: 160,
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.wallpaper),
                                title: Text("Set as home screen wallpaper"),
                              ),
                              ListTile(
                                leading: Icon(Icons.lock),
                                title: Text("Set as lock screen wallpaper"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.wallpaper,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      // Center(
      //   child: Text('Image screen'),
      // ),
      // body: TapableContainer(),
    );
  }
}

// class ColorfulContainer extends StatelessWidget {
//   const ColorfulContainer({Key? key, this.color}) : super(key: key);

//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Container(
//           height: 100,
//           width: 100,
//           color: index % 2 == 0 ? Colors.red : Colors.blue,
//         );
//       },
//     );
//   }
// }
