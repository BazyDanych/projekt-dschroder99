CREATE TABLE [Adres] (
	[ID_Adres] AUTOINCREMENT,
	[Ulica] TEXT(255) WITH COMPRESSION,
	[Dzielnica] TEXT(255) WITH COMPRESSION,
	[ID_adres_code] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Adres])
);
ALTER TABLE [Adres] ALLOW ZERO LENGTH [Ulica];
ALTER TABLE [Adres] ALLOW ZERO LENGTH [Dzielnica];
CREATE TABLE [Adres_code] (
	[ID_adres_code] AUTOINCREMENT,
	[ZIP] TEXT(255) WITH COMPRESSION NOT NULL,
	[Miasto] TEXT(255) WITH COMPRESSION NOT NULL,
	[ID_Wojewodztwa] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_adres_code])
);
ALTER TABLE [Adres_code] DENY ZERO LENGTH [ZIP];
ALTER TABLE [Adres_code] DENY ZERO LENGTH [Miasto];
CREATE TABLE [Adres_Nauczyciel] (
	[ID_Nauczyciel] LONG NOT NULL,
	[ID_Adres] LONG NOT NULL,
	[Czyaktualny] BIT NOT NULL DEFAULT No
);
ALTER TABLE [Adres_Nauczyciel] FORMAT [Czyaktualny] SET "Yes/No";
CREATE TABLE [Adres_Student] (
	[ID_Student] LONG NOT NULL,
	[ID_Adres] LONG NOT NULL,
	[Czyaktualny] BIT NOT NULL DEFAULT No
);
ALTER TABLE [Adres_Student] FORMAT [Czyaktualny] SET "Yes/No";
CREATE TABLE [Akademik] (
	[ID_akademik] AUTOINCREMENT,
	[Nazwa_a] TEXT(255) WITH COMPRESSION NOT NULL,
	[Liczba miejsc] LONG NOT NULL,
	[ID_Adres] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_akademik])
);
ALTER TABLE [Akademik] DENY ZERO LENGTH [Nazwa_a];
CREATE TABLE [Dziekan] (
	[ID_Dziekan] AUTOINCREMENT,
	[Imie_dziekan] TEXT(255) WITH COMPRESSION NOT NULL,
	[Nazwisko_dziekan] TEXT(255) WITH COMPRESSION NOT NULL,
	[Telefon_dziekan] TEXT(255) WITH COMPRESSION NOT NULL,
	[Email_dziekan] TEXT(255) WITH COMPRESSION NOT NULL,
	[ID_Adres] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Dziekan])
);
ALTER TABLE [Dziekan] DENY ZERO LENGTH [Imie_dziekan];
ALTER TABLE [Dziekan] DENY ZERO LENGTH [Nazwisko_dziekan];
ALTER TABLE [Dziekan] DENY ZERO LENGTH [Telefon_dziekan];
ALTER TABLE [Dziekan] DENY ZERO LENGTH [Email_dziekan];
CREATE TABLE [ECTS] (
	[ID_ECTS] AUTOINCREMENT,
	[ECTS] LONG NOT NULL DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_ECTS])
);
CREATE TABLE [Forma_Zaliczenia] (
	[ID_Forma] AUTOINCREMENT,
	[Typ_formy] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Forma])
);
ALTER TABLE [Forma_Zaliczenia] DENY ZERO LENGTH [Typ_formy];
CREATE TABLE [Godziny] (
	[Godzina_ID] AUTOINCREMENT,
	[START_TIME] DATETIME,
	[END_TIME] DATETIME,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([Godzina_ID])
);
ALTER TABLE [Godziny] FORMAT [START_TIME] SET "Short Time";
ALTER TABLE [Godziny] FORMAT [END_TIME] SET "Short Time";
CREATE TABLE [Jezyk] (
	[ID_Jezyk] AUTOINCREMENT,
	[Jezyk_Kod] TEXT(255) WITH COMPRESSION NOT NULL,
	[Jezyk] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Jezyk])
);
ALTER TABLE [Jezyk] DENY ZERO LENGTH [Jezyk_Kod];
ALTER TABLE [Jezyk] DENY ZERO LENGTH [Jezyk];
CREATE TABLE [Kierunek] (
	[ID_Kierunek] AUTOINCREMENT,
	[Nazwa_kierunek] TEXT(255) WITH COMPRESSION NOT NULL,
	[ID_Stopien] LONG NOT NULL,
	[ID_Tryb] LONG NOT NULL,
	[ID_Jezyk] LONG NOT NULL,
	[ID_Wydzial] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Kierunek])
);
ALTER TABLE [Kierunek] DENY ZERO LENGTH [Nazwa_kierunek];
CREATE TABLE [Kierunki] (
	[ID_Student] LONG NOT NULL,
	[ID_Wydzial] LONG NOT NULL,
	[ID_Kierunek] LONG NOT NULL
);
CREATE TABLE [Klasa] (
	[ID_Klasa] AUTOINCREMENT,
	[Nazwa_klasy] TEXT(255) WITH COMPRESSION NOT NULL,
	[Nazwa_klasy_liczba] LONG NOT NULL,
	[ID_Semestr] LONG NOT NULL,
	[ID_Kierunek] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Klasa])
);
ALTER TABLE [Klasa] DENY ZERO LENGTH [Nazwa_klasy];
CREATE TABLE [Klasy] (
	[ID_Klasa] LONG NOT NULL,
	[ID_Student] LONG NOT NULL
);
CREATE TABLE [Kurs] (
	[ID_kurs] AUTOINCREMENT,
	[Nazwa_kurs] TEXT(255) WITH COMPRESSION NOT NULL,
	[Poziomy_Od] LONG NOT NULL,
	[Poziomy_Do] LONG NOT NULL,
	[Cena_kurs] CURRENCY NOT NULL DEFAULT 0,
	[Liczba_godzin] LONG NOT NULL DEFAULT 0,
	[Limit_uczestnikow] LONG NOT NULL DEFAULT 0,
	[Data_rozp] DATETIME,
	[Data_zak] DATETIME,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_kurs])
);
ALTER TABLE [Kurs] DENY ZERO LENGTH [Nazwa_kurs];
ALTER TABLE [Kurs] FORMAT [Cena_kurs] SET "#,##0.00" z³";-#,##0.00" z³"";
CREATE TABLE [Kurs_nauczyciel] (
	[ID_Kurs] LONG NOT NULL DEFAULT 0,
	[ID_Nauczyciel] LONG NOT NULL DEFAULT 0
);
CREATE TABLE [Kurs_student] (
	[ID_Student] LONG NOT NULL,
	[ID_kurs] LONG NOT NULL
);
CREATE TABLE [Lekcja] (
	[ID_Lekcja] AUTOINCREMENT,
	[ID_Nauczyciel] LONG NOT NULL,
	[ID_Przedmiot] LONG NOT NULL,
	[ID_Godzina] LONG NOT NULL,
	[Temat_lekcji] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Lekcja])
);
ALTER TABLE [Lekcja] DENY ZERO LENGTH [Temat_lekcji];
CREATE TABLE [LIsta_lekcji] (
	[ID_ListaL] LONG NOT NULL,
	[ID_Lekcja] LONG NOT NULL,
	[ID_Klasa] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_ListaL])
);
CREATE TABLE [Lista_oplat] (
	[ID_Oplaty] LONG NOT NULL,
	[ID_Student] LONG NOT NULL,
	[Data_wplaty] DATETIME DEFAULT =Date(),
	[Data_modyfikacji] DATETIME NOT NULL
);
CREATE TABLE [Nauczyciel] (
	[ID_Nauczyciel] AUTOINCREMENT,
	[Imie_n] TEXT(255) WITH COMPRESSION NOT NULL,
	[Nazwisko_n] TEXT(255) WITH COMPRESSION NOT NULL,
	[Telefon_n] TEXT(255) WITH COMPRESSION NOT NULL,
	[Email_n] TEXT(255) WITH COMPRESSION NOT NULL,
	[Data_urodzenia] DATETIME NOT NULL,
	[Tytul/Stopien] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Nauczyciel])
);
ALTER TABLE [Nauczyciel] DENY ZERO LENGTH [Imie_n];
ALTER TABLE [Nauczyciel] DENY ZERO LENGTH [Nazwisko_n];
ALTER TABLE [Nauczyciel] DENY ZERO LENGTH [Telefon_n];
ALTER TABLE [Nauczyciel] DENY ZERO LENGTH [Email_n];
CREATE TABLE [Obecnosc] (
	[ID_Obecnosc] AUTOINCREMENT,
	[ID_Lekcja] LONG NOT NULL,
	[ID_Student] LONG NOT NULL,
	[Data] DATETIME NOT NULL DEFAULT =Date(),
	[Modyfikacja] DATETIME,
	[ID_StatusO] LONG NOT NULL,
	[ID_Nauczyciel] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Obecnosc])
);
CREATE TABLE [Ocena] (
	[ID_Ocena] AUTOINCREMENT,
	[Ocena_tekst] TEXT(255) WITH COMPRESSION NOT NULL,
	[Ocena] SINGLE NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Ocena])
);
ALTER TABLE [Ocena] DENY ZERO LENGTH [Ocena_tekst];
CREATE TABLE [Oplaty] (
	[ID_Oplaty] AUTOINCREMENT,
	[Przeznaczenie] TEXT(255) WITH COMPRESSION NOT NULL,
	[Kwota] CURRENCY NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Oplaty])
);
ALTER TABLE [Oplaty] DENY ZERO LENGTH [Przeznaczenie];
ALTER TABLE [Oplaty] FORMAT [Kwota] SET "#,##0.00" z³";-#,##0.00" z³"";
CREATE TABLE [Poziom] (
	[ID_Poziom] AUTOINCREMENT,
	[Poziom] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Poziom])
);
ALTER TABLE [Poziom] DENY ZERO LENGTH [Poziom];
CREATE TABLE [Praca_dyplomowa] (
	[ID_pd] AUTOINCREMENT,
	[Tytul_pracy] TEXT(255) WITH COMPRESSION NOT NULL,
	[ID_typ_pracy_dyp] LONG NOT NULL,
	[ID_rodzaj_p_dyp] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_pd])
);
ALTER TABLE [Praca_dyplomowa] DENY ZERO LENGTH [Tytul_pracy];
CREATE TABLE [Przedmiot] (
	[ID_Przedmiot] AUTOINCREMENT,
	[Nazwa_p] TEXT(255) WITH COMPRESSION NOT NULL,
	[ID_Typ_Przedmiotu] LONG NOT NULL,
	[Data_utworzenia] DATETIME NOT NULL DEFAULT =Date(),
	[Data_modyfikacji] DATETIME NOT NULL,
	[ECTS] LONG NOT NULL,
	[ID_Forma_Zaliczenia] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Przedmiot])
);
ALTER TABLE [Przedmiot] DENY ZERO LENGTH [Nazwa_p];
CREATE TABLE [Przedmioty] (
	[ID_Przedmiot] LONG NOT NULL,
	[ID_Klasa] LONG NOT NULL,
	[ID_Nauczyciel] LONG NOT NULL,
	[ID_Sala] LONG NOT NULL,
	[Status] BIT NOT NULL DEFAULT No,
	[Liczba_godzin] LONG NOT NULL DEFAULT 0
);
ALTER TABLE [Przedmioty] FORMAT [Status] SET "Yes/No";
CREATE TABLE [Ranga] (
	[ID_Ranga] AUTOINCREMENT,
	[Tytul/Stopien] TEXT(255) WITH COMPRESSION NOT NULL,
	[ID_TS] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Ranga])
);
ALTER TABLE [Ranga] DENY ZERO LENGTH [Tytul/Stopien];
CREATE TABLE [Rodzaj_p_dyp] (
	[ID_rodzaj_p_dyp] AUTOINCREMENT,
	[Rodzaj] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_rodzaj_p_dyp])
);
ALTER TABLE [Rodzaj_p_dyp] DENY ZERO LENGTH [Rodzaj];
CREATE TABLE [Sale] (
	[ID_Sala] AUTOINCREMENT,
	[Numer_pokoju] LONG NOT NULL DEFAULT 0,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Sala])
);
CREATE TABLE [Semestr] (
	[ID_Semestr] AUTOINCREMENT,
	[Nazwa_semestr] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Semestr])
);
ALTER TABLE [Semestr] DENY ZERO LENGTH [Nazwa_semestr];
CREATE TABLE [Status_Obecnosci] (
	[ID_StatusO] AUTOINCREMENT,
	[Status] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_StatusO])
);
ALTER TABLE [Status_Obecnosci] DENY ZERO LENGTH [Status];
CREATE TABLE [Stopien] (
	[ID_Stopien] AUTOINCREMENT,
	[Nazwa_Stopien] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Stopien])
);
ALTER TABLE [Stopien] DENY ZERO LENGTH [Nazwa_Stopien];
CREATE TABLE [Student] (
	[ID_Student] AUTOINCREMENT,
	[Imie_s] TEXT(255) WITH COMPRESSION NOT NULL,
	[Nazwisko_s] TEXT(255) WITH COMPRESSION NOT NULL,
	[Telefon_s] TEXT(255) WITH COMPRESSION NOT NULL,
	[Email_s] TEXT(255) WITH COMPRESSION NOT NULL,
	[Data_urodzenia] DATETIME NOT NULL,
	[Data_rozp] DATETIME NOT NULL DEFAULT =Date$(),
	[Data_zak] DATETIME,
	[ID_akademik] LONG,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Student])
);
ALTER TABLE [Student] DENY ZERO LENGTH [Imie_s];
ALTER TABLE [Student] DENY ZERO LENGTH [Nazwisko_s];
ALTER TABLE [Student] DENY ZERO LENGTH [Telefon_s];
ALTER TABLE [Student] DENY ZERO LENGTH [Email_s];
CREATE TABLE [Stypendia] (
	[ID_Stypendia] AUTOINCREMENT,
	[Typ_st] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Stypendia])
);
ALTER TABLE [Stypendia] DENY ZERO LENGTH [Typ_st];
CREATE TABLE [Tryb] (
	[ID_Tryb] AUTOINCREMENT,
	[Tryb] TEXT(255) WITH COMPRESSION NOT NULL,
	[Sposób] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Tryb])
);
ALTER TABLE [Tryb] DENY ZERO LENGTH [Tryb];
ALTER TABLE [Tryb] DENY ZERO LENGTH [Sposób];
CREATE TABLE [Typ_pracy_dyp] (
	[ID_typ_pracy_dyp] AUTOINCREMENT,
	[Typ_pracy_dyp] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_typ_pracy_dyp])
);
ALTER TABLE [Typ_pracy_dyp] DENY ZERO LENGTH [Typ_pracy_dyp];
CREATE TABLE [Typ_przedmiotu] (
	[ID_typ_przedmiotu] AUTOINCREMENT,
	[Typ_przedmiotu] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_typ_przedmiotu])
);
ALTER TABLE [Typ_przedmiotu] ALLOW ZERO LENGTH [Typ_przedmiotu];
CREATE TABLE [Tytul_Stopien] (
	[ID_TS] AUTOINCREMENT,
	[Rodzaj] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_TS])
);
ALTER TABLE [Tytul_Stopien] DENY ZERO LENGTH [Rodzaj];
CREATE TABLE [USysApplicationLog] (
	[ID] AUTOINCREMENT,
	[SourceObject] TEXT(255) WITH COMPRESSION,
	[Data Macro Instance ID] TEXT(255) WITH COMPRESSION,
	[Error Number] LONG,
	[Category] TEXT(255) WITH COMPRESSION,
	[Object Type] TEXT(255) WITH COMPRESSION,
	[Description] MEMO WITH COMPRESSION,
	[Context] TEXT(255) WITH COMPRESSION,
	[Created] DATETIME,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID])
);
CREATE TABLE [Wojewodztwo] (
	[ID_Wojewodztwo] AUTOINCREMENT,
	[Nazwa_woj] TEXT(255) WITH COMPRESSION NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Wojewodztwo])
);
ALTER TABLE [Wojewodztwo] DENY ZERO LENGTH [Nazwa_woj];
CREATE TABLE [Wydzial] (
	[ID_Wydzial] AUTOINCREMENT,
	[Kod_Wydzial] TEXT(255) WITH COMPRESSION NOT NULL,
	[Nazwa_w] TEXT(255) WITH COMPRESSION NOT NULL,
	[ID_Adres] LONG NOT NULL,
	[ID_Dziekan] LONG NOT NULL,
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_Wydzial])
);
ALTER TABLE [Wydzial] DENY ZERO LENGTH [Kod_Wydzial];
ALTER TABLE [Wydzial] DENY ZERO LENGTH [Nazwa_w];
CREATE TABLE [Wyniki] (
	[ID_wynik] AUTOINCREMENT,
	[ID_Student] LONG NOT NULL,
	[ID_Klasa] LONG NOT NULL,
	[ID_Przedmiot] LONG NOT NULL,
	[ID_Ocena] LONG NOT NULL,
	[Data_wstawienia] DATETIME NOT NULL DEFAULT =Date(),
	[Data_modyfikacji] DATETIME DEFAULT =Date$(),
	CONSTRAINT [PrimaryKey] PRIMARY KEY ([ID_wynik])
);
CREATE TABLE [Zapomogi] (
	[ID_Student] LONG NOT NULL,
	[ID_Stypednia] LONG NOT NULL,
	[ID_Kierunek] LONG NOT NULL,
	[Kwota] CURRENCY NOT NULL DEFAULT 0
);
ALTER TABLE [Zapomogi] FORMAT [Kwota] SET "#,##0.00" z³";-#,##0.00" z³"";
CREATE TABLE [Zlozenie_pracy] (
	[ID_student] LONG NOT NULL,
	[ID_pd] LONG NOT NULL,
	[Data_zlozenia] DATETIME NOT NULL,
	[Podjecie_proby] DATETIME,
	[Data_obronienia] DATETIME,
	[Zgodnoœæ_z_tytu³em] DECIMAL(18, 0) NOT NULL,
	[Poprawnoœæ_uk³adu] LONG NOT NULL,
	[Znajomosc_literatury] LONG NOT NULL,
	[Przyjêta_praca] LONG NOT NULL,
	[Wk³ad_w³asny] LONG NOT NULL,
	[Wynik] DECIMAL(18, 3) NOT NULL,
	[Result] TEXT(255) WITH COMPRESSION NOT NULL
);
ALTER TABLE [Zlozenie_pracy] DENY ZERO LENGTH [Result];
CREATE INDEX [ID_Adres]
	ON [Adres] ([ID_Adres]);
