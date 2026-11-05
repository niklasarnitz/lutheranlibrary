\version "2.24.3"
% Scan 190, printed p. 165: first pastoral Salutation.
% Six whole notes; the final two carry euch under a slur.
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
    \clef treble \key g \major \cadenzaOn \slurUp
    g'1 g' fis' g' e'( g') \bar "|"
  }
  \addlyrics { Der HErr sei mit "euch!" }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
