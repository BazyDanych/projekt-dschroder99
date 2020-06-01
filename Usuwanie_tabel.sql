DROP INDEX [ID_Adres]
	ON [Adres] ([ID_Adres]);
DROP INDEX [ID_adres_code]
	ON [Adres] ([ID_adres_code]);
DROP INDEX [ID_adres_code]
	ON [Adres_code] ([ID_adres_code]);
DROP INDEX [Adres_NauczycielID_Adres]
	ON [Adres_Nauczyciel] ([ID_Adres]);
DROP INDEX [ID_Nauczyciel]
	ON [Adres_Nauczyciel] ([ID_Nauczyciel]);
DROP INDEX [Adres_StudentID_Adres]
	ON [Adres_Student] ([ID_Adres]);
DROP INDEX [Adres_StudentID_Student]
	ON [Adres_Student] ([ID_Student]);
DROP INDEX [ID_Adres]
	ON [Akademik] ([ID_Adres]);
DROP INDEX [ID_akademik]
	ON [Akademik] ([ID_akademik]);
DROP INDEX [ID_Adres]
	ON [Dziekan] ([ID_Adres]);
DROP INDEX [Jezyk_Kod]
	ON [Jezyk] ([Jezyk_Kod]);
DROP INDEX [ID_Jezyk]
	ON [Kierunek] ([ID_Jezyk]);
DROP INDEX [ID_Kierunek]
	ON [Kierunek] ([ID_Kierunek]);
DROP INDEX [ID_Stopien]
	ON [Kierunek] ([ID_Stopien]);
DROP INDEX [ID_Tryb]
	ON [Kierunek] ([ID_Tryb]);
DROP INDEX [ID_Wydzial]
	ON [Kierunek] ([ID_Wydzial]);
DROP INDEX [ID_Student]
	ON [Kierunki] ([ID_Student]);
DROP INDEX [ID_Wydzial]
	ON [Kierunki] ([ID_Wydzial]);
DROP INDEX [KierunkiID_Kierunek]
	ON [Kierunki] ([ID_Kierunek]);
DROP INDEX [ID_Kierunek]
	ON [Klasa] ([ID_Kierunek]);
DROP INDEX [ID_Klasa]
	ON [Klasa] ([ID_Klasa]);
DROP INDEX [ID_Semestr]
	ON [Klasa] ([ID_Semestr]);
DROP INDEX [ID_Klasa]
	ON [Klasy] ([ID_Klasa]);
DROP INDEX [ID_Student]
	ON [Klasy] ([ID_Student]);
DROP INDEX [ID_kurs]
	ON [Kurs] ([ID_kurs]);
DROP INDEX [ID_Nauczyciel]
	ON [Kurs_nauczyciel] ([ID_Nauczyciel]);
DROP INDEX [Kurs_nauczycielID_kurs]
	ON [Kurs_nauczyciel] ([ID_Kurs]);
DROP INDEX [ID_Student]
	ON [Kurs_student] ([ID_Student]);
DROP INDEX [ID_kurs]
	ON [Kurs_student] ([ID_kurs]);
DROP INDEX [ID_Godzina]
	ON [Lekcja] ([ID_Godzina]);
DROP INDEX [ID_Lekcja]
	ON [Lekcja] ([ID_Lekcja]);
DROP INDEX [ID_Nauczyciel]
	ON [Lekcja] ([ID_Nauczyciel]);
DROP INDEX [ID_Klasa]
	ON [LIsta_lekcji] ([ID_Klasa]);
DROP INDEX [ID_Lekcja]
	ON [LIsta_lekcji] ([ID_Lekcja]);
DROP INDEX [ID_Przedmiot]
	ON [LIsta_lekcji] ([ID_ListaL]);
DROP INDEX [ID_Oplaty]
	ON [Lista_oplat] ([ID_Oplaty]);
DROP INDEX [ID_Student]
	ON [Lista_oplat] ([ID_Student]);
DROP INDEX [ID_Nauczyciel]
	ON [Nauczyciel] ([ID_Nauczyciel]);