CREATE INDEX [ID_adres_code]
	ON [Adres] ([ID_adres_code]);
CREATE INDEX [ID_adres_code]
	ON [Adres_code] ([ID_adres_code]);
CREATE INDEX [Adres_NauczycielID_Adres]
	ON [Adres_Nauczyciel] ([ID_Adres]);
CREATE INDEX [ID_Nauczyciel]
	ON [Adres_Nauczyciel] ([ID_Nauczyciel]);
CREATE INDEX [Adres_StudentID_Adres]
	ON [Adres_Student] ([ID_Adres]);
CREATE INDEX [Adres_StudentID_Student]
	ON [Adres_Student] ([ID_Student]);
CREATE INDEX [ID_Adres]
	ON [Akademik] ([ID_Adres]);
CREATE INDEX [ID_akademik]
	ON [Akademik] ([ID_akademik]);
CREATE INDEX [ID_Adres]
	ON [Dziekan] ([ID_Adres]);
CREATE INDEX [Jezyk_Kod]
	ON [Jezyk] ([Jezyk_Kod]);
CREATE INDEX [ID_Jezyk]
	ON [Kierunek] ([ID_Jezyk]);
CREATE INDEX [ID_Kierunek]
	ON [Kierunek] ([ID_Kierunek]);
CREATE INDEX [ID_Stopien]
	ON [Kierunek] ([ID_Stopien]);
