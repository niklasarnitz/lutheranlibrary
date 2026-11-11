\version "2.24.3"
\pointAndClickOff
% Lochner Gloria, scan 152 / source p.127, through "Vaters."; Amen pending.
#(set-global-staff-size 14)
\header { tagline = ##f }
\paper { paper-width = 120\mm paper-height = 500\mm page-breaking = #ly:one-page-breaking top-margin = 4\mm bottom-margin = 4\mm left-margin = 5\mm right-margin = 5\mm ragged-right = ##f }
global = { \cadenzaOn }
soprano = \fixed c' { \global d'2 a4 g4 g4 g2 \bar "|" a4 g4 f4 e4 e2 \bar "|" r4 g4 a4 b4 b4 c'4 a2 g2 \bar "|" \break r4 a4 b4 b4 c'4 a4 g2 \bar "|" r4 a4 b4 b4 c'4 c'4 d'2 b4 c'4 a2 g2 \bar "|" \break a4 b4 c'4 b4 d'2 \bar "|" a4 a4 d'4 cis'4 d'2 g4 g4 b2 g2 \bar "|" }
alto = \fixed c' { \global g2 f!4 eis4 eis4 eis2 f4 e!4 d4 c4 b,2 r4 e4 e4 g4 g4 g4 f2 e2 r4 e4 g4 g4 g4 fis4 d2 r4 d4 d4 e4 e4 e4 fis2 g4 f2 fis4 e2 f!4 f4 e4 d4 e2 c4 e4 f4 e4 fis2 d4 g2 e!4 d2 }
tenor = \fixed c { \global e'2 d'4 b4 c'4 c'2 c'4 c'4 a4 a4 gis2 r4 b4 c'4 d'4 e'4 e'4 c'2 c'2 r4 c'4 d'4 e'4 e'4 d'4 a2 r4 fis4 g4 g4 g4 a4 a2 g4 e'4 d'2 b2 c'4 d'4 g4 g4 g2 f4 a4 a4 a4 a2 b4 b4 d'2 b2 }
bass = \fixed c { \global c2 d4 e4 a,4 a,2 f4 c4 e4 g,4 e2 r4 e4 a4 g4 e4 c4 f2 c2 r4 a4 g4 e4 c4 d4 g,2 r4 dis4 g4 e4 c4 a,4 \once \override Accidental.stencil = ##f d2 e4 c4 f2 g,2 f4 d4 b,4 g,4 b,2 f4 f8[ e8] d4 a,4 d2 b,4 e4 d2 g,2 }
words = \lyricmode { Rech -- ten des Va -- ters, er -- barm dich un -- ser! Denn du al -- lein bist hei -- lig, du bist al -- lein der HErr, du bist al -- lein der Höchst, JE -- su Chri -- ste, mit dem Heil -- gen Geist in der Herr -- lich -- keit dei -- nes Va -- ters. }
\score { \new PianoStaff <<
  \new Staff = "upper" << \clef treble \new Voice = "soprano" { \voiceOne \soprano } \new Voice = "alto" { \voiceTwo \alto } >>
  \new Lyrics \lyricsto "soprano" { \words }
  \new Staff = "lower" << \clef bass \new Voice = "tenor" { \voiceOne \tenor } \new Voice = "bass" { \voiceTwo \bass } >>
>> \layout { indent = 0\mm \context { \Score \autoBeamOff } \context { \Staff \omit TimeSignature } } }
