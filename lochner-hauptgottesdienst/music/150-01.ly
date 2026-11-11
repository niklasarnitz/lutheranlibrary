\version "2.24.3"
% Scan 150, printed p. 125: pastoral Gloria intonation, Strasbourg 1525 etc.
#(set-global-staff-size 18)
\header { piece = "Pastor." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \cadenzaOn \slurUp
    g'\breve g'1 g' g'( a' b'\breve) a'1 b' c''\breve g'\breve \bar "|."
  }
  \addlyrics { "Eh :" -- re sei Gott __ __ in der "Hö :" -- he! }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
