import 'package:flutter/material.dart';
import 'package:musica/components/my_drawer.dart';
import 'package:musica/models/playlist_provider.dart';
import 'package:musica/models/song.dart';
import 'package:musica/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the playlist provider

  late final dynamic playlistProvider;
  @override
  void initState() {
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goTosong(int songIndex) {
    //update the current song
    playlistProvider.currentSongIndex = songIndex;
    //navigate to song page
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("P L A Y L I S T"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(builder: (context, value, child) {
        //get the playlist
        final List<Song> playlist = value.playlist;
        //return list view items UI
        return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              //get individual song
              final Song song = playlist[index];
              //return list tile UI
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goTosong(index),
              );
            });
      }),
    );
  }
}
