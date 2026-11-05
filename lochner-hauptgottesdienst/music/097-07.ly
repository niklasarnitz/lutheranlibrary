\version "2.24.3"
#(set-global-staff-size 18)

\paper {
  paper-width = 100\mm
  paper-height = 250\mm
  left-margin = 0\mm
  right-margin = 0\mm
  top-margin = 0\mm
  bottom-margin = 0\mm
  indent = 0\mm
  tagline = ##f
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  \new Staff {
    \clef treble
    \cadenzaOn
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
    g'1 a' b' a' g'\breve \bar "|."
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
