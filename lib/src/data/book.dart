
import 'author.dart';

class Book {
  final int id;
  final String title;
  final Author author;
  final bool isPopular;
  final bool isNew;

  Book(this.id, this.title, this.author, this.isPopular, this.isNew);
}
