\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 129 (scan 154), second printed system.
% Double bar marks the transition from solo to Tutti / Tempo I within the print system.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global a4(\< c'4)\! b4 a4 | g2( fis2) | g2 r4 s4 \bar "||" \partial 4 \tempo "Tutti. Tempo I." b4\pp | b2 a4 g4 | g2\> fis4 r4\! | g2 g4 g4 \bar "|" }
alto = \fixed c' { \global R1*3 | g4 | g2 d4 d4 | d2 d4 s4 | d2 d4 d4 }
tenor = \fixed c { \global c'4( e'4) d'4 c'4 | b2( a2) | b2 r4 s4 \bar "||" \partial 4 d'4 | d'2 c'4 b4 | b2 a4 r4 | b2 b4 b4 }
bass = \fixed c { \global c4( a,4) b,4 c4 | d1 | g,2 s2 \bar "||" \partial 4 g4 | g2 fis4 g4 | d2 d4 s4 | g2 g4 g4 }
words = \lyricmode { Sün -- de der Welt trägt, er -- bar -- me dich un -- ser! Der du die }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
