
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hti/layout/home_layout.dart';
import 'package:hti/modules/login/cubit/cubit.dart';
import 'package:hti/modules/login/cubit/states.dart';
import 'package:hti/modules/register/register_screen.dart';
import 'package:hti/shared/componant/components.dart';
import 'package:hti/shared/componant/constant.dart';
import 'package:hti/shared/network/local/cache_helper.dart';


class LoginScreen extends StatelessWidget {
  var formKey =GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
    child: BlocConsumer<LoginCubit,LoginStates>(
      listener:(context, state) {
        if(state is  LoginSuccessState){
             CacheHelper.saveData(key: "uId", value: state.uId ).then((value) {
               print(uId);

              navigatorToReplacement(context, HomeLayout());

            });


        }if(state is LoginErrorState)
          showToast(message: state.error, state:ToastStates.ERROR);




      },
        builder: (context,state)=>Scaffold(
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
                      Text("Login".toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Login now to get and browse our offers",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defualtTextFormField(
                          controller: emailController,
                          label: "Email Address",
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
                          onFieldSubmitted: (value){
                          },
                          controller: passwordController,
                          label: "Password",
                          prefixIcon: Icons.lock,

                          isobscureText: LoginCubit.get(context).isPasswordShow,
                          suffixIcon: IconButton(onPressed: (){
                            LoginCubit.get(context).ChangeObscuer();

                          }, icon: Icon(LoginCubit.get(context).suffix)),
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "password is too short ";
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      BuildCondition(
                        condition: state is! LoginLoadingState  ,
                        builder: (context)=>defualtButton(onPressed: () {
                          if(formKey.currentState!.validate()){
                            LoginCubit.get(context).userLogin(email: emailController.text, password: passwordController.text);
                            FocusScope.of(context).unfocus();


                          }
                        }, text: "login".toUpperCase()),
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text(
                            "Don\'t have an account ?",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          TextButton(
                            onPressed: () {
                              navigatorTo(context, RegisterScreen());
                            },
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

    ),
    ) ;

  }
}
