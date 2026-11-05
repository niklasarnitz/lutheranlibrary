\version "2.24.3"
#(set-global-staff-size 18)
% Source phrase arcs are slurred across the “wil” and final “HErr” melismas.

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
        g'1 g' g' fis' g' e' fis' g'\breve \bar "|"
        e'1 g' a'\breve g'\breve \bar "||"
        e'1 fis' g' g' g' \break
        \slurUp
        g'1 g' a' g' e'( g') g'\breve \bar "||"
        g'1 g' g'\breve \bar "|"
        g'1 a' g'\breve( fis'\breve) e'\breve \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Durch JE -- sum Chri -- stum, dei -- nen Sohn, un -- serm HErr -- en.
      Um JE -- su Chri -- sti,
      un -- sers HErr -- en, wil __ len.
      Dei -- nen Sohn, un -- serm HErr __ en.
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
