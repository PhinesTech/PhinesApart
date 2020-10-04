import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
}
