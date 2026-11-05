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
        \cadenzaOn
        \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
        g'1 g' g' g' g' g' e' g'\fermata \break
        e' g' g' g' g' g' g' g' g' g' g' fis' e' g' g'\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      All -- mäch -- ti -- ger e -- wi -- ger Gott,
      der du die gan -- ze Chris -- ten -- heit hei -- li -- gest und re -- gie -- rest
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
