import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[800]!;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result= await Navigator.pushNamed(context, '/location');
                        if(result != null){
                          setState(() {
                            data = {
                              'time' : result['time'],
                              'location' : result['location'],
                              'isDaytime' : result['isDaytime'],
                              'flag' : result['flag'],
                            };
                          });
                        }
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text('Edit Location',
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.0,
                        color: Colors.grey[300],
                      )
                      ),
            
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 34.0,
                          letterSpacing: 2.0,
                          color : Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      color : Colors.white,
                    ),
                  ),
            
            
                ],
              ),
            ),
          )
      ),
    );
  }
}
