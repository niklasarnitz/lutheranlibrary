\version "2.24.3"
% Scan 246, III. Sanctus, Knaben opening, Luther melody.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 110\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 3\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new PianoStaff <<
  \new Staff { \new Voice = "chant" { \clef treble \time 4/4
    <e' c''>1 | <d' b'>1 | <f' a'>1 | <e' g'>1 | <f' a'>1 | <d' b'>1 | <e' g'>1 \break
    <d' f'>1 | <b g'>1 | <c' e'>1 | <e' c''>1 | <f' a'>1 | <c' f'>1 \bar "|" } }
  \new Staff { \clef bass \time 4/4
    R1 | R1 | R1 | R1 | R1 | R1 | R1
    R1 | R1 | R1 | a1 | e1 | f1 \bar "|" }
 >>
 \new Lyrics \lyricsto "chant" { Hei -- lig ist Gott, der HEr -- re Ze -- ba -- oth! Hei -- lig ist }
>> \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } } }
