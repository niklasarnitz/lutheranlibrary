\version "2.24.3"
#(set-global-staff-size 18)
% Source comma-like pause before “daß ich”, represented by \breathe rather than a metric rest.

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
  <<
    \new Staff <<
      \new Voice = "melody" {
        \clef treble
        \cadenzaOn
        \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
        g'1 g' g' g' g' g' g'\breve \bar "||"
        \breathe g'1 g'
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Wei -- se mir, HErr, dei -- nen Weg, daß "ich &c."
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
