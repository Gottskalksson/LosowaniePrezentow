create or replace PROCEDURE losowanie AS
BEGIN
   FOR i IN (
      SELECT imie
        FROM wyniklosowania
       ORDER BY dbms_random.value
   ) LOOP
      DECLARE
         wybrany VARCHAR2(10);
      BEGIN
         SELECT osoby.imie
           INTO wybrany
           FROM osoby osoby
          WHERE osoby.imie NOT IN (
            SELECT z.zabronione
              FROM zabronionepary z
             WHERE z.imie = i.imie
         ) --wykluczamy zabronione opcje zadeklarowane w tabeli zabronionepary
            AND osoby.imie NOT IN (
            SELECT w.wylosowany
              FROM wyniklosowania w
             WHERE w.wylosowany IS NOT NULL
         ) --wykluczamy wylosowane juz wczesniej osob
            AND osoby.imie NOT IN ( i.imie ) --na koniec - wykluczamy mozliwosc trafienia na siebie samego
          ORDER BY dbms_random.value -- kolejnosc losowa
          FETCH FIRST ROW ONLY; -- zapytanie odda tylko 1 wiersz

         UPDATE wyniklosowania
            SET
            wylosowany = wybrany
          WHERE imie = i.imie;

         dbms_output.put_line('Data i godzina losowania: ' || to_char(sysdate, 'dd-mm-yyyy hh24:mm:ss'));
         dbms_output.put_line('W tym roku '
                              || i.imie
                              || ' robi prezent dla: '
                              || wybrany);
      END;
   END LOOP;
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line('Blad w trakcie losowania - sprobuj jeszcze raz');
      ROLLBACK;
END;