DROP INDEX [ID_Lekcja]
	ON [Obecnosc] ([ID_Lekcja]);
DROP INDEX [ID_Nauczyciel]
	ON [Obecnosc] ([ID_Nauczyciel]);
DROP INDEX [ID_StatusO]
	ON [Obecnosc] ([ID_StatusO]);
DROP INDEX [ID_Student]
	ON [Obecnosc] ([ID_Student]);
DROP INDEX [ID_Ocena]
	ON [Ocena] ([ID_Ocena]);
DROP INDEX [ID_pd]
	ON [Praca_dyplomowa] ([ID_pd]);
DROP INDEX [ID_rodzaj_pracy]
	ON [Praca_dyplomowa] ([ID_rodzaj_p_dyp]);
DROP INDEX [ID_typ_pracy_dyp]
	ON [Praca_dyplomowa] ([ID_typ_pracy_dyp]);
DROP INDEX [ID_Przedmiot]
	ON [Przedmiot] ([ID_Przedmiot]);
DROP INDEX [ID_Typ_Przedmiotu]
	ON [Przedmiot] ([ID_Typ_Przedmiotu]);
DROP INDEX [PrzedmiotyID_Klasa]
	ON [Przedmioty] ([ID_Klasa]);
DROP INDEX [PrzedmiotyID_Nauczyciel]
	ON [Przedmioty] ([ID_Nauczyciel]);
DROP INDEX [PrzedmiotyID_Przedmiot]
	ON [Przedmioty] ([ID_Przedmiot]);
DROP INDEX [PrzedmiotyID_Sala]
	ON [Przedmioty] ([ID_Sala]);
DROP INDEX [ID_]
	ON [Ranga] ([ID_TS]);
DROP INDEX [ID_Sala]
	ON [Sale] ([ID_Sala]);
DROP INDEX [Numer_pokoju]
	ON [Sale] ([Numer_pokoju]);
DROP INDEX [ID_Stopien]
	ON [Stopien] ([ID_Stopien]);
DROP INDEX [ID_akademik]
	ON [Student] ([ID_akademik]);
DROP INDEX [ID_Stypendia]
	ON [Stypendia] ([ID_Stypendia]);
DROP INDEX [ID_typ_pracy_dyp]
	ON [Typ_pracy_dyp] ([ID_typ_pracy_dyp]);
DROP INDEX [ID_typ_przedmiotu]
	ON [Typ_przedmiotu] ([ID_typ_przedmiotu]);
DROP INDEX [ID_Wojewodztwo]
	ON [Wojewodztwo] ([ID_Wojewodztwo]);
DROP INDEX [ID_Adres]
	ON [Wydzial] ([ID_Adres]);
DROP INDEX [Kod_Wydzial]
	ON [Wydzial] ([Kod_Wydzial]);
DROP INDEX [ID_Student]
	ON [Wyniki] ([ID_Student]);
DROP INDEX [ID_wynik]
	ON [Wyniki] ([ID_wynik]);
DROP INDEX [WynikiID_Ocena]
	ON [Wyniki] ([ID_Ocena]);
DROP INDEX [WynikiID_Przedmiot]
	ON [Wyniki] ([ID_Przedmiot]);
DROP INDEX [WynikiID_Semestr]
	ON [Wyniki] ([ID_Klasa]);
DROP INDEX [ID_Kierunek]
	ON [Zapomogi] ([ID_Kierunek]);
DROP INDEX [ID_Student]
	ON [Zapomogi] ([ID_Student]);
DROP INDEX [ID_Stypednia]
	ON [Zapomogi] ([ID_Stypednia]);
DROP INDEX [Data_zlozenia]
	ON [Zlozenie_pracy] ([Data_zlozenia]);
DROP INDEX [ID_pd]
	ON [Zlozenie_pracy] ([ID_pd]);
DROP INDEX [ID_student]
	ON [Zlozenie_pracy] ([ID_student]);
