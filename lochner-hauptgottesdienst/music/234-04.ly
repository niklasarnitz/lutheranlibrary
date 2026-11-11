\version "2.24.3"
% Scan 234, printed p. 209: Guidetti 1589, Vergleichsbeispiel in der Anmerkung.
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
        bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \allowBreak \bar "|" bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 \allowBreak bes'1 bes'1 bes'1 bes'1 \bar "|" bes'1 bes'1 bes'1 bes'1 \allowBreak \allowBreak
        bes'1 a'1 g'1 g'1 ( a'1 ) a'1 a'1 \bar "|" g'1 \allowBreak bes'1 bes'1 bes'1 bes'1 \bar "|" bes'1 bes'1 bes'1 bes'1 \allowBreak bes'1 bes'1 \bar "|" bes'1 a'1 g'1 a'1 a'1 \bar "|" \allowBreak
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Ve :" "re" "di :" "gnum" "et" "ju :" "stum" "est," "ae :" "quum" "et" "sa :" "lu :" "ta :" "re," "nos" "ti :" "bi" "sem :" "per" "et" "u :" "bi :" "que"
      "gra :" "ti :" "as" "a" \skip 1 "ge :" "re:" "Do :" "mi :" "ne" "sanc :" "te," "Pa :" "ter" "o :" "mni :" "po :" "tens," "ae :" "ter :" "ne" "De :" "us etc."
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}
