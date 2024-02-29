import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'bloc/bloc/api_call_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.id});
  final int id;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late ApiCallBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ApiCallBloc>(context);
    bloc.add(SecondApiCallEvent(widget.id));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(const MyHomePage());
            },
            child: const Text("Screen 2")),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = ApiCallBloc();
  @override
  void initState() {
    bloc.add(FetchHomeApiCallEvent(26));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      bloc.add(FetchHomeApiCallEvent(26));
                      log("message");
                    },
                    child: const Text("Click me"))),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                if (state is SuccessApiCall) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.homeScreenModel.shopData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(BlocProvider.value(
                              value: bloc,
                              child: MyWidget(
                                id: state.homeScreenModel.shopData[index].id,
                              ),
                            ));
                          },
                          child: ListTile(
                            title: Text(
                                state.homeScreenModel.shopData[index].name),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is RequestApiCall) {
                  return const CircularProgressIndicator();
                }
                return const Text("no data found");
              },
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Screen 2")),
          ],
        ),
      ),
    );
  }
}
