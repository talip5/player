import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  AudioPlayer player;

  AudioPlayer audioPlayer=AudioPlayer();

  String url1='https://server1.indiryuklemp3.org/mp3_files/adca9be4cf0cc55186c07c0ba7a256b8.mp3';
  String url2='https://server1.indiryuklemp3.org/mp3_files/0d7221163c71a4d6c55a5492c4858c0f.mp3';

  @override
  void initState() {
    super.initState();
      }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

    void play1() async{
    int result=await audioPlayer.play(url2);
    //int result=await audioPlayer.play('https://server1.indiryuklemp3.org/mp3_files/0d7221163c71a4d6c55a5492c4858c0f.mp3');
    //int result=await audioPlayer.play('https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3');
    if(result==1){
      print('success');
    }
  }

  void _stopFile() async{
    int result=await audioPlayer.stop();
    if(result==1){
      print('Stop');
    }
  }

  void _pauseFile() async{
    int result=await audioPlayer.pause();
    if(result==1){
      print('Stop');
    }
  }

  void seek() async{
    int result=await audioPlayer.seek(Duration(seconds: 30));
    if(result==1){
      print('Seek');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                 SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Padding(padding:EdgeInsets.only(left:10.0)),
                 Expanded(
                   child: ElevatedButton.icon(
                      onPressed:() {
                        play1();
                      },
                      icon: const Icon(Icons.play_arrow,color: Colors.black,size: 24.0,),
                      label: Text('Play',style: TextStyle(color: Colors.black,fontSize: 22.0),
                        maxLines: 2,
                      ),
                ),
                 ),
                Padding(padding:EdgeInsets.only(left:10.0)),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed:() {
                      _pauseFile();
                    },
                    icon: const Icon(Icons.pause,color: Colors.black,size: 24.0),
                    label: Text('Pause',style: TextStyle(color: Colors.black,fontSize: 22.0),
                    ),
                  ),
                ),
                Padding(padding:EdgeInsets.only(left:10.0)),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed:() {
                      _stopFile();
                    },
                    icon: const Icon(Icons.stop,color: Colors.black,size: 24.0),
                    label: Text('Stop',style: TextStyle(color: Colors.black,fontSize: 22.0),
                  ),
                ),
                ),
                Padding(padding:EdgeInsets.only(left:15.0)
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed:() {
                seek();
              },
              icon: const Icon(Icons.settings_ethernet,color: Colors.black,size: 24.0),
              label: Text('Seek',style: TextStyle(color: Colors.black,fontSize: 22.0),
              ),
            ),
            Padding(padding:EdgeInsets.only(left:15.0)),
          ],
        ),
      ),
       );
  }
}
