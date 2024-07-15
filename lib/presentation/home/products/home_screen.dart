import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/core/di/di.dart';
import 'package:route_task/presentation/home/products/view_model/product_cubit.dart';
import 'package:route_task/presentation/home/products/widget/Product_widget.dart';
 import 'package:route_task/presentation/home/products/widget/custom_filed.dart';

import '../../../core/utils/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductVeiwModel>()..Getpro(),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/images/route.png"),),
        body: Padding(
          padding:   REdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomField(),
              SizedBox(height: 20,),
              BlocBuilder<ProductVeiwModel,HomesStates>(
                  builder:   (context, state) {
                    if(state is HomesErrorState){
                      return Center(child: Text("${state.error}"),);
                    }
                    if(state is HomesSuccessState){
                      return     Expanded(
                        child: GridView.builder(
                           scrollDirection: Axis.vertical,

                          itemBuilder: (context, index) => ProductWidget(state.products[index]),
                          itemCount: state.products.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.h,
                            childAspectRatio: 3 / 4,
                            mainAxisSpacing: 16.h

                          ),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
              )

                ],
          ),
        ),
      ),
    );
  }
}
