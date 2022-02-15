import 'package:flutter/material.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key key}) : super(key: key);

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Loading..."),
          CircularProgressIndicator(
            // strokeWidth: 6.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
