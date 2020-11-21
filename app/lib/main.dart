import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearby_connections/nearby_connections.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
        home: new SplashScreen(), debugShowCheckedModeBanner: false);
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            children: <Widget>[Image.asset('assets/images/splash-screen.png')],
          ),
          Positioned(
              top: 500,
              right: 250,
              child: new Checkbox(
                  value: false,
                  onChanged: (bool newValue) {
                    Navigator.push(
                      ctxt,
                      new MaterialPageRoute(
                          builder: (ctxt) => new RequirementsScreen()),
                    );
                  }))
        ],
      )),
    );
  }
}

class RequirementsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        // appBar: new AppBar(
        //   title: new Text("Requirements"),
        // ),
        body: SingleChildScrollView(
            child: Stack(children: [
      Column(
        children: <Widget>[
          Image.asset(
            'assets/images/requirements-and-symptoms.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(ctxt).size.width,
            // height: MediaQuery.of(ctxt).size.height,
          )
        ],
      ),
      Positioned(
          top: 175,
          right: 200,
          child: Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new Home()),
                );
              }))
    ])));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        // appBar: new AppBar(),
        body: SingleChildScrollView(
            child: Stack(children: [
      Column(
        children: <Widget>[
          Image.asset(
            'assets/images/tracker.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(ctxt).size.width,
            height: MediaQuery.of(ctxt).size.height,
          )
        ],
      ),
      Positioned(
          top: 2,
          right: 380,
          child: Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new Settings()),
                );
              })),
      Positioned(
          top: 2,
          right: 15,
          child: Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new Charts()),
                );
              })),
      Positioned(
          top: 740,
          right: 190,
          child: Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new Donate()),
                );
              }))
    ])));
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        // appBar: new AppBar(),
        body: SingleChildScrollView(
            child: Stack(children: [
      Column(
        children: <Widget>[
          Image.asset(
            'assets/images/settings-page.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(ctxt).size.width,
            height: MediaQuery.of(ctxt).size.height,
          )
        ],
      ),
      Positioned(
          top: 32,
          right: 190,
          child: Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new Home()),
                );
              })),
    ])));
  }
}

class Charts extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        // appBar: new AppBar(),
        body: SingleChildScrollView(
            child: Stack(children: [
      Column(
        children: <Widget>[
          Image.asset(
            'assets/images/charts.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(ctxt).size.width,
            height: MediaQuery.of(ctxt).size.height,
          )
        ],
      ),
      Positioned(
          top: 32,
          right: 190,
          child: Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new Home()),
                );
              }))
    ])));
  }
}

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        // appBar: new AppBar(),
        body: SingleChildScrollView(
            child: Stack(children: [
      Column(
        children: <Widget>[
          Image.asset(
            'assets/images/donations.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(ctxt).size.width,
            height: MediaQuery.of(ctxt).size.height,
          )
        ],
      ),
      Positioned(
          top: 0,
          right: 385,
          child: Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  ctxt,
                  new MaterialPageRoute(builder: (ctxt) => new Home()),
                );
              }))
    ])));
  }

  void showSnackbar(dynamic a) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(a.toString()),
    ));
  }

  /// Called upon Connection request (on both devices)
  /// Both need to accept connection to start sending/receiving
  void onConnectionInit(String id, ConnectionInfo info) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Center(
          child: Column(
            children: <Widget>[
              Text("id: " + id),
              Text("Token: " + info.authenticationToken),
              Text("Name" + info.endpointName),
              Text("Incoming: " + info.isIncomingConnection.toString()),
              RaisedButton(
                child: Text("Accept Connection"),
                onPressed: () {
                  Navigator.pop(context);
                  cId = id;
                  Nearby().acceptConnection(
                    id,
                    onPayLoadRecieved: (endid, payload) async {
                      if (payload.type == PayloadType.BYTES) {
                        String str = String.fromCharCodes(payload.bytes);
                        showSnackbar(endid + ": " + str);

                        if (str.contains(':')) {
                          // used for file payload as file payload is mapped as
                          // payloadId:filename
                          int payloadId = int.parse(str.split(':')[0]);
                          String fileName = (str.split(':')[1]);

                          if (map.containsKey(payloadId)) {
                            if (await tempFile.exists()) {
                              tempFile.rename(
                                  tempFile.parent.path + "/" + fileName);
                            } else {
                              showSnackbar("File doesnt exist");
                            }
                          } else {
                            //add to map if not already
                            map[payloadId] = fileName;
                          }
                        }
                      } else if (payload.type == PayloadType.FILE) {
                        showSnackbar(endid + ": File transfer started");
                        tempFile = File(payload.filePath);
                      }
                    },
                    onPayloadTransferUpdate: (endid, payloadTransferUpdate) {
                      if (payloadTransferUpdate.status ==
                          PayloadStatus.IN_PROGRRESS) {
                        print(payloadTransferUpdate.bytesTransferred);
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.FAILURE) {
                        print("failed");
                        showSnackbar(endid + ": FAILED to transfer file");
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.SUCCESS) {
                        showSnackbar(
                            "success, total bytes = ${payloadTransferUpdate.totalBytes}");

                        if (map.containsKey(payloadTransferUpdate.id)) {
                          //rename the file now
                          String name = map[payloadTransferUpdate.id];
                          tempFile.rename(tempFile.parent.path + "/" + name);
                        } else {
                          //bytes not received till yet
                          map[payloadTransferUpdate.id] = "";
                        }
                      }
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text("Reject Connection"),
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    await Nearby().rejectConnection(id);
                  } catch (e) {
                    showSnackbar(e);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
