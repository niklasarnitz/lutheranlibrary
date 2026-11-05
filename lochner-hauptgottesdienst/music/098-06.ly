\version "2.24.3"
#(set-global-staff-size 18)
% Source pause mark follows the opening “HErr” note; represented by \breathe, not a metric rest.

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
        g'1 \breathe g' g' g' g' \bar "|" g' g' g' g' g' e' g'\breve \bar "||"
        e'1 g' g' g' \break
        g'1 g' g' g' e' \bar "|"
        g'1 fis' e' g'\breve \bar "|"
        g'1 g' g' g' g' g' g'
      }
    >>
    \new Lyrics \lyricsto "melody" {
      HErr, leh -- re mich thun nach dei -- nem Wohl -- ge -- fal -- len.
      Dan -- ket dem HErrn,
      denn er ist freund -- lich. Hal -- le -- lu -- ja.
      Und sei -- ne Gü -- te wäh -- ret
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
