--Historia platnosci
SELECT Student.Imie, Student.Nazwisko, Oplaty.Przeznaczenie, Oplaty.Kwota, Oplaty.ID_Oplaty, Student.ID_Student
FROM Student INNER JOIN (Oplaty INNER JOIN Lista_oplat ON Oplaty.ID_Oplaty = Lista_oplat.ID_Oplaty) ON Student.ID_Student = Lista_oplat.ID_Student;

--Przedmioty, które już nie są aktywne
SELECT Student.Imie, Student.Nazwisko, Przedmiot.Nazwa_p, Przedmiot.ID_Typ_Przedmiotu, Semestr.Nazwa_semestr
FROM Student INNER JOIN (Semestr INNER JOIN (Przedmiot INNER JOIN ((Klasa INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) INNER JOIN Przedmioty ON Klasa.ID_Klasa = Przedmioty.ID_Klasa) ON Przedmiot.ID_Przedmiot = Przedmioty.ID_Przedmiot) ON Semestr.ID_Semestr = Klasa.ID_Semestr) ON Student.ID_Student = Klasy.ID_Student
WHERE (((Przedmioty.Status)=No));

--Nauczyciele i ich przedmioty
SELECT Nauczyciel.Imie_n AS Imie, Nauczyciel.Nazwisko_n AS Nazwisko, Nauczyciel.[Tytul/Stopien], Przedmiot.Nazwa_p AS Przedmiot, Przedmiot.ID_Typ_Przedmiotu AS Typ, Przedmioty.Status, Klasa.ID_Semestr
FROM Tytul_Stopien INNER JOIN (Semestr INNER JOIN (Przedmiot INNER JOIN ((Ranga INNER JOIN Nauczyciel ON Ranga.ID_Ranga = Nauczyciel.[Tytul/Stopien]) INNER JOIN (Klasa INNER JOIN Przedmioty ON Klasa.ID_Klasa = Przedmioty.ID_Klasa) ON Nauczyciel.ID_Nauczyciel = Przedmioty.ID_Nauczyciel) ON Przedmiot.ID_Przedmiot = Przedmioty.ID_Przedmiot) ON Semestr.ID_Semestr = Klasa.ID_Semestr) ON Tytul_Stopien.ID_TS = Ranga.ID_TS
GROUP BY Nauczyciel.Imie_n, Nauczyciel.Nazwisko_n, Nauczyciel.[Tytul/Stopien], Przedmiot.Nazwa_p, Przedmiot.ID_Typ_Przedmiotu, Przedmioty.Status, Klasa.ID_Semestr;

--Nauczyciele i przedmioty w danych klasach
SELECT Nauczyciel.ID_Nauczyciel, Przedmiot.ID_Przedmiot, Przedmioty.ID_Klasa
FROM Student INNER JOIN (Przedmiot INNER JOIN (Nauczyciel INNER JOIN ((Klasa INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) INNER JOIN Przedmioty ON Klasa.ID_Klasa = Przedmioty.ID_Klasa) ON Nauczyciel.ID_Nauczyciel = Przedmioty.ID_Nauczyciel) ON Przedmiot.ID_Przedmiot = Przedmioty.ID_Przedmiot) ON Student.ID_Student = Klasy.ID_Student
GROUP BY Nauczyciel.ID_Nauczyciel, Przedmiot.ID_Przedmiot, Przedmioty.ID_Klasa;

--Obecności poszczególnych uczniów
SELECT Student.Imie, Student.Nazwisko, Klasa.Nazwa_klasy, Kierunek.Nazwa_kierunek, Stopien.Nazwa_Stopien AS Stopien, Obecnosc.Data, Obecnosc.Modyfikacja, Status_Obecnosci.Status, Nauczyciel.Imie_n, Nauczyciel.Nazwisko_n
FROM Nauczyciel INNER JOIN (Student INNER JOIN (Stopien INNER JOIN (Status_Obecnosci INNER JOIN ((Lekcja INNER JOIN (((Kierunek INNER JOIN Klasa ON Kierunek.ID_Kierunek = Klasa.ID_Kierunek) INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) INNER JOIN LIsta_lekcji ON Klasa.ID_Klasa = LIsta_lekcji.ID_Klasa) ON Lekcja.ID_Lekcja = LIsta_lekcji.ID_Lekcja) INNER JOIN Obecnosc ON Lekcja.ID_Lekcja = Obecnosc.ID_Lekcja) ON Status_Obecnosci.ID_StatusO = Obecnosc.ID_StatusO) ON Stopien.ID_Stopien = Kierunek.ID_Stopien) ON (Student.ID_Student = Klasy.ID_Student) AND (Student.ID_Student = Obecnosc.ID_Student)) ON (Nauczyciel.ID_Nauczyciel = Obecnosc.ID_Nauczyciel) AND (Nauczyciel.ID_Nauczyciel = Obecnosc.ID_Nauczyciel);

