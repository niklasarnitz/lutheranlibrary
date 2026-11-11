\version "2.24.3"
% Scan 190, printed p. 165: Bopelius 1682, congregation's Und mit deinem Geiste.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 0\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new PianoStaff <<
   \new Staff <<
    \new Voice = "soprano" { \voiceOne \clef treble \key g \major \cadenzaOn
      g'2 g'2 g'2 g'2 \bar "|" g'2( e'2) g'1 \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      d'2 d'2 e'2 e'2 d'2( c'2) b1 }
   >>
   \new Staff <<
    \new Voice { \voiceOne \clef bass \key g \major \cadenzaOn
      b2 b2 c'2 c'2 \bar "|" b2( a2) b1 \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      g,2 g,2 c2 c2 g,2( a,2) g,1 }
   >>
  >>
  \new Lyrics \lyricsto "soprano" { Und mit dei -- nem Gei __ ste. }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
