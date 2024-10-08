class BookData {
  final double id;
  final String title;
  final double price;
  final String publisher;
  final String publishedAt;

  BookData(
    this.id,
    this.title,
    this.price,
    this.publisher,
    this.publishedAt,
  );

  static List<BookData> testData = [
    BookData(1, 'title', 20000, '출판사', '2024-10-03'),
  ];
}
