import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiddendrawer/drawer.dart';

class MainPage extends DrawerContent {
  MainPage({Key key, this.title});
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  HiddenDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = HiddenDrawerController(
      initialPage: MainPage(
        title: 'main',
      ),
      items: [
        DrawerItem(
          text: Text('Home', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: MainPage(
            title: 'Home',
          ),
        ),
        DrawerItem(
          text: Text(
            'Gallery',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.photo_album, color: Colors.white),
          page: MainPage(
            title: 'Gallery',
          ),
        ),
        DrawerItem(
          text: Text(
            'Favorites',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.favorite, color: Colors.white),
          page: MainPage(
            title: 'Favorites',
          ),
        ),
        DrawerItem(
          text: Text(
            'Notification',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.notifications, color: Colors.white),
          page: MainPage(
            title: 'Notification',
          ),
        ),
        DrawerItem(
          text: Text(
            'Invite',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.insert_invitation, color: Colors.white),
          page: MainPage(
            title: 'invite',
          ),
        ),
        DrawerItem(
          text: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: MainPage(
            title: 'SETTINGS',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiddenDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Container(
                // height: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 5)),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: MediaQuery.of(context).size.width * 0.6,
                child: ClipOval(
                  child: Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      'https://scontent.fktm7-1.fna.fbcdn.net/v/t1.0-9/48405358_683680282028761_2233474687176802304_n.jpg?_nc_cat=111&_nc_oc=AQnJcz3nmJPgqG0Koen6EyPPOQktub5ubjD7KdFTstGLQRNrKupGp3hOZ-twJGEK2fM&_nc_ht=scontent.fktm7-1.fna&oh=caed7075e39bcdcd38b333395161516d&oe=5DD670D5',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Siddhartha joshi',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.deepPurple[500], Colors.purple[500], Colors.purple],
            // tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
