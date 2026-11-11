\version "2.24.3"
% Scan 190, printed p. 165: Hoya 1581 congregational response.
% Bass event 3 divides into D4/G3/G2, confirmed against the enlarged scan.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 0\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new PianoStaff <<
   \new Staff <<
    \new Voice = "soprano" { \voiceOne \clef treble \key g \major \cadenzaOn
      g'2 a'2 b'2 g'2( a'2) b'1 a'1 \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      d'2 fis'2 g'2 e'2( fis'2) g'1 fis'1 }
   >>
   \new Staff <<
    \new Voice { \voiceOne \clef bass \key g \major \cadenzaOn
      b2 d'2 <g d'>2 b2( d'2) d'1 d'1 \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      g2 d2 g,2 e2( d2) g,1 d1 }
   >>
  >>
  \new Lyrics \lyricsto "soprano" { Und mit dei -- nem Gei -- ste. }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