ALTER TABLE [Adres]
	DROP CONSTRAINT [Adres_codeAdres]
	FOREIGN KEY ([ID_adres_code]) REFERENCES
		[Adres_code] ([ID_adres_code]);
ALTER TABLE [Adres_code]
	DROP CONSTRAINT [WojewodztwoAdres_code]
	FOREIGN KEY NO INDEX ([ID_Wojewodztwa]) REFERENCES
		[Wojewodztwo] ([ID_Wojewodztwo]);
ALTER TABLE [Adres_Nauczyciel]
	DROP CONSTRAINT [AdresAdres_Nauczyciel]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Adres_Nauczyciel]
	DROP CONSTRAINT [NauczycielAdres_Nauczyciel]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Adres_Student]
	DROP CONSTRAINT [AdresAdres_Student]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Adres_Student]
	DROP CONSTRAINT [StudentAdres_Student]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Dziekan]
	DROP CONSTRAINT [AdresDziekan]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Kierunek]
	DROP CONSTRAINT [JezykKierunek]
	FOREIGN KEY ([ID_Jezyk]) REFERENCES
		[Jezyk] ([ID_Jezyk]);
ALTER TABLE [Kierunek]
	DROP CONSTRAINT [StopienKierunek]
	FOREIGN KEY ([ID_Stopien]) REFERENCES
		[Stopien] ([ID_Stopien]);
ALTER TABLE [Kierunek]
	DROP CONSTRAINT [TrybKierunek]
	FOREIGN KEY ([ID_Tryb]) REFERENCES
		[Tryb] ([ID_Tryb]);
ALTER TABLE [Kierunek]
	DROP CONSTRAINT [WydzialKierunek]
	FOREIGN KEY ([ID_Wydzial]) REFERENCES
		[Wydzial] ([ID_Wydzial]);
ALTER TABLE [Kierunki]
	DROP CONSTRAINT [KierunekKierunki]
	FOREIGN KEY ([ID_Kierunek]) REFERENCES
		[Kierunek] ([ID_Kierunek]);
ALTER TABLE [Kierunki]
	DROP CONSTRAINT [StudentKierunki]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Kierunki]
	DROP CONSTRAINT [WydzialKierunki]
	FOREIGN KEY ([ID_Wydzial]) REFERENCES
		[Wydzial] ([ID_Wydzial]);
ALTER TABLE [Klasa]
	DROP CONSTRAINT [KierunekKlasa]
	FOREIGN KEY ([ID_Kierunek]) REFERENCES
		[Kierunek] ([ID_Kierunek]);
ALTER TABLE [Klasa]
	DROP CONSTRAINT [SemestrKlasa]
	FOREIGN KEY ([ID_Semestr]) REFERENCES
		[Semestr] ([ID_Semestr]);
ALTER TABLE [Klasy]
	DROP CONSTRAINT [KlasaKlasy]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [Klasy]
	DROP CONSTRAINT [StudentKlasy]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Kurs]
	DROP CONSTRAINT [PoziomKurs]
	FOREIGN KEY ([Poziomy_Od]) REFERENCES
		[Poziom] ([ID_Poziom]);
ALTER TABLE [Kurs]
	DROP CONSTRAINT [PoziomKurs1]
	FOREIGN KEY ([Poziomy_Do]) REFERENCES
		[Poziom] ([ID_Poziom]);
ALTER TABLE [Kurs_student]
	DROP CONSTRAINT [KursKurs_student]
	FOREIGN KEY ([ID_kurs]) REFERENCES
		[Kurs] ([ID_kurs]);
ALTER TABLE [Kurs_student]
	DROP CONSTRAINT [StudentKurs_student]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Lekcja]
	DROP CONSTRAINT [GodzinyLekcja]
	FOREIGN KEY ([ID_Godzina]) REFERENCES
		[Godziny] ([Godzina_ID]);
ALTER TABLE [Lekcja]
	DROP CONSTRAINT [NauczycielLekcja]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Lekcja]
	DROP CONSTRAINT [PrzedmiotLekcja]
	FOREIGN KEY ([ID_Przedmiot]) REFERENCES
		[Przedmiot] ([ID_Przedmiot]);
