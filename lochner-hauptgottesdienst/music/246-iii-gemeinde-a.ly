\version "2.24.3"
% Scan 246, III. Sanctus, Gemeinde, first printed system.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 110\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 3\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new PianoStaff <<
  \new Staff { \new Voice = "chant" { \clef treble \time 4/4
   <e' g'>1 | <c' a'>1 | <d' b'>1 | <e' g'>1 | <d' f'>1 | <b g'>1 \break
   <b d' f'>1 | <e' a' c''>1 | <e' g' b'>1 | <c' f' a'>1 | <c' e' g'>1 | <c' e' a'>1 \bar "|" } }
  \new Staff { \clef bass \time 4/4
   c'1 | a1 | g1 | c'1 | d'1 | g1
   a1 | a,1 | e1 | f1 | b,1 | a,1 \bar "|" }
 >>
 \new Lyrics \lyricsto "chant" { Gott, der HEr -- re Ze -- ba -- oth! Hei -- lig ist Gott, der }
>> \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
