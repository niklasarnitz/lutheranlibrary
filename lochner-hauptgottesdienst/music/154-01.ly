\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 129 (scan 154), first printed system.
% Upper staff has solo melody and a printed whole-measure rest in the other voice.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
solo = \fixed c' { \global \tempo "Etwas langsamer." b2\p d'2 | d'4 b4 g4 fis4 | g2.\< a4\! | g2\> fis4 r4\! | g2 fis4 g4 \bar "|" }
resting = \fixed c' { \global R1*5 }
tenor = \fixed c { \global d'2 g'2 | fis'4 e'4 d'4 c'4 | b2. c'4 | b2 a4 r4 | g2 a4 b4 }
bass = \fixed c { \global g,2 b,2 | d4 d4 d4 d4 | e2. c4 | d2 d4 s4 | b,2 a,4 g,4 }
words = \lyricmode { \set stanza = "Soli." HErr Gott, du Lamm Got -- tes, Sohn des Va -- ters, der du die }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "solo" { \voiceOne \solo } \new Voice { \voiceTwo \resting } >>
  \new Lyrics \lyricsto "solo" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