--Otrzymywana pomoc
SELECT Student.Imie, Student.Nazwisko, Kierunek.Nazwa_kierunek AS Kierunek, Stopien.Nazwa_Stopien AS Stopien, Stypendia.Typ_st, Zapomogi.Kwota
FROM Stopien INNER JOIN (Student INNER JOIN (Kierunek INNER JOIN (Stypendia INNER JOIN Zapomogi ON Stypendia.ID_Stypendia = Zapomogi.ID_Stypednia) ON Kierunek.ID_Kierunek = Zapomogi.ID_Kierunek) ON Student.ID_Student = Zapomogi.ID_Student) ON Stopien.ID_Stopien = Kierunek.ID_Stopien;

--Przynaleznosc do klas
SELECT Student.ID_Student, Klasa.ID_Klasa
FROM Student INNER JOIN (Klasa INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) ON Student.ID_Student = Klasy.ID_Student
GROUP BY Klasa.ID_Klasa, Student.ID_Student;

--Ranking najlepszych, obronionych prac dyplomowych
SELECT Student.Imie, Student.Nazwisko, Praca_dyplomowa.Tytul_pracy, Zlozenie_pracy.Wynik
FROM Typ_pracy_dyp INNER JOIN (Student INNER JOIN (Rodzaj_p_dyp INNER JOIN (Praca_dyplomowa INNER JOIN Zlozenie_pracy ON Praca_dyplomowa.ID_pd = Zlozenie_pracy.ID_pd) ON Rodzaj_p_dyp.ID_rodzaj_p_dyp = Praca_dyplomowa.ID_rodzaj_p_dyp) ON Student.ID_Student = Zlozenie_pracy.ID_student) ON Typ_pracy_dyp.ID_typ_pracy_dyp = Praca_dyplomowa.ID_typ_pracy_dyp
WHERE (((Zlozenie_pracy.Wynik)>=50))
ORDER BY Zlozenie_pracy.Wynik DESC;

--Spis lekcji
SELECT Lekcja.ID_Lekcja, Przedmiot.Nazwa_p AS Przedmiot, Przedmiot.ID_Typ_Przedmiotu AS Typ, Godziny.START_TIME, Godziny.END_TIME, Nauczyciel.Imie_n, Nauczyciel.Nazwisko_n, Lekcja.Temat_lekcji
FROM Nauczyciel INNER JOIN (Godziny INNER JOIN (Typ_przedmiotu INNER JOIN ((Przedmiot INNER JOIN (Lekcja INNER JOIN LIsta_lekcji ON Lekcja.ID_Lekcja = LIsta_lekcji.ID_Lekcja) ON Przedmiot.ID_Przedmiot = Lekcja.ID_Przedmiot) INNER JOIN Przedmioty ON Przedmiot.ID_Przedmiot = Przedmioty.ID_Przedmiot) ON Typ_przedmiotu.ID_typ_przedmiotu = Przedmiot.ID_Typ_Przedmiotu) ON Godziny.Godzina_ID = Lekcja.ID_Godzina) ON (Nauczyciel.ID_Nauczyciel = Lekcja.ID_Nauczyciel) AND (Nauczyciel.ID_Nauczyciel = Przedmioty.ID_Nauczyciel);

