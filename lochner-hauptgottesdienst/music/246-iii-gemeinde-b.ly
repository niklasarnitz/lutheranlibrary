\version "2.24.3"
% Scan 246, III. Sanctus, Gemeinde, continuation and close.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 110\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 3\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new PianoStaff <<
  \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn
   <d' g' b'>1 \bar "|" <c' e' g'>1 \bar "|" <d' f'>1 \bar "|" <d' g'>1 \bar "|" <c' e'>1^\fermata \bar "|" <f' a'>1 \bar "|" \break
   <e' g'>2 <d' f'>2 \bar "|" <b g'>2 <a c'>2 \bar "|" <a f'>2 <c' e'>2 \bar "|" <a d'>2 <b d'>2 \bar "|" <g c'>1 \bar "|." } }
  \new Staff { \clef bass \cadenzaOn
   g,1 \bar "|" c1 \bar "|" <d a>1 \bar "|" <g, b>1 \bar "|" <a, a>1_\fermata \bar "|" <f, c'>1 \bar "|"
   <c c'>2 <d a>2 \bar "|" <g, g>2 <a, e>2 \bar "|" <d f>2 <c g>2 \bar "|" <f, f>2 <g, d>2 \bar "|" <c e>1 \bar "|." }
 >>
 \new Lyrics \lyricsto "chant" { HEr -- re Ze -- ba -- oth. Sein Ehr die gan -- ze Welt er -- fül -- let hat. }
>> \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
