\version "2.24.3"
\pointAndClickOff
% Scan 152 / printed p. 127, fourth system: extended Amen.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 123\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 4\mm right-margin = 2\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
global = { \cadenzaOn \accidentalStyle forget }
soprano = \fixed c' { \global g4( a4 b4 g4 a4 b4 c'4 a4 b4 c'4 d'2 c'4 b4 a2) g1 \bar "|." }
alto = \fixed c' { \global e4( fis!4 g4 d4 fis!4 g2 fis!4 g4 e4 g2 e4 d4 d2) d1 }
tenor = \fixed c { \global b4( d'2 b4 d'2 e'4 d'4 d'4 c'4 b2 g2. fis!4) <g b>1 }
bass = \fixed c { \global e4 d4 g2 d4 g4 c4 d4 g4 a4 g2 c4 g,4 d2 g,1 }
words = \lyricmode { A __ "men." }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout { indent = 0\mm \context { \Score \autoBeamOff } \context { \Staff \omit TimeSignature } } }