ALTER TABLE [LIsta_lekcji]
	DROP CONSTRAINT [KlasaLIsta_lekcji]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [LIsta_lekcji]
	DROP CONSTRAINT [LekcjaLIsta_lekcji]
	FOREIGN KEY ([ID_Lekcja]) REFERENCES
		[Lekcja] ([ID_Lekcja]);
ALTER TABLE [Lista_oplat]
	DROP CONSTRAINT [OplatyLista_oplat]
	FOREIGN KEY ([ID_Oplaty]) REFERENCES
		[Oplaty] ([ID_Oplaty]);
ALTER TABLE [Lista_oplat]
	DROP CONSTRAINT [StudentLista_oplat]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Nauczyciel]
	DROP CONSTRAINT [RangaNauczyciel]
	FOREIGN KEY ([Tytul/Stopien]) REFERENCES
		[Ranga] ([ID_Ranga]);
ALTER TABLE [Obecnosc]
	DROP CONSTRAINT [LekcjaObecnosc]
	FOREIGN KEY ([ID_Lekcja]) REFERENCES
		[Lekcja] ([ID_Lekcja]);
ALTER TABLE [Obecnosc]
	DROP CONSTRAINT [NauczycielObecnosc]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Obecnosc]
	DROP CONSTRAINT [Status_ObecnosciObecnosc]
	FOREIGN KEY ([ID_StatusO]) REFERENCES
		[Status_Obecnosci] ([ID_StatusO]);
ALTER TABLE [Obecnosc]
	DROP CONSTRAINT [StudentObecnosc]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Praca_dyplomowa]
	DROP CONSTRAINT [Rodzaj_p_dypPraca_dyplomowa]
	FOREIGN KEY ([ID_rodzaj_p_dyp]) REFERENCES
		[Rodzaj_p_dyp] ([ID_rodzaj_p_dyp]);
ALTER TABLE [Praca_dyplomowa]
	DROP CONSTRAINT [Typ_pracy_dypPraca_dyplomowa]
	FOREIGN KEY ([ID_typ_pracy_dyp]) REFERENCES
		[Typ_pracy_dyp] ([ID_typ_pracy_dyp]);
ALTER TABLE [Przedmiot]
	DROP CONSTRAINT [ECTSPrzedmiot]
	FOREIGN KEY ([ECTS]) REFERENCES
		[ECTS] ([ID_ECTS]);
ALTER TABLE [Przedmiot]
	DROP CONSTRAINT [Forma_ZaliczeniaPrzedmiot]
	FOREIGN KEY ([ID_Forma_Zaliczenia]) REFERENCES
		[Forma_Zaliczenia] ([ID_Forma]);
ALTER TABLE [Przedmiot]
	DROP CONSTRAINT [Typ_przedmiotuPrzedmiot]
	FOREIGN KEY ([ID_Typ_Przedmiotu]) REFERENCES
		[Typ_przedmiotu] ([ID_typ_przedmiotu]);
ALTER TABLE [Przedmioty]
	DROP CONSTRAINT [KlasaPrzedmioty]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [Przedmioty]
	DROP CONSTRAINT [NauczycielPrzedmioty]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Przedmioty]
	DROP CONSTRAINT [PrzedmiotPrzedmioty]
	FOREIGN KEY ([ID_Przedmiot]) REFERENCES
		[Przedmiot] ([ID_Przedmiot]);
ALTER TABLE [Przedmioty]
	DROP CONSTRAINT [SalePrzedmioty]
	FOREIGN KEY ([ID_Sala]) REFERENCES
		[Sale] ([ID_Sala]);
ALTER TABLE [Ranga]
	DROP CONSTRAINT [Tytul_StopienRanga]
	FOREIGN KEY ([ID_TS]) REFERENCES
		[Tytul_Stopien] ([ID_TS]);
ALTER TABLE [Student]
	DROP CONSTRAINT [AkademikStudent]
	FOREIGN KEY ([ID_akademik]) REFERENCES
		[Akademik] ([ID_akademik]);
