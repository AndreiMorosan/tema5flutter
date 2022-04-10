

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:temeflutter/models/app_state.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key,required this.builder}) : super(key: key);
   final ViewModelBuilder<bool> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector(builder: builder, converter: (Store<AppState> store){
      return store.state.isLoading;
    });
  }
}
