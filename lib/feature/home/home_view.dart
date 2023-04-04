import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyet_asistanim/product/utility/exception/custom_exception.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../product/models/dietitian.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _HomeListView(),
    );
  }
}

class _HomeListView extends StatelessWidget {
  const _HomeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference dietitian = FirebaseFirestore.instance.collection('dietitian');

    final response = dietitian.withConverter(
      fromFirestore: (snapshot, option) {
        return const Dietitian().fromFirebase(snapshot);
      },
      toFirestore: (value, option) {
        if(value ==null) throw FirebaseCustomException('$value not null');
        return value.toJson();
      },
    ).get();
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Dietitian?>> snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const LinearProgressIndicator();
          case ConnectionState.done:
            if(snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();

              return ListView.builder(
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(values[index]?.image ?? '',
                          height: context.dynamicHeight(.1),
                        ),
                        Text(values[index]?.name.toString() ?? '',
                            style: context.textTheme.labelLarge
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
        }
      },
    );
  }
}

