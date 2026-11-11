\version "2.24.3"
% Scan 162, printed p. 137: abbreviated Bayreuth alternative.
#(set-global-staff-size 18)
\header { piece = "Bayreuth. Chorord. 1755. — Oder:" tagline = ##f }
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
    g'\breve \bar "|" g'1 g' g'
  }
  \addlyrics { "HErr," "leh :" -- re "mich &c." }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
