\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 129 (scan 154), fourth printed system.
% Rich chord voicings follow individual printed heads, including seven heads at Rech-.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global \dynamicUp d'2\> c'4 b4\! | c'2\> c'4 c'4\p\! | b2\> a4 a4\! | g4 g4 r4 a4\p | g4 g4 fis4 fis4 \bar "|" }
alto = \fixed c' { \global g2 fis4 g4 | g2 g4 g4 | g2 fis4 fis4 | e4 e4 s4 e4 | d4 d4 d4 d4 }
tenor = \fixed c { \global d'2 d'4 d'4 | e'2 e'4 e'4 | d'2 c'4 c'4 | b4 b4 r4 c'4 | b4 b4 a4 a4 }
bass = \fixed c { \global b2\> a4 g4\! | c2\> c4 c4\p\! | d2 d4 d4 | e4 e4 s4 c4 | d4 d4 d4 d4 }
words = \lyricmode { Rech -- ten des Va -- ters, er -- bar -- me dich un -- ser! Denn du al -- lein bist }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
