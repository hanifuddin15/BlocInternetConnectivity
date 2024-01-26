import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_test_with_bloc/bloc/internet_connetivity_bloc.dart';

class InternetConnectionScrenn extends StatelessWidget {
  const InternetConnectionScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: BlocConsumer<InternetConnetivityBloc, InternetConnetivityState>(
          listener: (context, state) {
             if (state is InternetConnetivityGainedState){
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                  content: Text("You are now Connected to the Internet :)",

                  ),
                  backgroundColor: Colors.greenAccent,

                  ) ,
                  
                );
            }
else if (state is InternetConnetivityLostState){
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                  content: Text("Your Internet Connection is lost",
                  
                  ),
                  backgroundColor: Colors.redAccent,

                  ) ,
                  
                );
            }
            else{
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                  content: const Text("Your Internet is Loading.",
                  
                  ),
                  backgroundColor: Colors.yellowAccent,

                  ) ,
                  
                );
            }
          },
          builder: (context, state) {
            if (state is InternetConnetivityGainedState){
              return const Text(
                "You are now Connected to the Internet :)"
              );
            }
else if (state is InternetConnetivityLostState){
              return const Text(
                "Your Internet is Lost  :("
              );
            }
            else{
              return const Text(
                "Your Internet is Loading......()"
              );
            }
          },
        ),
      )),
    );
  } 


}
