\version "2.24.3"
\pointAndClickOff
% Scan 151 / printed p. 126, end of the fourth system.
% The damaged final bass head on “zur” is provisionally G3.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 4\mm right-margin = 2\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
global = { \cadenzaOn \accidentalStyle forget }
soprano = \fixed c' { \global g4 a4 b2 a4 b4 }
alto = \fixed c' { \global e4 fis!4 g2 e4 g4 }
tenor = \fixed c { \global b4 d'4 d'2 c'4 d'4 }
bass = \fixed c { \global e4 d4 g2 a4 g4 }
words = \lyricmode { Der du si -- tzest zur }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout { indent = 0\mm \context { \Score \autoBeamOff } \context { \Staff \omit TimeSignature } } }
