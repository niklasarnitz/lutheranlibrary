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
  <<
    \new Staff <<
      \new Voice = "melody" {
        \clef treble
        \key f \major
        \cadenzaOn
        \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
        g'1 bes' bes' bes' bes' bes' bes' a' g' bes' bes' bes' \bar "||"
        g' bes' \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Wahr -- haft wür -- dig und recht, bil -- lig und heil -- sam ist's,
      daß wir
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
