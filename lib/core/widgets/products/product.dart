import 'package:flutter/material.dart';
import 'package:vordic_admin/core/models/product.dart';
import 'package:vordic_admin/core/theme/app_palette.dart';
import 'package:vordic_admin/core/widgets/products/product_details.dart';
import 'package:page_transition/page_transition.dart';

product({required Product product, required BuildContext context}) => InkWell(
      onTap: () => context.pushTransition(
        type: PageTransitionType.fade,
        child: ProductDetails(product: product),
      ),
      child: SizedBox(
        width: 150,
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppPalette.greyColor,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Hero(
                  tag: product.id,
                  child: Material(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
