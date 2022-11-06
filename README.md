# LosowaniePrezentow
Losowanie, kto komu robi prezenty na swieta

WERSJA 1.0

Zasada dzialania jest nastepujaca:
1) do tabeli OSOBY dodajemy wszystkich zainteresowanych, którzy chcą wziąć udział w zabawie
2) do tabeli ZABRONIONEPARY dodajemy zabronione kombinacje, aby nie mogły zostać ze sobą powiązane
3) na koniec - do tabeli WYNIKLOSOWANIA dodawane są wyniki oraz w konsoli DBMS_OUTPUT podawany jest czas losowania i jego wynik per osoba.

W tabeli OSOBY ujęta jest kolumna na adres e-mail - można w przyszłości rozbudować funkcjonalność o wysyłanie bezpośrednio maila do osób zainteresowanych o wyniku losowania.