--Spis przedmiotów
SELECT Student.Imie, Student.Nazwisko, Klasa.Nazwa_klasy, Klasa.ID_Semestr, Klasa.ID_Kierunek, Przedmiot.Nazwa_p, Przedmiot.ID_Typ_Przedmiotu
FROM Student INNER JOIN (Przedmiot INNER JOIN ((Klasa INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) INNER JOIN Przedmioty ON Klasa.ID_Klasa = Przedmioty.ID_Klasa) ON Przedmiot.ID_Przedmiot = Przedmioty.ID_Przedmiot) ON Student.ID_Student = Klasy.ID_Student
GROUP BY Student.ID_Student, Student.Imie, Student.Nazwisko, Klasa.ID_Klasa, Klasa.Nazwa_klasy, Klasa.ID_Semestr, Klasa.ID_Kierunek, Przedmiot.ID_Przedmiot, Przedmiot.Nazwa_p, Przedmiot.ID_Typ_Przedmiotu;

--Lista studentów danego kierunku
SELECT Student.Imie, Student.Nazwisko, Kierunek.Nazwa_kierunek AS Kierunek, Tryb.Tryb, Tryb.Sposób, Stopien.Nazwa_Stopien AS Stopein, Jezyk.Jezyk_Kod AS Jezyk
FROM Jezyk INNER JOIN (Stopien INNER JOIN (Tryb INNER JOIN (Student INNER JOIN ((Kierunek INNER JOIN Klasa ON Kierunek.ID_Kierunek = Klasa.ID_Kierunek) INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) ON Student.ID_Student = Klasy.ID_Student) ON Tryb.ID_Tryb = Kierunek.ID_Tryb) ON Stopien.ID_Stopien = Kierunek.ID_Stopien) ON Jezyk.ID_Jezyk = Kierunek.ID_Jezyk;

--Lista studentów i ich adresów
SELECT Student.Imie, Student.Nazwisko, Student.Telefon, Student.Email, Student.Data_urodzenia, Student.Data_rozp, Student.Data_zak, Adres_code.Miasto, Adres.Ulica, Adres.Nr_domu, Adres.Nr_mieszkania, Adres.Dzielnica, Adres_code.ZIP, Student.ID_akademik
FROM Wojewodztwo INNER JOIN (Student INNER JOIN ((Adres_code INNER JOIN Adres ON Adres_code.ID_adres_code = Adres.ID_adres_code) INNER JOIN Adres_Student ON Adres.ID_Adres = Adres_Student.ID_Adres) ON Student.ID_Student = Adres_Student.ID_Student) ON Wojewodztwo.ID_Wojewodztwo = Adres_code.ID_Wojewodztwa;

--Średnia ocen
SELECT Student.Imie, Student.Nazwisko, Klasa.Nazwa_klasy, Klasa.ID_Semestr, Klasa.ID_Kierunek, Avg(Ocena.Ocena) AS ŚredniaOfOcena
FROM Student INNER JOIN (Przedmiot INNER JOIN (Ocena INNER JOIN (Klasa INNER JOIN Wyniki ON Klasa.ID_Klasa = Wyniki.ID_Klasa) ON Ocena.ID_Ocena = Wyniki.ID_Ocena) ON Przedmiot.ID_Przedmiot = Wyniki.ID_Przedmiot) ON Student.ID_Student = Wyniki.ID_Student
GROUP BY Student.ID_Student, Student.Imie, Student.Nazwisko, Klasa.ID_Klasa, Klasa.Nazwa_klasy, Klasa.ID_Semestr, Klasa.ID_Kierunek;


/*Złączenie bez join, pokazujace studentów, którzy mieszkają w akademiku */
SELECT S.Imie, S.Nazwisko, A.nazwa_a
FROM Student AS S, Akademik AS A
WHERE S.ID_Akademik=[A].[ID_akademik];

/*Studenci, którzy mieli zmodyfikowaną ocenę, wyższą od 3, w przeciągu ostatniego tygodnia*/
SELECT Student.Imie, Student.Nazwisko, Klasa.Nazwa_klasy, Przedmiot.Nazwa_p, Przedmiot.ID_Typ_Przedmiotu, Wyniki.Data_modyfikacji, Wyniki.ID_Ocena
FROM Ocena INNER JOIN (Student INNER JOIN (Przedmiot INNER JOIN (Klasa INNER JOIN Wyniki ON Klasa.ID_Klasa = Wyniki.ID_Klasa) ON Przedmiot.ID_Przedmiot = Wyniki.ID_Przedmiot) ON Student.ID_Student = Wyniki.ID_Student) ON Ocena.ID_Ocena = Wyniki.ID_Ocena
WHERE Wyniki.Data_modyfikacji BETWEEN Date() AND Date()-8 AND Ocena.Ocena>3;

