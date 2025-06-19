import 'package:bloc_1/visibility_bloc/visibility_bloc.dart';
import 'package:bloc_1/visibility_bloc/visibility_event.dart';
import 'package:flutter/material.dart';
import 'package:bloc_1/visibility_bloc/visibity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_1/Bloc/counter_bloc.dart';
import 'package:bloc_1/Bloc/counter_event.dart';
import 'package:bloc_1/Bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: BlocProvider(
      //   create: (_) => CounterBloc(),
      //   child: const MyHomePage(title: 'Counter using BLoC'),
      // ),
      home: MultiBlocProvider(
        providers: [
           BlocProvider(
        create: (_) => CounterBloc(),),
         BlocProvider(
        create: (_) => VisibilityBloc(),),

        ],
         child:const MyHomePage(title: 'Counter using BLoC'), ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // final countBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            BlocConsumer<CounterBloc, CounterState>(
               listener: (context,state){
                  if(state.count==3){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("count is 3"))); 
                  }
               },
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
            ),
            BlocBuilder<VisibilityBloc,VisibityState>(
              builder: (context, state) {
              return Visibility(
                visible: state.show,
                child: Container(
                  color: Colors.purple,
                  width: 200,
                  height: 200,                        
              ));
              }
            ),
            // BlocListener<CounterBloc,CounterState>(
            //   listener: (context,state){
            //       if(state.count==3){
            //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("count is 3"))); 
            //       }
            //   },
            //   child:Text("Bloc Listener")
            //   ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  iconSize: 40,
                  onPressed: () {
                    context.read<CounterBloc>().add(CountDecrementEvent());
                  },
                ),
                const SizedBox(width: 30),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  iconSize: 40,
                  onPressed: () {
                     context.read<CounterBloc>().add(CountIncrementEvent());
                  },
                ),
                TextButton(onPressed: (){
                  context.read<VisibilityBloc>().add(VisibilityShowEvent());
                },
                 child: Text("show")),
                 TextButton(onPressed: (){
                    context.read<VisibilityBloc>().add(VisibilityHideEvent());
                 },
                  child: Text("Hide"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