ALTER TABLE [Wydzial]
	DROP CONSTRAINT [AdresWydzial]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Wydzial]
	DROP CONSTRAINT [DziekanWydzial]
	FOREIGN KEY ([ID_Dziekan]) REFERENCES
		[Dziekan] ([ID_Dziekan]);
ALTER TABLE [Wyniki]
	DROP CONSTRAINT [KlasaWyniki]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [Wyniki]
	DROP CONSTRAINT [OcenaWyniki]
	FOREIGN KEY ([ID_Ocena]) REFERENCES
		[Ocena] ([ID_Ocena]);
ALTER TABLE [Wyniki]
	DROP CONSTRAINT [PrzedmiotWyniki]
	FOREIGN KEY ([ID_Przedmiot]) REFERENCES
		[Przedmiot] ([ID_Przedmiot]);
ALTER TABLE [Wyniki]
	DROP CONSTRAINT [StudentWyniki]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Zapomogi]
	DROP CONSTRAINT [KierunekZapomogi]
	FOREIGN KEY ([ID_Kierunek]) REFERENCES
		[Kierunek] ([ID_Kierunek]);
ALTER TABLE [Zapomogi]
	DROP CONSTRAINT [StudentZapomogi]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Zapomogi]
	DROP CONSTRAINT [StypendiaZapomogi]
	FOREIGN KEY ([ID_Stypednia]) REFERENCES
		[Stypendia] ([ID_Stypendia]);
ALTER TABLE [Zlozenie_pracy]
	DROP CONSTRAINT [Praca_dyplomowaZlozenie_pracy]
	FOREIGN KEY ([ID_pd]) REFERENCES
		[Praca_dyplomowa] ([ID_pd]);
ALTER TABLE [Zlozenie_pracy]
	DROP CONSTRAINT [StudentZlozenie_pracy]
	FOREIGN KEY ([ID_student]) REFERENCES
		[Student] ([ID_Student]);

DROP TABLE [Adres];

DROP TABLE [Adres_code];

DROP TABLE [Adres_Nauczyciel];

DROP TABLE [Adres_Student];

DROP TABLE [Akademik];

DROP TABLE [Dziekan];

DROP TABLE [ECTS];
DROP TABLE [Forma_Zaliczenia];

DROP TABLE [Godziny];

DROP TABLE [Jezyk];

DROP TABLE [Kierunek];

DROP TABLE [Kierunki];
DROP TABLE [Klasa];

DROP TABLE [Klasy];
DROP TABLE [Kurs];

DROP TABLE [Kurs_nauczyciel];
DROP TABLE [Kurs_student];
DROP TABLE [Lekcja];

DROP TABLE [LIsta_lekcji];
DROP TABLE [Lista_oplat];
DROP TABLE [Nauczyciel];

DROP TABLE [Obecnosc];
DROP TABLE [Ocena];

DROP TABLE [Oplaty];

DROP TABLE [Poziom];

DROP TABLE [Praca_dyplomowa];

DROP TABLE [Przedmiot];

DROP TABLE [Przedmioty];

DROP TABLE [Ranga];

DROP TABLE [Rodzaj_p_dyp];

DROP TABLE [Sale] (
	[ID_Sala] AUTOINCREMENT,
	[Numer_pokoju] LONG NOT NULL DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Sala])
);
DROP TABLE [Semestr];

DROP TABLE [Status_Obecnosci];

DROP TABLE [Stopien];

DROP TABLE [Student];

DROP TABLE [Stypendia];

DROP TABLE [Tryb];

DROP TABLE [Typ_pracy_dyp];

DROP TABLE [Typ_przedmiotu];

DROP TABLE [Tytul_Stopien];

DROP TABLE [USysApplicationLog];
DROP TABLE [Wojewodztwo];

DROP TABLE [Wydzial];

DROP TABLE [Wyniki];
DROP TABLE [Zapomogi];

DROP TABLE [Zlozenie_pracy];