import 'package:ems/view/Dashboard/Organization_Dashboard/models/review.dart';
import 'package:flutter/material.dart';
import 'star_rating.dart';

class ReviewSection extends StatelessWidget {
  final List<Review> reviews = [
    Review(username: 'John Doe', rating: 4, comment: 'Great platform!'),
    Review(username: 'Jane Smith', rating: 5, comment: 'Excellent customer support.'),
    Review(username: 'Emily Johnson', rating: 3, comment: 'Good, but needs improvements.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reviews.map((review) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    review.username,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                StarRating(rating: review.rating),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(review.comment),
            ),
          ),
        );
      }).toList(),
    );
  }
}
