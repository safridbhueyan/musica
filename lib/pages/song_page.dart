import 'package:flutter/material.dart';
import 'package:musica/components/neu_box.dart';
import 'package:musica/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

//convert the duration in min:sec
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      // get the playlist
      final playlist = value.playlist;

      //get the current song index
      final currentSong = playlist[value.currentSongIndex ?? 0];
//return scaffold ui
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                    //title
                    const Text("P L A Y L I S T"),
                    //Menu button

                    IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                //album artwork
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(currentSong.albumArtImagePath),
                      ),

                      //song and artist name and icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //song and artist name
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentSong.songName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(currentSong.artistName)
                            ],
                          ),

                          //heart icon
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                //song duration
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //start time
                                Text(formatTime(value.currentDuration)),
                                //shuffle icon
                                Icon(Icons.shuffle),
                                //repeate icon
                                Icon(Icons.repeat),
                                //end time
                                Text(formatTime(value.totalDuration)),
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 0),
                            ),
                            child: Slider(
                              min: 0,
                              max: value.totalDuration.inSeconds.toDouble(),
                              value: value.currentDuration.inSeconds.toDouble(),
                              activeColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              onChanged: (double double) {
                                // during when the user i sliding
                              },
                              onChangeEnd: (double double) {
                                //sliding has finished, go to that position in song duration
                                value.seek(Duration(seconds: double.toInt()));
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25),

                      //playback controls

                      Row(
                        children: [
                          //skip previous
                          Expanded(
                              child: GestureDetector(
                            onTap: value.playPreviousSong,
                            child: NeuBox(
                              child: Icon(Icons.skip_previous),
                            ),
                          )),
                          SizedBox(
                            width: 25,
                          ),
                          //play pause
                          Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: value.pauseOrResume,
                                child: NeuBox(
                                  child: Icon(value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow),
                                ),
                              )),
                          SizedBox(
                            width: 25,
                          ),
                          //skip forward
                          Expanded(
                              child: GestureDetector(
                            onTap: value.playNextsong,
                            child: NeuBox(
                              child: Icon(Icons.skip_next),
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
