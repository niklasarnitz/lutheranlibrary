\version "2.24.3"
\pointAndClickOff
% Lochner Gloria, scan 151 / source p.126, checked through "Gebet!".
% The source-page tail is engraved separately as 151-02.ly.
#(set-global-staff-size 14)
\header { tagline = ##f }
\paper { paper-width = 135\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 4\mm right-margin = 2\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
global = { \cadenzaOn \accidentalStyle forget }
soprano = \fixed c' { \global d'2 c'4 b4 a4 g4 a2 \bar "|" g4 f4 bes2 g4 \bar "|" g4 a4 a4 d'2 a2 \bar "|" \break r4 a4 b4 b4 d'2 b4 b4 a2 \bar "|" g4 a4 b4 c'4 c'2 \bar "|" g4 a4 b4 c'4 c'2 \bar "|" \break a2 d'4 cis'4 d'4 b4 c'!4 b4 a2 \bar "|" g2 b4 c'4 g2 f2 \bar "|" a2 d'4 c'!4 s8 \break d'4 g4 a!4 g4 f2 \bar "|" c'4 c'2 b4 a4 a4 g2 \bar "|" }
alto = \fixed c' { \global g2 g4 g4 f!4 e4 f2 \bar "|" d4 c4 f2 e4 \bar "|" e4 f4 f4 f4( g4) e2 r4 fis4 g!4 g4 fis!2 d4 g4 fis!2 e4 f!4 f4 e4 e2 \bar "|" c4 c4 d4 e4 e2 c2 f4 e4 f4 e4 e4 e4 c2 c2 d4 e4 c2 c2 c2 f4 e4 s8 \break f4 e4 e4 e4 c2 f4 e2 d4 d4 d4 b,2 }
tenor = \fixed c { \global b2 e'4 e'4 c'4 c'4 c'2 \bar "|" c'4 a4 d'2 c'4 \bar "|" c'4 c'4 d'4 d'2 cis'2 r4 d'4 d'4 g4 a2 g4 b4 d'2 b4 d'4 f4 g4 g2 \bar "|" e4 e4 g4 g4 g2 f2 a4 a4 a4 gis4 a4. gis!8 a2 e2 g4 g4 f2 e2 f2 a4 a4. \break a4 gis4 a4. gis!8 a2 a4 g!2 g4 g4 fis4 g2 }
bass = \fixed c { \global g2 c4 e4 f!4 c4 f2 \bar "|" c4 d4 as,2 e4 \bar "|" c4 f4 d4 bes,2 a,2 r4 d4 f4 e4 d2 g,4 g,4 d2 e4 d4 d4 c4 c2 \bar "|" c4 g,4 g,4 c4 c2 f2 d4 g,4 d4 e4 g,4 e4 a,2 c2 g,4 c4 f,2 c2 d2 d4 g,4 s8 \break d4 e4 g,4 e4 g,2 e4 c2 g,4 d4 d4 g,2 }
words = \lyricmode { HErr, ein -- ge -- bor -- ner Sohn, JE -- su Chri -- ste, du Al -- ler -- höch -- ster, und dir, du Hei -- li -- ger Geist! HErr Gott, Lamm Got -- tes, ein Sohn des Va -- ters, der du hin -- nimmst die Sünd der Welt, er -- barm dich un -- ser! der du hin -- nimmst die Sünd der Welt, nimm auf un -- ser Ge -- bet! }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout { indent = 0\mm \context { \Score \autoBeamOff } \context { \Staff \omit TimeSignature } } }
