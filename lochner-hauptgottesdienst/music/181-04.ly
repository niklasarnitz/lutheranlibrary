\version "2.24.3"
% Scan 181, printed p. 156: Colon.
#(set-global-staff-size 18)
\header { piece = "Colon." tagline = ##f }
\paper { paper-width = 100\mm top-margin = 0\mm bottom-margin = 0\mm
  left-margin = 0\mm right-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  <<
    \new Staff { \new Voice = "melody" {
      \clef treble \key g \major \cadenzaOn
      \override Stem.stencil = ##f
      \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)
      g'1 g'1 e'1 e'1 g'1 g'\breve \bar "|"
    } }
    \new Lyrics \lyricsto "melody" { so "a :" ber ein "Ko :" "lon," }
  >>
  \layout { ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" } }
}
