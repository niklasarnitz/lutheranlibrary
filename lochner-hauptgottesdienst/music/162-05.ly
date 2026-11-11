\version "2.24.3"
% Scan 162, printed p. 137: two-member Versikel with Halleluja, first formula.
#(set-global-staff-size 18)
\header { piece = "P." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \cadenzaOn
    g'1 g' g' g' g' e' g'\breve \bar "|"
    g'1 f' e'\breve g'\breve \bar "||"
  }
  \addlyrics {
    "Be :" -- "rei :" -- tet den Weg dem "HErrn,"
    "Hal :" -- "le :" -- "lu :" -- "ja!"
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