/*Lista studentów i ich przedmiotów, których typ zaczyna się na W (Wykład) */
SELECT Student.Imie, Student.Nazwisko, Przedmiot.Nazwa_p, Klasa.Nazwa_klasy, Semestr.Nazwa_semestr, Kierunek.Nazwa_kierunek
FROM Typ_przedmiotu INNER JOIN (Student INNER JOIN (Semestr INNER JOIN ((Forma_Zaliczenia INNER JOIN Przedmiot ON Forma_Zaliczenia.ID_Forma = Przedmiot.ID_Forma_Zaliczenia) INNER JOIN (((Kierunek INNER JOIN Klasa ON Kierunek.ID_Kierunek = Klasa.ID_Kierunek) INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) INNER JOIN Przedmioty ON Klasa.ID_Klasa = Przedmioty.ID_Klasa) ON Przedmiot.ID_Przedmiot = Przedmioty.ID_Przedmiot) ON Semestr.ID_Semestr = Klasa.ID_Semestr) ON Student.ID_Student = Klasy.ID_Student) ON Typ_przedmiotu.ID_typ_przedmiotu = Przedmiot.ID_Typ_Przedmiotu
WHERE (((Typ_przedmiotu.Typ_Przedmiotu) Like 'W*'))
GROUP BY Student.Imie, Student.Nazwisko, Przedmiot.Nazwa_p, Klasa.Nazwa_klasy, Semestr.Nazwa_semestr, Kierunek.Nazwa_kierunek;

/*Zapytanie nieskorelowane, wyświetlające studentów z akademika o id = 7 */
SELECT S.Imie, S.Nazwisko
FROM Student AS S INNER JOIN Akademik ON S.ID_akademik = Akademik.ID_akademik
WHERE (((S.ID_akademik)=(SELECT A.ID_akademik FROM Akademik A WHERE A.ID_akademik = 7)));

/*Zapytanie skorelowane*/
SELECT Imie, Nazwisko
FROM (SELECT Imie, Nazwisko FROM Student) as t1
WHERE Imie = 'Stefan';

/*Lista nauczycieli, którzy nie mają wpisane dzielnicy (jest null) */
SELECT Nauczyciel.Imie_n, Nauczyciel.Nazwisko_n
FROM Nauczyciel INNER JOIN (Wojewodztwo INNER JOIN ((Adres_code INNER JOIN Adres ON Adres_code.ID_adres_code = Adres.ID_adres_code) INNER JOIN Adres_Nauczyciel ON Adres.ID_Adres = Adres_Nauczyciel.ID_Adres) ON Wojewodztwo.ID_Wojewodztwo = Adres_code.ID_Wojewodztwa) ON Nauczyciel.ID_Nauczyciel = Adres_Nauczyciel.ID_Nauczyciel
WHERE Adres.Dzielnica IS NULL ;

/*Zapytanie negatywne, wyświetlające studentów bez wystawionej oceny*/
SELECT Student.Imie, Student.Nazwisko
FROM Student 
WHERE Student.ID_Student NOT IN (SELECT ID_Student FROM Wyniki);

/*Zapytanie negatywne, które wyświetla studentów bez kursu*/
SELECT S.Imie, S.Nazwisko
FROM Student S LEFT JOIN Kurs_student K ON S.ID_Student = K.ID_Student
WHERE K.ID_Student IS NULL;

/*Użycie widoku*/
CREATE VIEW [~sq_cU_DodajWynik~sq_cID_Ocena] AS SELECT [Ocena].[ID_Ocena], [Ocena].[Ocena_tekst], [Ocena].[Ocena]
FROM Ocena;

/*Usuwanie z tabeli*/
ALTER TABLE Student DROP COLUMN WHERE Student.ID_Student=20;

/*Aktualizacja*/
UPDATE Student
SET Telefon = 725-234-021, Data_zak = Date()
WHERE ID_Student = 2;