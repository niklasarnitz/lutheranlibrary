\version "2.24.3"
\language "english"

#(set-global-staff-size 14)

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

\score {
  \new Staff \with { \omit TimeSignature } {
    \clef treble
    \cadenzaOn
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
    \omit Stem
    g'1 g'1 g'1 g'1 g'1 g'1 g'1 g'1 g'1 g'1 \bar "|"
    g'1 f'1 g'1( a'1) g'1 \bar "||"
  }
  \layout { ragged-right = ##t }
}
