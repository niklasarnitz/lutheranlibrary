\version "2.24.3"
% Scan 158, printed p. 133: traditional C-major congregational response.
#(set-global-staff-size 18)
\header { piece = "Traditionell." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new PianoStaff <<
    \new Staff <<
      \clef treble \cadenzaOn
      \new Voice = "choir" { \voiceOne g'2 g'2 g'2 g'2 e'2( fis'2) g'1 \bar "|." }
      \new Voice { \voiceTwo d'2 d'2 d'2 d'2 c'2( d'2) d'1 }
    >>
    \new Lyrics \lyricsto "choir" { Und mit "dei :" -- nem "Gei : :" __ ste. }
    \new Staff <<
      \clef bass \cadenzaOn
      \new Voice { \voiceOne b2 b2 b2 b2 a2( d2) b1 }
      \new Voice { \voiceTwo g2 g2 g2 g2 a1 g,1 }
    >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
