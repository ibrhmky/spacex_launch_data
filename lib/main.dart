import 'package:flutter/material.dart';
import 'connection/connect.dart';
import 'models/spacexModel.dart';

void main() => runApp(SpaceXApp());

class SpaceXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LatestLaunchPage(),
    );
  }
}

class LatestLaunchPage extends StatefulWidget {

  @override
  _LatestLaunchPageState createState() => _LatestLaunchPageState();
}

class _LatestLaunchPageState extends State<LatestLaunchPage> {
  Future<SpacexMod> spacexModData;

  @override
  void initState() {
    super.initState();
    spacexModData = fetchLatestLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SpaceX Launch Data"),
        ),
    body: Center(
        child: new FutureBuilder<SpacexMod>(
          future: spacexModData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container( child: new LinearProgressIndicator());
            SpacexMod space = snapshot.data;
            return Center(
              child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child:Text(space.name, style: TextStyle(fontSize: 24),),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          child:
                          new Image.network(
                            space.patch,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child:Text(space.details, style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
            );
          },
        )
      )
    );
  }
}

