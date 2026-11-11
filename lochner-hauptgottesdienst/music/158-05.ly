\version "2.24.3"
% Scan 158, printed p. 133: Roman model of the salutation and response.
#(set-global-staff-size 18)
\header { tagline = ##f }
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
    f'1 f' f' e'( d') f' f' \bar "||"
    d'1 f' f' e'2 d'2 e'1( f') f' \bar "|."
  }
  \addlyrics {
    Do -- mi -- nus vo __ bis -- cum.
    Et cum spi -- ri -- tu tu __ o.
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
