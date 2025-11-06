import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_text_from_field.dart';

class AddDataViewBody extends StatefulWidget {
  const AddDataViewBody({super.key});

  @override
  State<AddDataViewBody> createState() => _AddDataViewBodyState();
}

class _AddDataViewBodyState extends State<AddDataViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController prudctnamecontroller = TextEditingController();
  final TextEditingController prudctPricecontroller = TextEditingController();
  final TextEditingController prudctCodecontroller = TextEditingController();
  final TextEditingController prudctDescriptioncontroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: prudctnamecontroller,
              hintText: 'prudct name',
            ),
            CustomTextFormField(
              controller: prudctPricecontroller,
              hintText: 'prudct price',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              controller: prudctCodecontroller,
              hintText: 'prudct code',
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              controller: prudctDescriptioncontroller,
              hintText: 'prudct Description',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
