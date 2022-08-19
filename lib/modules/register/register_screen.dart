import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hti/layout/home_layout.dart';
import 'package:hti/modules/register/cubit/cubit.dart';
import 'package:hti/modules/register/cubit/states.dart';
import 'package:hti/modules/verification_screen/verification.dart';
import 'package:hti/shared/componant/components.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var verifiedPasswordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if(state is RegisterErrorState)
            showToast(message: state.error, state: ToastStates.ERROR);


        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Register".toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.black)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Register now to get and browse our offers",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defualtTextFormField(
                            controller: nameController,
                            label: "Name ",
                            keyboardType: TextInputType.name,
                            prefixIcon:
                                Icons.drive_file_rename_outline_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "name must be not Empty ";
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        defualtTextFormField(
                            controller: emailController,
                            label: "Email Address",
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "Email must be not Empty ";
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        defualtTextFormField(
                            controller: phoneController,
                            label: "Phone",
                            prefixIcon: Icons.phone,
                            keyboardType: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "Email must be not Empty ";
                              }
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        defualtTextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            label: "Password",
                            prefixIcon: Icons.lock,
                            isobscureText:
                                RegisterCubit.get(context).isPasswordShow,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context).ChangeObscuer();
                                },
                                icon: Icon(RegisterCubit.get(context).suffix)),
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "password is too short ";
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        defualtTextFormField(
                            controller: verifiedPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            label: "Re-Password",
                            prefixIcon: Icons.lock,
                            isobscureText:
                                RegisterCubit.get(context).isRePasswordShow,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context).ChangeReObscuer();
                                },
                                icon: Icon(RegisterCubit.get(context).suffix)),
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "password is too short ";
                              }
                              if (passwordController.text !=
                                  verifiedPasswordController.text) {
                                return "password No\'t matching";
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        BuildCondition(
                          condition: state is !RegisterLoadingState,
                          builder: (context) => defualtButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text);
                                  FocusScope.of(context).unfocus();
                                }
                                if(state is CreateUserSuccessState){
                                  showToast(message: "Register Successful ", state: ToastStates.SUCCESS);

                                  navigatorTo(context, HomeLayout());

                                }
                               },
                              text: "register".toUpperCase()),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
