import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_show_snack_bar.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/views/widgets/add_data_view_body.dart';

class AddDataViewBodyBlocConsumer extends StatelessWidget {
  const AddDataViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          return customShowSnackBar(context, 'Add product done');
        }
        if (state is AddProductFailure) {
          return customShowSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: AddDataViewBody(),
        );
      },
    );
  }
}
