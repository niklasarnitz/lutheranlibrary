\version "2.24.3"
% Scan 190, printed p. 165: Bopelius 1682, Gospel announcement.
% Twenty whole notes, reflowed after Evangelium without adding a barline.
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
    \clef treble \key g \major \cadenzaOn
    g'1 g' g' g' g' g' a' g' g' \break
    g' g' g' g' g' g' g' a' b' a' g' \bar "|."
  }
  \addlyrics {
    Dies hei -- li -- ge E -- van -- ge -- li -- um
    be -- schreibt der E -- van -- ge -- list
    "St." Mat -- thä -- "us."
  }
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-1 }
  }
}
