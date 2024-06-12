import 'package:flutter/material.dart';

Widget? getAsyncWaitingWidget(AsyncSnapshot<dynamic> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  }
  if (snapshot.hasError) {
    return const Center(child: Text('An error occurred'));
  }
  if (!snapshot.hasData) {
    return const Center(child: Text('No data'));
  }
  return null;
}
