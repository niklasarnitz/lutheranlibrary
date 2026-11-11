\version "2.24.3"
% Scan 234, printed p. 209: Gemeine Präfation, Anfang.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
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
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 a'1 \allowBreak g'1 a'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 bes'1 \allowBreak \shortBar \allowBreak
        bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 bes'1 \allowBreak bes'1 \bar "|" bes'1 a'1 g'1 a'1 \bar "|" g'1 bes'1 bes'1 \allowBreak bes'1 bes'1 \allowBreak
        bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 a'1 \allowBreak f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 \allowBreak bes'1 \allowBreak
        bes'1 bes'1 bes'1 \shortBar bes'1 a'1 g'1 a'1 a'1 \allowBreak \bar "|" g'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 \allowBreak f'1 \allowBreak
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Wahr :" "haft" "wür :" "dig" "und" "recht," "bil :" "lig" "und" "heil :" "sam" "ist’s," "daß" "wir" "dir," "HErr,"
      "hei :" "li :" "ger," "all :" "mäch :" "ti :" "ger" "Va :" "ter," "e :" "wi :" "ger" "Gott," "al :" "le :" "zeit" "und" "ü :"
      "ber :" "all" "dank :" "sa :" "gen" "durch" "Chri :" "stum," "un :" "sern" "HEr :" "ren," "durch" "wel :" "chen" "dei :" "ne"
      "Ma :" "je :" "stät" "lo :" "ben" "die" "En :" "gel," "an :" "be :" "ten" "die" "Herr :" "schaf :" "ten," "fürch :" "ten"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
