\version "2.24.3"
% Scan 241, printed p. 216: Besondere Präfation am Trinitatisfeste, Schluß.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }
\score {
  <<
    \new Staff {
      \new Voice = "chant" {
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature \slurUp
        bes'1 a'1 g'1 a'1 a'1 \bar "|" bes'1 bes'1 bes'1 bes'1 a'1 g'1 g'1 g'1 ( a'1 ) \bar "|" a'1 a'1 a'1 \bar "" \break
        a'1 a'1 a'1 a'1 f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 a'1 g'1 a'1 a'1 \bar "|" bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 a'1 f'1 g'1 a'1 g'1 \bar "" \break
        g'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 a'1 \bar "|" g'1 bes'1 a'1 g'1 a'1 a'1 a'1 \bar "" \break
        a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 f'1 g'1 a'1 g'1 g'1 \bar "|" g'1 bes'1 bes'1 \bar "" \break
        bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 f'1 g'1 a'1 g'1 \bar "" \break
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 a'1 \bar "" \break
        a'1 a'1 a'1 a'1 a'1 f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 bes'1 a'1 f'1 g'1 a'1 g'1 \bar "|."
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Gott" "und" "Ein" "HErr" "bist," "nicht" "in" "Ein :" "zel :" "heit" "der" "Per :" "son," \skip 1 "son :" "dern" "in"
      "Drei :" "heit" "des" "ei :" "ni :" "gen" "We :" "sens." "Denn" "was" "wir" "von" "dei :" "ner" "Herr :" "lich :" "keit"
      "aus" "dei :" "nem" "Mun :" "de" "glau :" "ben," "daß" "glau :" "ben" "wir" "auch" "oh :" "ne" "al :" "len" "Un :"
      "ter :" "schied" "und" "Zwei :" "fel" "von" "dei :" "nem" "Soh :" "ne" "und" "dem" "Hei :" "li :" "gen" "Gei :" "ste;"
      "und" "im" "Be :" "kennt :" "niß" "des" "rech :" "ten" "ei :" "ni :" "gen" "Got :" "tes" "be :" "ten" "wir"
      "an" "der" "Per :" "so :" "nen" "Ver :" "schie :" "den :" "heit" "und" "des" "We :" "sens" "Ei :" "nig :" "keit"
      "und" "die" "voll :" "kom :" "me :" "ne" "Gleich :" "heit" "Ei :" "ner" "Ma :" "je :" "stät," "wie" "dich" "auch"
      "lo :" "ben" "die" "En :" "gel," "an :" "be :" "ten" "die" "Herr :" "schaf :" "ten," "fürch :" "ten" "die" "Mäch :" "te,"
      "die" "Him :" "mel" "und" "al :" "ler" "Him :" "mel" "Kräf :" "te," "sammt" "den" "se :" "li :" "gen" "Se :" "ra :" "phim"
      "mit" "ein :" "hel :" "li :" "gem" "Ju :" "bel" "prei :" "sen." "Mit" "ih :" "nen" "laß" "auch" "un :" "se :"
      "re" "Stim :" "men" "uns" "ver :" "ei :" "nen" "und" "an :" "be :" "tend" "zu" "dir" "spre :" "chen:"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
