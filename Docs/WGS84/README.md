# World Geodetic System 1984

System WGS84 wykorzystuje IERS Reference Meridian (IRM) do fizycznej realizacji tego systemu na powierzchni kuli ziemskiej. System ten nie jest na sztywno dopasowany do żadnego punktu na powierzchni ziemi, lecz jest regularnie wpasowywany w sieć stacji referencyjnych włączonych do IERS. Współrzędne wszystkich stacji są wyrównywane co roku w celu usunięcia wpływu ruchu płyt tektonicznych, w wyniku czego współrzędne na płycie euroazjatyckiej zmieniają się około 2.5 cm rocznie. Biorąc pod uwagę, że układ WGS84 zaczęto stosować kilkadziesiąt lat temu, różnice mogą sięgać wartości bliskich jednego metra.

System odniesienia WGS 84 doczekał się wielu realizacji na fizycznej powierzchni kuli ziemskiej:

- WGS 84 (Original) / ITRF 90 - Departament Of Defence zdefiniował WGS84 na podstawie satelitarnych pomiarów zjawiska Dopplera przypadających na dzień 23 stycznia 1987 r. 
- WGS84 (G730) / ITRF 91 - Inicjalna definicja układu odniesienia została zaktualizowana na podstawie fizycznej realizacji systemu WGS84 opartej na obserwacjach GPS, która przypada na dzień 2 stycznia 1994r. Definicja układu odniesienia spójna z 730. tygodniem GPS była stosowana przez orbitujące satelity od 28 czerwca 1994 r.
- WGS84 (G873) / ITRF 94 - definicja układu odniesienia została ponownie zaktulaizowana 30 września 1996 r. (początek 873. tygodnia GPS) poprzez jeszcze bardziej dokładne dopasowanie do International Earth Rotation Service (IERS) - Terrestrial Reference Frame (ITRF) 94. Ta definicja układu odniesienia została zaadoptowana przez orbitujące satelity 29 stycznia 1997 r.
- WGS 84 (G1150) / ITRF 2000 - następna aktualizacja układu odniesienia nastąpiła 20 stycznia 2002. Ta realizacja bazuje na ITRF 2000.
- WGS84 (G1674) - ITRF2008 - aktualnie obowiązująca definicja układu odniesienia, wprowadzona w dniu 8 lutego 2008.
  
Wyniki pomiarów wykonane z zastosowaniem pierwszej implementacją WGS84 (Original) oraz aktualnej wersji WGS84 (G1150) mogą różnić się nawet o 2 metry (w zależności od położenia na kuli ziemskiej).

***

## Literatura

- https://confluence.qps.nl/pages/viewpage.action?pageId=29855173
- https://en.wikipedia.org/wiki/IERS_Reference_Meridian
- http://sxbluegps.com/technology/a-word-about-datum/
- https://confluence.qps.nl/qinsy/en/international-terrestrial-reference-frame-2014-itrf2014-29856813.html (ETRF80 == > ITRF89 ⇒ Datum Epoch: 1984.0)
- https://confluence.qps.nl/qinsy/en/world-geodetic-system-1984-wgs84-29855173.html
- Don Abbey, WGS84, ITRF & GDA94: What’s the difference?
- Implementation of the World Geodetic System 1984 (WGS 84) Reference Frame G1150
- Transformation parameters between ITRS, WGS84 and ETRS89
