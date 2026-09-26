import 'package:app/core/feature/api/http_api.dart';
import 'package:app/core/theme/App_colors.dart';
import 'package:flutter/material.dart';

class UserViewDio extends StatelessWidget {
  const UserViewDio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.textColor2,
        centerTitle: true,
        title: Text(
          'user info',
          style: TextStyle(
            color: AppColors.text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getuser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("No users found"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var user = snapshot.data![index];

              return Column(
                children: [
                  Text("id: ${user.id}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text("firstName: ${user.firstName}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text("lastName: ${user.lastName}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Text("age: ${user.age}",style: TextStyle(color: AppColors.text,fontSize: 30,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
                ],
              );
            },
          );
        },
      ),
    );
  }
}