CREATE INDEX [ID_Tryb]
	ON [Kierunek] ([ID_Tryb]);
CREATE INDEX [ID_Wydzial]
	ON [Kierunek] ([ID_Wydzial]);
CREATE INDEX [ID_Student]
	ON [Kierunki] ([ID_Student]);
CREATE INDEX [ID_Wydzial]
	ON [Kierunki] ([ID_Wydzial]);
CREATE INDEX [KierunkiID_Kierunek]
	ON [Kierunki] ([ID_Kierunek]);
CREATE INDEX [ID_Kierunek]
	ON [Klasa] ([ID_Kierunek]);
CREATE INDEX [ID_Klasa]
	ON [Klasa] ([ID_Klasa]);
CREATE INDEX [ID_Semestr]
	ON [Klasa] ([ID_Semestr]);
CREATE INDEX [ID_Klasa]
	ON [Klasy] ([ID_Klasa]);
CREATE INDEX [ID_Student]
	ON [Klasy] ([ID_Student]);
CREATE INDEX [ID_kurs]
	ON [Kurs] ([ID_kurs]);
CREATE INDEX [ID_Nauczyciel]
	ON [Kurs_nauczyciel] ([ID_Nauczyciel]);
CREATE INDEX [Kurs_nauczycielID_kurs]
	ON [Kurs_nauczyciel] ([ID_Kurs]);
