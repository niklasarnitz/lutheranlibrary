\version "2.24.3"
% Scan 238, printed p. 213: Besondere Präfation am Osterfeste.
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
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 a'1 g'1 a'1 a'1 a'1 a'1 \bar "|" g'1 bes'1 a'1 \bar "" \break
        g'1 a'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 a'1 \bar "" \break
        g'1 a'1 a'1 \bar "|" a'1 a'1 g'1 a'1 bes'1 a'1 \shortBar a'1 a'1 f'1 f'1 g'1 a'1 g'1 \bar "" \break
        g'1 bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 a'1 \bar "|" a'1 a'1 a'1 bes'1 a'1 a'1 \bar "" \break
        f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 \bar "" \break
        a'1 bes'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "" \break
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 a'1 g'1 a'1 a'1 a'1 \bar "|" a'1 a'1 f'1 g'1 a'1 g'1 \bar "|."
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Wahr-" "haft" "wür :" "dig" "und" "recht," "bil :" "lig" "und" "heil :" "sam" "ist" "es," "daß" "wir" "dich,"
      "HErr," "al :" "le :" "zeit," "son :" "der :" "lich" "a :" "ber" "an" "die :" "sem" "Ta :" "ge" "herr :" "li :"
      "cher" "prei :" "sen." "Denn" "es" "ist" "ge :" "o :" "pfert" "un :" "ser" "O :" "ster :" "lamm," "Chri :" "stus."
      "Er" "ist" "das" "wahr :" "haf :" "ti :" "ge" "Got :" "tes :" "lamm," "wel :" "ches" "die" "Sün :" "de" "der"
      "Welt" "ge :" "tra :" "gen," "un :" "sern" "Tod" "durch" "sei :" "nen" "Tod" "zer :" "stö :" "ret" "und" "durch"
      "sein" "Auf :" "er :" "ste :" "hen" "das" "Le :" "ben" "her :" "wie :" "der" "ge :" "bracht" "hat." "Dar :" "um"
      "mit" "al :" "len" "En :" "geln" "und" "Erz :" "en :" "geln," "mit" "den" "Thro :" "nen" "und" "Herr :" "schaf :" "ten"
      "und" "mit" "dem" "gan :" "zen" "himm :" "li :" "schen" "Hee :" "re" "sin :" "gen" "wir" "dei :" "ner" "Herr :"
      "lich :" "keit" "ei :" "nen" "Lob :" "ge :" "sang" "und" "spre :" "chen" "ohn" "En :" "de:"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
