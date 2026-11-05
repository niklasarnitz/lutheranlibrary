\version "2.24.3"
\language "english"

#(set-global-staff-size 18)

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
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)
    \omit Stem
    f'1 g'1( a'1) \bar "|"
    a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \bar "|"
    bf'1 a'1 g'1 a'1 \bar "||"
  }
  \layout { ragged-right = ##t }
}
