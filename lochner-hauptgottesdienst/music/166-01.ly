\version "2.24.3"
\language "english"

\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm
  right-margin = 0\mm
  top-margin = 0\mm
  bottom-margin = 0\mm
  indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 18)

\score {
  \new Staff \with { \omit TimeSignature } {
    \clef treble
    \cadenzaOn
    g'1 g'1^\fermata \bar "|."
  }
  \addlyrics { A -- men. }
  \layout { ragged-right = ##t }
}
