import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_show_snack_bar.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_text_from_field.dart';
import 'package:fruits_hub_dashbord/features/add_data/domain/entites/product_entity.dart';
import 'package:fruits_hub_dashbord/features/add_data/domain/entites/review_entity.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/cubits/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/views/widgets/is_featured_product_box.dart';
import 'package:fruits_hub_dashbord/features/add_data/presentation/views/widgets/is_organic_check_box.dart';

class AddDataViewBody extends StatefulWidget {
  const AddDataViewBody({super.key});

  @override
  State<AddDataViewBody> createState() => _AddDataViewBodyState();
}

class _AddDataViewBodyState extends State<AddDataViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price, expirationsMonths, unitAmount, numberOfCalories;
  File? image;
  bool isChecked = false;
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextFormField(
              onSaved: (value) {
                name = value!;
              },

              hintText: 'prudct name',
            ),
            CustomTextFormField(
              onSaved: (value) {
                price = num.parse(value!);
              },

              hintText: 'prudct price',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              onSaved: (value) {
                expirationsMonths = num.parse(value!);
              },

              hintText: ' expirationsMonths',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              onSaved: (value) {
                unitAmount = num.parse(value!);
              },

              hintText: 'unitAmount',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              onSaved: (value) {
                numberOfCalories = num.parse(value!);
              },

              hintText: 'numberOfCalories',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              onSaved: (value) {
                code = value!.toLowerCase();
              },

              hintText: 'prudct code',
            ),
            CustomTextFormField(
              onSaved: (value) {
                description = value!;
              },

              hintText: 'prudct Description',
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IsFeaturedProductBox(
                isChecked: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IsOrganciCheckBox(
                isOrganic: isOrganic,
                onChanged: (value) {
                  setState(() {
                    isOrganic = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ImageField(
                onFileChanged: (File? value) {
                  this.image = value;
                },
              ),
            ),
            SizedBox(height: 24),
            CustomButton(
              text: 'Add product',
              onPressed: () {
                if (image != null) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ProductEntity input = ProductEntity(
                         reviewsModel: [
                          ReviewEntity(
                            name: 'tharwat',
                            image:
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeautiful%2F&psig=AOvVaw19xjUBre0RXfV2IZ-cEAEV&ust=1726749821993000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPCJ3L_CzIgDFQAAAAAdAAAAABAE',
                            ratting: 5,
                            date: DateTime.now().toIso8601String(),
                            reviewDescription: 'Nice product',
                          )
                        ],
                      name: name,
                      code: code,
                      description: description,
                      price: price,

                      isFeatured: isChecked,
                      expirationsMonths: expirationsMonths.toInt(),
                      isOrganic: isOrganic,
                      numberOfCalories: numberOfCalories.toInt(),
                      unitAmount: unitAmount.toInt(),
                      
                      image: image!,
                    );
                    context.read<AddProductCubit>().addProduct(input);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                } else {
                 customShowSnackBar(context,'Please select an image');
                }
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