CREATE INDEX [ID_Student]
	ON [Kurs_student] ([ID_Student]);
CREATE INDEX [ID_kurs]
	ON [Kurs_student] ([ID_kurs]);
CREATE INDEX [ID_Godzina]
	ON [Lekcja] ([ID_Godzina]);
CREATE INDEX [ID_Lekcja]
	ON [Lekcja] ([ID_Lekcja]);
CREATE INDEX [ID_Nauczyciel]
	ON [Lekcja] ([ID_Nauczyciel]);
CREATE INDEX [ID_Klasa]
	ON [LIsta_lekcji] ([ID_Klasa]);
CREATE INDEX [ID_Lekcja]
	ON [LIsta_lekcji] ([ID_Lekcja]);
CREATE INDEX [ID_Przedmiot]
	ON [LIsta_lekcji] ([ID_ListaL]);
CREATE INDEX [ID_Oplaty]
	ON [Lista_oplat] ([ID_Oplaty]);
CREATE INDEX [ID_Student]
	ON [Lista_oplat] ([ID_Student]);
CREATE INDEX [ID_Nauczyciel]
	ON [Nauczyciel] ([ID_Nauczyciel]);
CREATE INDEX [ID_Lekcja]
	ON [Obecnosc] ([ID_Lekcja]);
CREATE INDEX [ID_Nauczyciel]
	ON [Obecnosc] ([ID_Nauczyciel]);
CREATE INDEX [ID_StatusO]
	ON [Obecnosc] ([ID_StatusO]);
CREATE INDEX [ID_Student]
	ON [Obecnosc] ([ID_Student]);
CREATE INDEX [ID_Ocena]
	ON [Ocena] ([ID_Ocena]);
CREATE INDEX [ID_pd]
	ON [Praca_dyplomowa] ([ID_pd]);
CREATE INDEX [ID_rodzaj_pracy]
	ON [Praca_dyplomowa] ([ID_rodzaj_p_dyp]);
CREATE INDEX [ID_typ_pracy_dyp]
	ON [Praca_dyplomowa] ([ID_typ_pracy_dyp]);
CREATE INDEX [ID_Przedmiot]
	ON [Przedmiot] ([ID_Przedmiot]);
CREATE INDEX [ID_Typ_Przedmiotu]
	ON [Przedmiot] ([ID_Typ_Przedmiotu]);
CREATE INDEX [PrzedmiotyID_Klasa]
	ON [Przedmioty] ([ID_Klasa]);
CREATE INDEX [PrzedmiotyID_Nauczyciel]
	ON [Przedmioty] ([ID_Nauczyciel]);
CREATE INDEX [PrzedmiotyID_Przedmiot]
	ON [Przedmioty] ([ID_Przedmiot]);
CREATE INDEX [PrzedmiotyID_Sala]
	ON [Przedmioty] ([ID_Sala]);
CREATE INDEX [ID_]
	ON [Ranga] ([ID_TS]);
