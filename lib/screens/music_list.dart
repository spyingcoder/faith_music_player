import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart'; //for using song model
import 'package:permission_handler/permission_handler.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key key}) : super(key: key);

  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
    //
  }

//
  final _audioQuery = OnAudioQuery();
//

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      ),
      builder: (context, item) {
        if (item.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (item.data.isEmpty) {
          return const Center(child: Text("No Songs found!"));
        }
        return Container(
          margin: const EdgeInsets.only(top: 15),
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: QueryArtworkWidget(
                  id: item.data[index].id, type: ArtworkType.AUDIO),
              title: Text(item.data[index].displayNameWOExt),
              subtitle: Text(item.data[index].artist),
              trailing: IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ),
            itemCount: item.data.length,
          ),
        );
        //
      },
    );
  }
}
