import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashbord/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashbord/core/services/get_it_sevice.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/views/widgets/add_data_view_body_bloc_consumer.dart';


class AddDataView extends StatelessWidget {
  const AddDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Add Prudct'),
      body: BlocProvider(
        create: (context) => AddProductCubit(
           getIt.get<ProductsRepo>(),
          getIt.get<ImagesRepo>(),
         
        ),
        child: AddDataViewBodyBlocConsumer()
      ),
    );
  }
}