CREATE INDEX [ID_Sala]
	ON [Sale] ([ID_Sala]);
CREATE INDEX [Numer_pokoju]
	ON [Sale] ([Numer_pokoju]);
CREATE INDEX [ID_Stopien]
	ON [Stopien] ([ID_Stopien]);
CREATE INDEX [ID_akademik]
	ON [Student] ([ID_akademik]);
CREATE INDEX [ID_Stypendia]
	ON [Stypendia] ([ID_Stypendia]);
CREATE INDEX [ID_typ_pracy_dyp]
	ON [Typ_pracy_dyp] ([ID_typ_pracy_dyp]);
CREATE INDEX [ID_typ_przedmiotu]
	ON [Typ_przedmiotu] ([ID_typ_przedmiotu]);
CREATE INDEX [ID_Wojewodztwo]
	ON [Wojewodztwo] ([ID_Wojewodztwo]);
CREATE INDEX [ID_Adres]
	ON [Wydzial] ([ID_Adres]);
CREATE INDEX [Kod_Wydzial]
	ON [Wydzial] ([Kod_Wydzial]);
CREATE INDEX [ID_Student]
	ON [Wyniki] ([ID_Student]);
CREATE INDEX [ID_wynik]
	ON [Wyniki] ([ID_wynik]);
CREATE INDEX [WynikiID_Ocena]
	ON [Wyniki] ([ID_Ocena]);
CREATE INDEX [WynikiID_Przedmiot]
	ON [Wyniki] ([ID_Przedmiot]);
CREATE INDEX [WynikiID_Semestr]
	ON [Wyniki] ([ID_Klasa]);
CREATE INDEX [ID_Kierunek]
	ON [Zapomogi] ([ID_Kierunek]);
CREATE INDEX [ID_Student]
	ON [Zapomogi] ([ID_Student]);
CREATE INDEX [ID_Stypednia]
	ON [Zapomogi] ([ID_Stypednia]);
CREATE INDEX [Data_zlozenia]
	ON [Zlozenie_pracy] ([Data_zlozenia]);
CREATE INDEX [ID_pd]
	ON [Zlozenie_pracy] ([ID_pd]);
CREATE INDEX [ID_student]
	ON [Zlozenie_pracy] ([ID_student]);
ALTER TABLE [Adres]
	ADD CONSTRAINT [Adres_codeAdres]
	FOREIGN KEY ([ID_adres_code]) REFERENCES
		[Adres_code] ([ID_adres_code]);
ALTER TABLE [Adres_code]
	ADD CONSTRAINT [WojewodztwoAdres_code]
	FOREIGN KEY NO INDEX ([ID_Wojewodztwa]) REFERENCES
		[Wojewodztwo] ([ID_Wojewodztwo]);
ALTER TABLE [Adres_Nauczyciel]
	ADD CONSTRAINT [AdresAdres_Nauczyciel]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Adres_Nauczyciel]
	ADD CONSTRAINT [NauczycielAdres_Nauczyciel]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Adres_Student]
	ADD CONSTRAINT [AdresAdres_Student]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Adres_Student]
	ADD CONSTRAINT [StudentAdres_Student]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Dziekan]
	ADD CONSTRAINT [AdresDziekan]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Kierunek]
	ADD CONSTRAINT [JezykKierunek]
	FOREIGN KEY ([ID_Jezyk]) REFERENCES
		[Jezyk] ([ID_Jezyk]);
ALTER TABLE [Kierunek]
	ADD CONSTRAINT [StopienKierunek]
	FOREIGN KEY ([ID_Stopien]) REFERENCES
		[Stopien] ([ID_Stopien]);
ALTER TABLE [Kierunek]
	ADD CONSTRAINT [TrybKierunek]
	FOREIGN KEY ([ID_Tryb]) REFERENCES
		[Tryb] ([ID_Tryb]);
ALTER TABLE [Kierunek]
	ADD CONSTRAINT [WydzialKierunek]
	FOREIGN KEY ([ID_Wydzial]) REFERENCES
		[Wydzial] ([ID_Wydzial]);
ALTER TABLE [Kierunki]
	ADD CONSTRAINT [KierunekKierunki]
	FOREIGN KEY ([ID_Kierunek]) REFERENCES
		[Kierunek] ([ID_Kierunek]);
ALTER TABLE [Kierunki]
	ADD CONSTRAINT [StudentKierunki]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Kierunki]
	ADD CONSTRAINT [WydzialKierunki]
	FOREIGN KEY ([ID_Wydzial]) REFERENCES
		[Wydzial] ([ID_Wydzial]);
ALTER TABLE [Klasa]
	ADD CONSTRAINT [KierunekKlasa]
	FOREIGN KEY ([ID_Kierunek]) REFERENCES
		[Kierunek] ([ID_Kierunek]);
ALTER TABLE [Klasa]
	ADD CONSTRAINT [SemestrKlasa]
	FOREIGN KEY ([ID_Semestr]) REFERENCES
		[Semestr] ([ID_Semestr]);
ALTER TABLE [Klasy]
	ADD CONSTRAINT [KlasaKlasy]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [Klasy]
	ADD CONSTRAINT [StudentKlasy]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Kurs]
	ADD CONSTRAINT [PoziomKurs]
	FOREIGN KEY ([Poziomy_Od]) REFERENCES
		[Poziom] ([ID_Poziom]);
ALTER TABLE [Kurs]
	ADD CONSTRAINT [PoziomKurs1]
	FOREIGN KEY ([Poziomy_Do]) REFERENCES
		[Poziom] ([ID_Poziom]);
ALTER TABLE [Kurs_student]
	ADD CONSTRAINT [KursKurs_student]
	FOREIGN KEY ([ID_kurs]) REFERENCES
		[Kurs] ([ID_kurs]);
ALTER TABLE [Kurs_student]
	ADD CONSTRAINT [StudentKurs_student]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Lekcja]
	ADD CONSTRAINT [GodzinyLekcja]
	FOREIGN KEY ([ID_Godzina]) REFERENCES
		[Godziny] ([Godzina_ID]);
