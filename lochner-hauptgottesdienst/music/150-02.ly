\version "2.24.3"
\pointAndClickOff
% Lochner p.125, scan 150: the first full congregational score after the pastor's intonation.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 115\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \cadenzaOn }
soprano = \fixed c' { \global
  a4 d4 e4 fis!4 g2 \bar "|"
  g4 a4 a4 b8 b8 c'4 b4 a2 a2 \bar "|."
}
alto = \fixed c' { \global
  c4 b,4 c4 c4 d2 \bar "|"
  e4 e4 fis!4 g8 g8 g4 g2 fis!8 e8 fis2 \bar "|."
}
tenor = \fixed c { \global
  e4 g4 g4 a4 b2 \bar "|"
  b4 c'4 d'4 d'8 d'8 e'4 d'4 d'2 d'2 \bar "|."
}
bass = \fixed c { \global
  a,4 g,4 c4 a,4 g,2 \bar "|"
  e4 a,4 d4 g,8 g,8 c4 g,4 d2 d2 \bar "|."
}
words = \lyricmode { Und auf Er -- den Fried und den Men -- schen ein Wohl -- ge -- fal -- len. }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout { indent = 0\mm \context { \Score \autoBeamOff \remove "Bar_number_engraver" } \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Staff \omit TimeSignature } } }
