class TopKeywordData {
  String word;
  String explain;
  List<String> tags;
  String imgUrl;

  TopKeywordData(
    this.word,
    this.explain,
    this.tags,
    this.imgUrl,
  );

  static List<TopKeywordData> testData = [
    TopKeywordData(
      'ETF',
      '상장지수펀드(Exchange Traded Fund)의 약자로 가나다라마바사 아자차카타파하아자차카타파하아자차카타파하아자차카타파하아자차카타파하아자차카타파하',
      ['펀드', '주식'],
      'assets/img/etf.png',
    ),
    TopKeywordData(
      'ㄱㅁㄴㅇㄹ',
      '상장지수펀드(Exchange Traded Fund)의 약자로...',
      ['펀드', '주식'],
      'assets/img/etf.png',
    ),
    TopKeywordData(
      'ETF',
      '상장지수펀드(Exchange Traded Fund)의 약자로...',
      ['펀드', '주식'],
      'assets/img/etf.png',
    ),
  ];
}