ALTER TABLE [Lekcja]
	ADD CONSTRAINT [NauczycielLekcja]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Lekcja]
	ADD CONSTRAINT [PrzedmiotLekcja]
	FOREIGN KEY ([ID_Przedmiot]) REFERENCES
		[Przedmiot] ([ID_Przedmiot]);
ALTER TABLE [LIsta_lekcji]
	ADD CONSTRAINT [KlasaLIsta_lekcji]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [LIsta_lekcji]
	ADD CONSTRAINT [LekcjaLIsta_lekcji]
	FOREIGN KEY ([ID_Lekcja]) REFERENCES
		[Lekcja] ([ID_Lekcja]);
ALTER TABLE [Lista_oplat]
	ADD CONSTRAINT [OplatyLista_oplat]
	FOREIGN KEY ([ID_Oplaty]) REFERENCES
		[Oplaty] ([ID_Oplaty]);
ALTER TABLE [Lista_oplat]
	ADD CONSTRAINT [StudentLista_oplat]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Nauczyciel]
	ADD CONSTRAINT [RangaNauczyciel]
	FOREIGN KEY ([Tytul/Stopien]) REFERENCES
		[Ranga] ([ID_Ranga]);
ALTER TABLE [Obecnosc]
	ADD CONSTRAINT [LekcjaObecnosc]
	FOREIGN KEY ([ID_Lekcja]) REFERENCES
		[Lekcja] ([ID_Lekcja]);
ALTER TABLE [Obecnosc]
	ADD CONSTRAINT [NauczycielObecnosc]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Obecnosc]
	ADD CONSTRAINT [Status_ObecnosciObecnosc]
	FOREIGN KEY ([ID_StatusO]) REFERENCES
		[Status_Obecnosci] ([ID_StatusO]);
ALTER TABLE [Obecnosc]
	ADD CONSTRAINT [StudentObecnosc]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Praca_dyplomowa]
	ADD CONSTRAINT [Rodzaj_p_dypPraca_dyplomowa]
	FOREIGN KEY ([ID_rodzaj_p_dyp]) REFERENCES
		[Rodzaj_p_dyp] ([ID_rodzaj_p_dyp]);
ALTER TABLE [Praca_dyplomowa]
	ADD CONSTRAINT [Typ_pracy_dypPraca_dyplomowa]
	FOREIGN KEY ([ID_typ_pracy_dyp]) REFERENCES
		[Typ_pracy_dyp] ([ID_typ_pracy_dyp]);
ALTER TABLE [Przedmiot]
	ADD CONSTRAINT [ECTSPrzedmiot]
	FOREIGN KEY ([ECTS]) REFERENCES
		[ECTS] ([ID_ECTS]);
ALTER TABLE [Przedmiot]
	ADD CONSTRAINT [Forma_ZaliczeniaPrzedmiot]
	FOREIGN KEY ([ID_Forma_Zaliczenia]) REFERENCES
		[Forma_Zaliczenia] ([ID_Forma]);
ALTER TABLE [Przedmiot]
	ADD CONSTRAINT [Typ_przedmiotuPrzedmiot]
	FOREIGN KEY ([ID_Typ_Przedmiotu]) REFERENCES
		[Typ_przedmiotu] ([ID_typ_przedmiotu]);
ALTER TABLE [Przedmioty]
	ADD CONSTRAINT [KlasaPrzedmioty]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [Przedmioty]
	ADD CONSTRAINT [NauczycielPrzedmioty]
	FOREIGN KEY ([ID_Nauczyciel]) REFERENCES
		[Nauczyciel] ([ID_Nauczyciel]);
ALTER TABLE [Przedmioty]
	ADD CONSTRAINT [PrzedmiotPrzedmioty]
	FOREIGN KEY ([ID_Przedmiot]) REFERENCES
		[Przedmiot] ([ID_Przedmiot]);
ALTER TABLE [Przedmioty]
	ADD CONSTRAINT [SalePrzedmioty]
	FOREIGN KEY ([ID_Sala]) REFERENCES
		[Sale] ([ID_Sala]);
ALTER TABLE [Ranga]
	ADD CONSTRAINT [Tytul_StopienRanga]
	FOREIGN KEY ([ID_TS]) REFERENCES
		[Tytul_Stopien] ([ID_TS]);
ALTER TABLE [Student]
	ADD CONSTRAINT [AkademikStudent]
	FOREIGN KEY ([ID_akademik]) REFERENCES
		[Akademik] ([ID_akademik]);
ALTER TABLE [Wydzial]
	ADD CONSTRAINT [AdresWydzial]
	FOREIGN KEY ([ID_Adres]) REFERENCES
		[Adres] ([ID_Adres]);
ALTER TABLE [Wydzial]
	ADD CONSTRAINT [DziekanWydzial]
	FOREIGN KEY ([ID_Dziekan]) REFERENCES
		[Dziekan] ([ID_Dziekan]);
ALTER TABLE [Wyniki]
	ADD CONSTRAINT [KlasaWyniki]
	FOREIGN KEY ([ID_Klasa]) REFERENCES
		[Klasa] ([ID_Klasa]);
ALTER TABLE [Wyniki]
	ADD CONSTRAINT [OcenaWyniki]
	FOREIGN KEY ([ID_Ocena]) REFERENCES
		[Ocena] ([ID_Ocena]);
ALTER TABLE [Wyniki]
	ADD CONSTRAINT [PrzedmiotWyniki]
	FOREIGN KEY ([ID_Przedmiot]) REFERENCES
		[Przedmiot] ([ID_Przedmiot]);
ALTER TABLE [Wyniki]
	ADD CONSTRAINT [StudentWyniki]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Zapomogi]
	ADD CONSTRAINT [KierunekZapomogi]
	FOREIGN KEY ([ID_Kierunek]) REFERENCES
		[Kierunek] ([ID_Kierunek]);
ALTER TABLE [Zapomogi]
	ADD CONSTRAINT [StudentZapomogi]
	FOREIGN KEY ([ID_Student]) REFERENCES
		[Student] ([ID_Student]);
ALTER TABLE [Zapomogi]
	ADD CONSTRAINT [StypendiaZapomogi]
	FOREIGN KEY ([ID_Stypednia]) REFERENCES
		[Stypendia] ([ID_Stypendia]);
