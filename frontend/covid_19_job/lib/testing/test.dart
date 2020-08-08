import 'package:covid_19_job/utils/get_devide_info.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_job/utils/get_local_data.dart';
class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  String myHash = 'initial';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("testing"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
             RaisedButton(
               elevation: 15,
               child: Text('add key'),
               onPressed: (){
                 addKey();
               },
             ),
            RaisedButton(
              elevation: 20,
              child: Text('get key'),
              onPressed: (){
                getKey();
              },
            ),
            RaisedButton(
              elevation: 20,
              child: Text('update key'),
              onPressed: (){
                updateKey();
              },
            ),
            Text(
              GetDeviceInfo.DeviceId
            )
          ],
        )
      ),
    );
  }
  addKey(){
    print(GetLocalData.AddHash("some dommy hash"));
  }
  getKey(){
print(GetLocalData.GetUserHash().then((value){
  print(value);
  setState(() {
    myHash = value;
  });
}));
  }
  updateKey(){
    print(GetLocalData.UpdateHash("some new hash"));
  }
}
