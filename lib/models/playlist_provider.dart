import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musica/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs

  final List<Song> _playlist = [
    Song(
      songName: "Hollywoods Bleeding",
      artistName: "Post Malone",
      albumArtImagePath: "assets/image/posty.jpg",
      audioPath: "audio/bleeding.mp3",
    ),
    Song(
      songName: "Ghetto christmas",
      artistName: "Xxxtentacion",
      albumArtImagePath: "assets/image/x2.jpg",
      audioPath: "audio/ghetto.mp3",
    ),
    Song(
      songName: "Hate me",
      artistName: "lil yachty ft. ian",
      albumArtImagePath: "assets/image/hate.jpg",
      audioPath: "audio/Lil_Hate_Me.mp3",
    ),
    Song(
      songName: "On the road",
      artistName: "Post Malone",
      albumArtImagePath: "assets/image/posty3.jpg",
      audioPath: "audio/ontheroad.mp3",
    ),
    Song(
      songName: "Sad!",
      artistName: "Xxxtentacion",
      albumArtImagePath: "assets/image/x.jpg",
      audioPath: "audio/sad.mp3",
    ),
    Song(
      songName: "Miss You",
      artistName: "Cashmere Cat, Major Lazer, Tory Lanez",
      albumArtImagePath: "assets/image/cash.jpg",
      audioPath: "audio/cashmarecat.mp3",
    ),
    Song(
      songName: "Lucid Dreams",
      artistName: "Juice WRLD",
      albumArtImagePath: "assets/image/j2.jpg",
      audioPath: "audio/dream.mp3",
    ),
    Song(
      songName: "Fingers blue",
      artistName: "Smokepurp ft. Travis scott",
      albumArtImagePath: "assets/image/fingers.jpg",
      audioPath: "audio/fingersblue.mp3",
    ),
    Song(
      songName: "Gospel",
      artistName: "Xxxtentacion ft Rich brain",
      albumArtImagePath: "assets/image/Gospel.jpg",
      audioPath: "audio/gospal.mp3",
    ),
    Song(
      songName: "I want it that way",
      artistName: "Backstreetboys",
      albumArtImagePath: "assets/image/datway.jpg",
      audioPath: "audio/iwantitdatway.mp3",
    ),
    Song(
      songName: "Sad!",
      artistName: "Xxxtentacion",
      albumArtImagePath: "assets/image/x.jpg",
      audioPath: "audio/sad.mp3",
    ),
    Song(
      songName: "Legends",
      artistName: "Juice WRLD",
      albumArtImagePath: "assets/image/Legends.jpg",
      audioPath: "audio/legend.mp3",
    ),
    Song(
      songName: "Love me harder",
      artistName: "The weeknd ft. Ariana",
      albumArtImagePath: "assets/image/lovemeharder.jpg",
      audioPath: "audio/lovemeharder.mp3",
    ),
    Song(
      songName: "Gang gang",
      artistName: "Migos",
      albumArtImagePath: "assets/image/Culture.png",
      audioPath: "audio/migogangang.mp3",
    ),
    Song(
      songName: "Benz truck",
      artistName: "lil peep",
      albumArtImagePath: "assets/image/peep.jpg",
      audioPath: "audio/pep.mp3",
    ),
    Song(
      songName: "Take what you want",
      artistName: "Post Malone",
      albumArtImagePath: "assets/image/posty3.jpg",
      audioPath: "audio/takewhatuwant.mp3",
    ),
    Song(
      songName: "November Rain",
      artistName: "Kris wu",
      albumArtImagePath: "assets/image/nvmrain.jpg",
      audioPath: "audio/Kris_Wu_November.mp3",
    ),
    Song(
      songName: "July",
      artistName: "Kris wu",
      albumArtImagePath: "assets/image/july.jpg",
      audioPath: "audio/Kris_Wu_July.mp3",
    ),
    Song(
      songName: "Juice",
      artistName: "Kris wu",
      albumArtImagePath: "assets/image/juice.jpg",
      audioPath: "audio/Kris_Wu_juice.mp3",
    ),
    Song(
      songName: "Trap",
      artistName: "Saint John",
      albumArtImagePath: "assets/image/trap.jpg",
      audioPath: "audio/trapsaintjohn.mp3",
    ),
  ];

  int? _currentSongIndex;

/*

    a u d i o  p l a y e r

*/

//audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
//duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
//constructor
  PlaylistProvider() {
    listenToDuration();
  }

//initially not playing
  bool _isPlaying = false;

//play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop current song
    await _audioPlayer.play(AssetSource(path)); //play new song
    _isPlaying = true;
    notifyListeners();
  }

//pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

//resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

//pause or resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

//seek specifice position
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

//play next song
  void playNextsong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if its not the last song
        currentSongIndex = currentSongIndex! + 1;
      } else {
        //if its the last song ,loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

//play previous song
  void playPreviousSong() {
    //if its more than 2 sec passed restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if its within first 2 sec of song , go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        //if its the first song loop back to the last
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

//listen to duraion
  void listenToDuration() {
//listen for total duration
    _audioPlayer.onDurationChanged.listen(
      (newDuration) {
        _totalDuration = newDuration;
        notifyListeners();
      },
    );
//listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
//listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextsong();
    });
  }
//dispose of the audio player

//getters

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

//setter
  set currentSongIndex(int? newIndex) {
//update current song
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play(); //play the song at the new index
    }
    //update UI
    notifyListeners();
  }
}