ALTER TABLE [Zlozenie_pracy]
	ADD CONSTRAINT [Praca_dyplomowaZlozenie_pracy]
	FOREIGN KEY ([ID_pd]) REFERENCES
		[Praca_dyplomowa] ([ID_pd]);
ALTER TABLE [Zlozenie_pracy]
	ADD CONSTRAINT [StudentZlozenie_pracy]
	FOREIGN KEY ([ID_student]) REFERENCES
		[Student] ([ID_Student]);
CREATE VIEW [DodajAdres] AS SELECT Adres_code.Miasto, Adres.Dzielnica, Adres.Ulica, Adres_code.ZIP, Adres_code.ID_Wojewodztwa, Adres.ID_Adres, Adres.ID_adres_code, Adres_code.ID_adres_code
FROM (Wojewodztwo INNER JOIN Adres_code ON Wojewodztwo.ID_Wojewodztwo = Adres_code.ID_Wojewodztwa) INNER JOIN Adres ON Adres_code.ID_adres_code = Adres.ID_adres_code;

CREATE VIEW [Przynaleznosc do klas] AS SELECT Student.ID_Student, Klasa.ID_Klasa
FROM Student INNER JOIN (Klasa INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) ON Student.ID_Student = Klasy.ID_Student
GROUP BY Klasa.ID_Klasa, Student.ID_Student;

CREATE VIEW [Spis przedmiotow] AS SELECT Student.ID_Student, Przedmiot.ID_Przedmiot
FROM Student INNER JOIN ((Klasa INNER JOIN (Przedmiot INNER JOIN Przedmioty ON Przedmiot.ID_Przedmiot = Przedmioty.ID_Przedmiot) ON Klasa.ID_Klasa = Przedmioty.ID_Klasa) INNER JOIN Klasy ON Klasa.ID_Klasa = Klasy.ID_Klasa) ON Student.ID_Student = Klasy.ID_Student
GROUP BY Przedmiot.ID_Przedmiot, Student.ID_Student;

CREATE VIEW [~sq_cDodajNauczyciela~sq_cID_akademik] AS SELECT [Akademik].[ID_akademik], [Akademik].[Nazwa_a]
FROM Akademik;

CREATE VIEW [~sq_cLista_oplat~sq_cID_Oplaty] AS SELECT [Oplaty].[ID_Oplaty], [Oplaty].[Przeznaczenie], [Oplaty].[Kwota]
FROM Oplaty;

CREATE VIEW [~sq_cLista_oplat~sq_cID_Student] AS SELECT [Student].[ID_Student], [Student].[Imie_s], [Student].[Nazwisko_s]
FROM Student;

CREATE VIEW [~sq_cU_DodajNauczyciela~sq_cDodajAdres] AS SELECT Adres.ID_Adres, Adres_code.Miasto, Adres.Dzielnica, Adres.Ulica, Adres_code.ZIP, Adres_code.ID_Wojewodztwa, Adres_code.ID_adres_code
FROM Adres_code INNER JOIN Adres ON Adres_code.ID_adres_code = Adres.ID_adres_code;

CREATE VIEW [~sq_cU_DodajStudenta~sq_cDodajAdres] AS SELECT Adres.ID_Adres, Adres_code.Miasto, Adres.Dzielnica, Adres.Ulica, Adres_code.ZIP, Adres_code.ID_Wojewodztwa, Adres_code.ID_adres_code
FROM Adres_code INNER JOIN Adres ON Adres_code.ID_adres_code = Adres.ID_adres_code;

CREATE VIEW [~sq_cU_DodajStudenta~sq_cID_akademik] AS SELECT [Akademik].[ID_akademik], [Akademik].[Nazwa_a]
FROM Akademik;

CREATE VIEW [~sq_cU_DodajWynik~sq_cID_Klasa] AS SELECT [Klasa].[ID_Klasa], [Klasa].[Nazwa_klasy], [Klasa].[Nazwa_klasy_liczba], [Klasa].[ID_Semestr], [Klasa].[ID_Kierunek]
FROM Klasa;

CREATE VIEW [~sq_cU_DodajWynik~sq_cID_Ocena] AS SELECT [Ocena].[ID_Ocena], [Ocena].[Ocena_tekst], [Ocena].[Ocena]
FROM Ocena;

CREATE VIEW [~sq_cU_DodajWynik~sq_cID_Przedmiot] AS SELECT [Przedmiot].[ID_Przedmiot], [Przedmiot].[Nazwa_p], [Przedmiot].[ID_Typ_Przedmiotu]
FROM Przedmiot;

CREATE VIEW [~sq_cU_DodajWynik~sq_cID_Student] AS SELECT [Student].[ID_Student], [Student].[Imie_s], [Student].[Nazwisko_s]
FROM Student;

CREATE VIEW [~sq_cU_Lekcja~sq_cID_Godzina] AS SELECT [Godziny].[Godzina_ID], [Godziny].[START_TIME], [Godziny].[END_TIME]
FROM Godziny;

CREATE VIEW [~sq_cU_Lekcja~sq_cID_Nauczyciel] AS SELECT [Nauczyciel].[ID_Nauczyciel], [Nauczyciel].[Imie_n], [Nauczyciel].[Nazwisko_n]
FROM Nauczyciel;

CREATE VIEW [~sq_cU_Lekcja~sq_cID_Przedmiot] AS SELECT [Przedmiot].[ID_Przedmiot], [Przedmiot].[Nazwa_p], [Przedmiot].[ID_Typ_Przedmiotu]
FROM Przedmiot;

CREATE VIEW [~sq_cU_Przedmiot~sq_cECTS] AS SELECT [ECTS].[ID_ECTS], [ECTS].[ECTS]
FROM ECTS;

CREATE VIEW [~sq_cU_Przedmiot~sq_cID_Forma_Zaliczenia] AS SELECT [Forma_Zaliczenia].[ID_Forma], [Forma_Zaliczenia].[Typ_formy]
FROM Forma_Zaliczenia;

