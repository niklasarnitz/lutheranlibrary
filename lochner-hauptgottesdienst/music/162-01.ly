\version "2.24.3"
% Scan 162, printed p. 137: first one-member Versikel formula, without Halleluja.
#(set-global-staff-size 18)
\header { piece = "P." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \cadenzaOn \slurUp
    e'1( g') g'1 g' g' g'\breve g'1 g' g' g' g' g'\breve e'\breve
    \bar "||"
  }
  \addlyrics {
    "HErr," __ "leh :" -- re mich thun nach "dei :" -- nem "Wohl :" -- ge -- "fal :" -- len.
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
