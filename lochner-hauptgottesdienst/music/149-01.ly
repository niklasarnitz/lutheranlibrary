\version "2.24.3"
% Scan 149, printed p. 124: opening line of Luther's Gloria-Lied.
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
    \clef treble \key g \major \cadenzaOn \slurUp
    g'1 e' g' g'\breve
    \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
    g'1 a'( b') c''( b' a' g' e' fis') g'\breve \bar "|."
  }
  \addlyrics {
    "Eh :" -- re sei Gott in der __ "Hö : : : : : : :" __ __ __ __ __ he!
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
