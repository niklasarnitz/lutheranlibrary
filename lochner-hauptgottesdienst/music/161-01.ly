\version "2.24.3"
% Scan 161, printed p. 136: one-member Versikel without Halleluja.
#(set-global-staff-size 18)
\header { piece = "P. — Wollersheim, Gregor. Ges. 1858." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \cadenzaOn
    g'\breve \bar "|" g'1 g' g' g' g' g'\breve \bar "|"
  }
  \addlyrics { "HErr," "er :" "hal :" te uns dein Wort. }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
