import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "SETTINGS",
          style: Theme.of(context).textTheme.headlineMedium,
        ),

      ),
      body:  Center(
        child: Column(
          children: [
            const Image(image: AssetImage("assets/Animation/sammy-line-searching.gif")),
            const SizedBox(height: 10,),
            Text("Not Implemented Yet...", style: Theme.of(context).textTheme.headlineSmall,)
          ],
        ),
      ),
    );
  }
}
