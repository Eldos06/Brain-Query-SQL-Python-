from abc import ABC, abstractmethod

class User:
    def __init__(self, user_id: int, name: str, email: str):
        self.user_id = id
        self.name = name
        self.email = email

class Deck:
    def __init__(self, deck_id: int, title: str, cards: list | None = None):
        self.deck_id = deck_id
        self.title = title
        self._cards: list[Card] = cards or []

    def add_card(self, card: "Card"):
        self._cards.append(card)

    def remove_card(self, card: "Card"):
        self._cards.remove(card)

    def __len__(self):
        return len(self._cards)




# how difficult this card
# for ex: one card is we good remember that we multiply good value 3 * 10(min), after 30 min we can again learn it!
class Rating:
    """
    again / hard / good / easy -> multiplication of intervals (condition steps)
    """
    def __init__(self, again: int = 0, hard: int = 2, good: int = 5, easy: int = 20):
        self.again = again
        self.hard  = hard
        self.good  = good
        self.easy  = easy

    def next_interval(self, grade: str) -> int:
        grade = grade.lower()
        intervals = {
            'again': self.again * 10,
            'hard' : self.hard  * 10,
            'good' : self.good  * 10,
            'easy' : self.easy  * 10
        }

        if grade not in intervals:
            raise ValueError(f'Unknown grade')

        return intervals[grade]


class Card(ABC):
    def __init__(self, card_id: int, front: str, back: str):
        self.card_id = card_id
        self._front = front
        self._back = back

    @abstractmethod
    def show_front(self) -> str:
        ...

    @abstractmethod
    def show_back(self)  -> str:
        ...


    def check_answer(self, user_answer: str) -> bool:
        ...


class Basic(Card):
    """ Simple card that has front - back """
    def show_front(self) -> str:
        return self._front

    def show_back(self) -> str:
        return self._back


class BasicReverso(Basic):
    def show_front(self) -> str:
        return self._back

    def back(self):
        return self._front

class Cloze(Card, Rating):
    def __init__(self, card_id: int, front: str, back: str, rating: Rating | None = None):
        super().__init__(card_id, front, back)
        self.rating = rating or Rating()

    def show_front(self) -> str:
        #front, example: "Paris is the capital of ___"
        return self._front

    def show_back(self) -> str:
        return self._back

    def check_answer(self, user_answer: str) -> bool:
        return user_answer.strip().lower() == self._back.strip().lower()

    def review(self, grade: str) -> int:
        """Gets grade (again, hard, good, easy)
        and returns interval for next repetition"""
        return self.rating.next_interval(grade)

## to use User class
yeldos2 = User(1, 'Yeldos', '240116042@sdu.edu.kz')
azizbek = User(2, 'Azizbek', '240116021@sdu.edu.kz')

deckYeldos2 = Deck(1, 'English', [] )
deckAzizbek = Deck(2, 'Math', [] )







