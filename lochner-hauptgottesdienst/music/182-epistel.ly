\version "2.24.3"
% Scan 182, printed p. 157: Epistelton, continuation um ... widerfahren.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm paper-height = 155\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 0\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new Staff { \new Voice = "melody" { \clef treble \key g \major \cadenzaOn \override Stem.stencil = ##f
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)
    g'1 g'1 g'1 b'1 a'1 a'1 a'1 g'1 g'\breve \bar "|"
    d'1 g'1 g'1 fis'1 g'1 \bar "|" \break
    b'1 a'1 a'1 g'\breve  \break
    d'1 g'1 g'1 g'1 g'1 g'1 fis'1 g'\breve \bar "|"
    g'1 g'1 a'1 a'1 g'1 \bar "|" \break
    g'1 g'1 g'1 g'1 g'1 
    a'1 a'1 g'1 \bar "|" \break
    g'1 g'1 g'1 g'1 e'1 e'1 g'1 g'\breve \bar "|"
    g'1 g'1 g'1 g'1 g'1 g'1 b'1 a'1 a'1 g'\breve \bar "|" \break
    a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 b'1 c''1 b'1 a'1 a'1 g'\breve \bar "|." } }
  \new Lyrics \lyricsto "melody" { um bin ich nicht "ge :" "recht :" "fer :" "ti :" get.
    Der HErr "a :" ber ist's,
    der mich "rich :" tet.
    "Dar :" um "rich :" tet nicht vor der Zeit,
    bis der HErr "kom :" me,
    "wel :" cher auch wird ans
    Licht "brin :" gen,
    was im "Fin :" stern "ver :" "bor :" gen ist,
    und den Rath der "Her :" zen "of :" "fen :" "ba :" ren.
    "Als :" dann wird "ei :" nem "Jeg :" "li :" chen von Gott Lob "wi :" "der :" "fah :" ren. }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
