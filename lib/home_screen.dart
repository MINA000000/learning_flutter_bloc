import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg2/login_screen.dart';
import 'package:gg2/widgets/gradient_button.dart';

import 'bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthInitial){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginScreen()), (route)=>false);
          }
        },
        builder: (context, state) {
          if(state is AuthLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('This is home screen'),),
              SizedBox(height: 15,),
              GradientButton(onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutRequested());
              })
            ],
          );
        },
      ),
    );
  }
}
