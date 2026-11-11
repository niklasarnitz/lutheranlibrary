\version "2.24.3"
% Scan 157, printed p. 132: first organ intonation and pastoral salutation.
#(set-global-staff-size 18)
\header { piece = "Inton. durch die Orgel. — Pastor." tagline = ##f }
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
    <c' e' g'>\breve\fermata \bar "||"
    g'1 g'\breve e'1 fis' g'\breve \bar "|"
  }
  \addlyrics { \skip 1 Der HErr sei mit "euch!" }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
