import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/views/widgets/add_data_view_body.dart';

class AddDataView extends StatelessWidget {
  const AddDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Add Prudct'),
      body: AddDataViewBody(),
    );
  }

  
}