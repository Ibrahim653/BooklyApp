import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildImagePlaceholder(context),
              ),
              const SizedBox(width: 20),
              _buildContentPlaceholder(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    return Container(
      width: 100.0,
      height: 140.0,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  Widget _buildContentPlaceholder(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20.0),
          _buildTextPlaceholder(context),
          const SizedBox(height: 25.0),
          _buildTextPlaceholder(context),
          const SizedBox(height: 25.0),
          _buildSquarePlaceholder(context),
        ],
      ),
    );
  }

  Widget _buildTextPlaceholder(BuildContext context) {
    return Container(
      width: _calculateWidth(context, 0.6), // Use _calculateWidth method
      height: 15.0,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }

  Widget _buildSquarePlaceholder(BuildContext context) {
    return Container(
      width: _calculateWidth(context, 0.3), // Use _calculateWidth method
      height: 15.0,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }

  double _calculateWidth(BuildContext context, double multiplier) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * multiplier;
  }
}
