\version "2.24.3"
\pointAndClickOff
% Scan 150, source p.125, complete "Gemeinde oder Chor" continuation.
% Source page 126 / scan 151 begins immediately after the final "Vater!" bar.
% The preceding "Gemeinde" response is in 150-02.ly.
\header { tagline = ##f }
#(set-global-staff-size 13)
\paper { paper-width = 120\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 3\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
global = { \cadenzaOn \accidentalStyle forget }
soprano = \fixed c' { \global
  g2 b4 c'4 d'2 \bar "|"
  r4 g4 g4 g4 b4 c'4 d'2 \bar "|"
  r4 g4 a4 a4 b2 a2 \bar "|" \break
  r4 g4 b4 c'4 d'2 \bar "|"
  r4 b4 d'4 d'4 b2 a2 \bar "|"
  r4 g4 d'4 c'4 b4 a4 g4 \break
  f4 e2 d2 \bar "|"
  d2 g4 g4 fis!4 g4 a2 g2 \bar "|"
  d2 g4 g4 fis!4 g4 a2 g2 \bar "|"
}
alto = \fixed c' { \global
  d2 g4 e4 g2 \bar "|"
  r4 d4 e4 fis!4 g4 e4 g2 \bar "|"
  r4 e4 e4 e4 g2 fis!2 \bar "|"
  r4 d4 g4 e4 g2 \bar "|"
  r4 d4 e4 e4 e2 c2 \bar "|"
  r4 c4 d4 e4 g4 f4 e4
  d2 cis!4 a,4 s4 \bar "|"
  b,2 b,4 e4 d4 d4 fis!2 d2 \bar "|"
  d2 e4 e4 d4 d4 fis!2 d2 \bar "|"
}
tenor = \fixed c { \global
  b2 d'4 c'4 b2 \bar "|"
  r4 b4 b4 d'4 d'4 c'4 b2 \bar "|"
  r4 d'4 e'4 e'4 d'2 d'2 \bar "|"
  r4 b4 d'4 c'4 b2 \bar "|"
  r4 g4 g4 a4 s4 gis!4 a2 \bar "|"
  r4 e4 g4 g4 g4 c'4 c'4
  a4 a2 fis!2 \bar "|"
  g2 g4 c'4 a4 b4 d'2 b2 \bar "|"
  b2 b4 c'4 a4 b4 d'2 b2 \bar "|"
}
bass = \fixed c { \global
  g,2 g4 a4 g2 \bar "|"
  r4 g4 e4 d4 g4 a4 g2 \bar "|"
  r4 g4 b,4 b,4 g2 d2 \bar "|"
  r4 g4 g4 a4 g2 \bar "|"
  r4 g,4 c4 a,4 e2 a,2 \bar "|"
  r4 c4 b,4 c4 e4 f4 c4
  d4 a,2 d2 \bar "|"
  d2 e4 c4 d4 g4 d2 g,2 \bar "|"
  g2 e4 c4 d4 g4 d2 g,2 \bar "|"
}
words = \lyricmode {
  Wir lo -- ben dich,
  wir be -- ne -- dei -- en dich,
  wir be -- ten dich an,
  wir prei -- sen dich,
  wir sa -- gen dir Dank
  um dei -- ner gro -- ßen Eh -- re wil -- len,
  HErr Gott, himm -- li -- scher Kö -- nig!
  Gott, all -- mäch -- ti -- ger Va -- ter!
}
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout { indent = 0\mm \context { \Score \autoBeamOff } \context { \Staff \omit TimeSignature } } }
