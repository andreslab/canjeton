import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/field_profile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Profile"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 120,
                    child: FieldProfile(),
                  ),
                  Container(
                    height: 120,
                    child: FieldProfile(),
                  ),
                  Container(
                    height: 120,
                    child: FieldProfile(),
                  ),
                  Container(
                    height: 120,
                    child: FieldProfile(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
