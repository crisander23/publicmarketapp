import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/home_screen.dart';
import 'package:flutterapp/Screens/login_screen.dart';
import 'package:flutterapp/Screens/upload_data.dart';
import 'package:flutterapp/Screens/setup_screen.dart';
import 'package:flutterapp/Screens/settings_screen.dart';
import 'package:flutterapp/Screens/download_data.dart';
import 'package:flutterapp/Screens/profile_screen.dart';
import 'package:flutterapp/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DownloadData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 40, /// set the color of the AppBar buttons
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 50, 0),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png', // replace this with the path to your image
                height: 60, // set the height of the image
              ),
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 80,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/marketbanner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('AMBULANT COLLECTION ',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.cloud_download),
                title: Text('DOWNLOAD DATA',
                    style: TextStyle(color: Colors.black)),
                onTap: () {
                  // /
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => DownloadData()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.cloud_upload),
                title:
                Text('UPLOAD DATA', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => UploadData()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text('SET UP', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SetUp()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('SETTINGS', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SettingsScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('PROFILE', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()),
                  );
                },
              ),
              Divider(), // Add a divider before the Logout button
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('LOGOUT', style: TextStyle(color: Colors.black)),
                onTap: () {
                  //
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'AMBULANT COLLECTION',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF03519D), // set the color to a solid color hex code
                borderRadius: BorderRadius.circular(25),
              ),
              child: MaterialButton(
                minWidth: 200,
                child: Text(
                  'DOWNLOAD DATA',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //
                },
              ),
            ),
          ],
        ),
      ),


    );
  }
}

//
//
// class DownloadData extends StatefulWidget {
//   @override
//   _DownloadDataState createState() => _DownloadDataState();
// }
//
// class _DownloadDataState extends State<DownloadData> {
//   List<dynamic> tableData = [];
//
//   Future<void> _getTableData() async {
//     final response = await http.get(Uri.parse(baseURL + '/users'));
//     final data = jsonDecode(response.body);
//     setState(() {
//       tableData = data;
//     });
//
//     // Save the data to a file
//     final file = File('users.json');
//     file.writeAsStringSync(response.body);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getTableData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Table Data'),
//       ),
//       body: ListView.builder(
//         itemCount: tableData.length,
//         itemBuilder: (BuildContext context, int index) {
//           final rowData = tableData[index];
//           return ListTile(
//             title: Text(rowData['name']),
//             subtitle: Text(rowData['email']),
//           );
//         },
//       ),
//     );
//   }
// }