CREATE VIEW [~sq_cU_Przedmiot~sq_cID_typ_przedmiotu] AS SELECT [Typ_przedmiotu].[ID_typ_przedmiotu], [Typ_przedmiotu].[Typ_przedmiotu]
FROM Typ_przedmiotu;

CREATE VIEW [~sq_cU_Zlozenie_pracy~sq_cID_pd] AS SELECT [Praca_dyplomowa].[ID_pd], [Praca_dyplomowa].[Tytul_pracy]
FROM Praca_dyplomowa;

CREATE VIEW [~sq_cU_Zlozenie_pracy~sq_cID_student] AS SELECT [Student].[ID_Student], [Student].[Imie_s], [Student].[Nazwisko_s]
FROM Student;

CREATE VIEW [~sq_cU_Zlozenie_pracy~sq_cPoprawnoœæ_uk³adu] AS SELECT [Ocena].[ID_Ocena], [Ocena].[Ocena_tekst], [Ocena].[Ocena]
FROM Ocena;

CREATE VIEW [~sq_cU_Zlozenie_pracy~sq_cPrzyjêta_praca] AS SELECT [Ocena].[ID_Ocena], [Ocena].[Ocena_tekst], [Ocena].[Ocena]
FROM Ocena;

CREATE VIEW [~sq_cU_Zlozenie_pracy~sq_cWk³ad_w³asny] AS SELECT [Ocena].[ID_Ocena], [Ocena].[Ocena_tekst], [Ocena].[Ocena]
FROM Ocena;

CREATE VIEW [~sq_cU_Zlozenie_pracy~sq_cZgodnoœæ_z_tytu³em] AS SELECT [Ocena].[ID_Ocena], [Ocena].[Ocena_tekst], [Ocena].[Ocena]
FROM Ocena;

CREATE VIEW [~sq_cU_Zlozenie_pracy~sq_cZnajomosc_literatury] AS SELECT [Ocena].[ID_Ocena], [Ocena].[Ocena_tekst], [Ocena].[Ocena]
FROM Ocena;

CREATE VIEW [~sq_fLista_oplat] AS SELECT DISTINCTROW *
FROM Lista_oplat;

CREATE VIEW [~sq_fU_DodajNauczyciela] AS SELECT DISTINCTROW *
FROM Nauczyciel;

CREATE VIEW [~sq_fU_DodajStudenta] AS SELECT Student.Imie_s, Student.Nazwisko_s, Student.Telefon_s, Student.Data_zak, Student.ID_akademik, Student.ID_Student
FROM Student;

CREATE VIEW [~sq_fU_DodajWynik] AS SELECT Wyniki.ID_wynik, Wyniki.Data_wstawienia, Wyniki.Data_modyfikacji, Wyniki.ID_Student, Wyniki.ID_Klasa, Wyniki.ID_Przedmiot, Wyniki.ID_Ocena
FROM Wyniki;

CREATE VIEW [~sq_fU_Lekcja] AS SELECT DISTINCTROW *
FROM Lekcja;

CREATE VIEW [~sq_fU_Oplaty] AS SELECT DISTINCTROW *
FROM Oplaty;

CREATE VIEW [~sq_fU_Przedmiot] AS SELECT DISTINCTROW *
FROM Przedmiot;

CREATE VIEW [~sq_fU_Zlozenie_pracy] AS SELECT DISTINCTROW *
FROM Zlozenie_pracy;

CREATE PROCEDURE [~sq_cDodajNauczyciela~sq_cAdres_Student] (__ID_Student Value) AS 
SELECT DISTINCTROW *
FROM Adres_Student AS DodajNauczyciela
WHERE ([__ID_Student] = ID_Student);


CREATE PROCEDURE [~sq_cU_DodajNauczyciela~sq_cAdres_Nauczyciel] (__ID_Nauczyciel Value) AS 
SELECT DISTINCTROW *
FROM Adres_Nauczyciel AS U_DodajNauczyciela
WHERE ([__ID_Nauczyciel] = ID_Nauczyciel);


CREATE PROCEDURE [~sq_cU_DodajStudenta~sq_cAdres_Student] (__ID_Student Value) AS 
SELECT DISTINCTROW *
FROM Adres_Student AS U_DodajStudenta
WHERE ([__ID_Student] = ID_Student);


CREATE PROCEDURE [~sq_cU_DodajWynik~sq_cPrzynaleznosc do klas podformularz] (__ID_Student Value) AS 
SELECT DISTINCTROW *
FROM (SELECT [Przynaleznosc do klas].[ID_Student], [Przynaleznosc do klas].[ID_Klasa] FROM [Przynaleznosc do klas])  AS U_DodajWynik
WHERE ([__ID_Student] = ID_Student);


CREATE PROCEDURE [~sq_cU_DodajWynik~sq_cSpis przedmiotow Podformularz] (__ID_Student Value) AS 
SELECT DISTINCTROW *
FROM [Spis przedmiotow] AS U_DodajWynik
WHERE ([__ID_Student] = ID_Student);


CREATE PROCEDURE [~sq_cU_Lekcja~sq_cU_LIsta_lekcji] (__ID_Lekcja Value) AS 
SELECT DISTINCTROW *
FROM LIsta_lekcji AS U_Lekcja
WHERE ([__ID_Lekcja] = ID_Lekcja);


CREATE PROCEDURE [~sq_cU_Oplaty~sq_cLista_oplat] (__ID_Oplaty Value) AS 
SELECT DISTINCTROW *
FROM Lista_oplat AS U_Oplaty
WHERE ([__ID_Oplaty] = ID_Oplaty);


CREATE PROCEDURE [~sq_cU_Przedmiot~sq_cPrzedmioty] (__ID_Przedmiot Value) AS 
SELECT DISTINCTROW *
FROM Przedmioty AS U_Przedmiot
WHERE ([__ID_Przedmiot] = ID_Przedmiot);


CREATE PROCEDURE [~sq_cU_Zlozenie_pracy~sq_cPraca_dyplomowa] (__ID_pd Value) AS 
SELECT DISTINCTROW *
FROM Praca_dyplomowa AS U_Zlozenie_pracy
WHERE ([__ID_pd] = ID_pd);