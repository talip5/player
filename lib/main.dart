import 'package:flutter/material.dart';
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

  static AudioCache player = AudioCache();
  AudioPlayer advancedPlayer;
 // AudioCache audioCache;
  //AudioPlayer player;
  double rating=10;
  double rating1=20;
  String title="Player";
  int titleInt=0;
  int count=0;
  int kont2=0;
  String asenkron="Future";
  List liste=['Adaletin-Bumu-Dunya',
    'Ah-Yalan-Dunya',
    'Dusen-Hep-Yerde-Mi-Kalir',
    'Gesi-Baglari',
    'Oyle-Bir-Yerdeyim-Ki',
    'Sari-Saclim-Mavi-Gozlum'];
  String sarki='Sari-Saclim-Mavi-Gozlum';

  @override
  void initState() {
    super.initState();
   // initPlayer();
    //audioCache.load('audio.mp3');
    //player.loadAll(['explosion.mp3', 'music.mp3'])
      player.loadAll([
      'Adaletin-Bumu-Dunya.mp3',
      'Ah-Yalan-Dunya.mp3',
      'Dusen-Hep-Yerde-Mi-Kalir.mp3',
      'Gesi-Baglari.mp3',
      'Oyle-Bir-Yerdeyim-Ki.mp3',
      'Sari-Saclim-Mavi-Gozlum.mp3']);
    setState(() {
      ses();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _playFile() async{
    await player.play('S1.mp3');
   //await player.play('$sarki.mp3');
    //player=await audioCache.play('$sarki.mp3');

    print(kont2);
  }

  void _stopFile() async{
   await player.clearAll();
  }

  void pauseFile() {

  }

  void _resumeFile() {
  //  player?.resume();
  }

  void _volumeFile(double vol) {
   // player?.setVolume(vol);
  }

 /*Future<int> kontrol() async{
      kont2=await player.getCurrentPosition();
      return kont2;
  }*/

  void _state(){
   //print(player?.state);
   //print(AudioPlayerState);
   //var durum=AudioPlayerState.COMPLETED;
   //print(durum);
  // print(durum.runtimeType);
  }

  void _state1() {
     /* sarki=liste[0];
      _playFile();
      var state1 = player?.state;
      if (state1 == AudioPlayerState.PLAYING) {
        print('Playing');
      }
      else if (state1 == AudioPlayerState.COMPLETED) {
        print('Completed');
      }
      else {
        print(state1);
      }*/
      }

  Widget ses(){
    return Slider(value: rating,
      onChanged: (newRating){
        setState(() {
          rating=newRating;
          titleInt=rating.toInt();
          title=titleInt.toString();
          _volumeFile(rating/100);
        });
      },
      min: 0,
      max: 100,
    );
  }

  Widget calmaSuresi(){
    return Slider(value: rating1,

      min: 1,
      max: 100,
    );
  }
  void initPlayer() {
   /* advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);*/
  }

  Future<String> loadString() async{
    print("deneme");
    await Future.delayed(Duration(seconds: 3));
   return "String";
  }
  void tetikleme(){
    setState(() {

    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(asenkron),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: liste.length,
                itemBuilder: (context,index){
                  return Center(child:Card(
                    child: ListTile(
                      title: Text(liste[index],style: TextStyle(fontSize: 25.0),),
                   onTap: (){
                        setState(() {
                          sarki=liste[index];
                          _playFile();
                        });
                   },
                    ),
                  ));
                  },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Padding(padding:EdgeInsets.only(left:10.0)),
                 Expanded(
                   child: ElevatedButton.icon(
                      onPressed:() {
                        _playFile();
                       setState(() {
                         asenkron=asenkron;
                       });
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
                     // _pauseFile();
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
                    label: Text('Stop3',style: TextStyle(color: Colors.black,fontSize: 22.0),
                  ),
                ),
                ),
                Padding(padding:EdgeInsets.only(left:15.0)),
              ],
            ),
            ses(),
            ElevatedButton.icon(
              onPressed:() {
                _state1();
              },
              icon: const Icon(Icons.star,color: Colors.black,size: 24.0),
              label: Text('State',style: TextStyle(color: Colors.black,fontSize: 22.0),
              ),
            ),
            ElevatedButton.icon(
              onPressed:() async{
            // int aktar=await kontrol();
             //print(aktar);
             setState(() {
               //asenkron=aktar.toString();
             });
              },
              icon: const Icon(Icons.code,color: Colors.black,size: 24.0),
              label: Text('Kontrol',style: TextStyle(color: Colors.black,fontSize: 22.0),
              ),
            ),
            calmaSuresi(),
            ElevatedButton.icon(
              onPressed:() async{
               asenkron=await loadString();
               setState(() {
                 asenkron=asenkron;
               });
              },
              icon: const Icon(Icons.add,color: Colors.black,size: 24.0),
              label: Text('Deneme',style: TextStyle(color: Colors.black,fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
       );
  }
}
