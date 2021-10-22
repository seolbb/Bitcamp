package chapter6;

class SutdaDeck {

	final int CARD_NUM = 20;
	SutdaCard2[] cards = new SutdaCard2[CARD_NUM];

	SutdaDeck() {
		for (int i = 0; i < cards.length; i++) {
			int num = i % 10 + 1;
			boolean isKwang = (i < 10) && (num == 1 || num == 3 || num == 8);
			cards[i] = new SutdaCard2(num, isKwang);
		}
	}

	// 배열 cards에 담긴 카드의 위치를 뒤섞는다.(Math.random()사용)
	void shuffle() {
		for (int i = 0; i < cards.length * 2; i++) {
			int a = (int) (Math.random() * cards.length);
			int b = (int) (Math.random() * cards.length);

			SutdaCard2 tmp = cards[a];
			cards[a] = cards[b];
			cards[b] = tmp;

		}
	}

		// 배열 cards에서 지정된 위치의 SutdaCard를 반환한다.
	SutdaCard2 pick(int index) {
		if(index < 0 || index > cards.length) {
			return null;
		}
		return cards[index];
	}

		// 배열 cards에서 임의의 위치의 SutdaCard를 반환한다.(Math.random()사용)
	SutdaCard2 pick() {
		int index = (int)(Math.random()*cards.length);
		return pick(index);
	}


}
