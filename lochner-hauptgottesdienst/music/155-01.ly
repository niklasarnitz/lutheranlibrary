\version "2.24.3"
\pointAndClickOff
% Bortniansky, IV. Laudamus, source p. 130 (scan 155), first printed system.
\header { tagline = ##f }
#(set-global-staff-size 14)
\paper { paper-width = 120\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \key g \major \omit Staff.TimeSignature \time 4/4 }
soprano = \fixed c' { \global \dynamicUp g2\> g2\! | fis4\p fis4\< fis4 fis8 fis8\! | g2 g4 g4 | a4 a8 a8 a4 g4 | g2 fis4 r4 \bar "|" }
alto = \fixed c' { \global d2 d2 | d4 d4 d4 d8 d8 | d2 d4 d4 | d4 d8 d8 d4 d4 | d2 d4 s4 }
tenor = \fixed c { \global b2 b2 | a4 a4 a4 a8 a8 | b2 a4 a4 | c'4 c'8 c'8 c'4 b4 | b2 a4 r4 }
bass = \fixed c { \global g2 g2 | d4 d4 d4 d8 d8 | d2 d4 d4 | d4 d8 d8 fis4 g4 | d2 d4 s4 }
words = \lyricmode { hei -- lig, du al -- lein bist der HErr, du al -- lein bist der Al -- ler -- höch -- ste, __ }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout {
  indent = 0\mm
  \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
} }
