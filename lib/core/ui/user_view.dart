import 'package:app/core/feature/api/http_api.dart';
import 'package:app/core/theme/App_colors.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.textColor2,
        centerTitle: true,
        title: Text(
          'User Info',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: getuser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No users found'),
            );
          }

          var users = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text("id: ${users[index].id}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text("firstName: ${users[index].firstName}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text("lastName: ${users[index].lastName}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text("age: ${users[index].age}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}