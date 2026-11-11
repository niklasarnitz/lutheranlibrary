\version "2.24.3"
% Scan 176, Collecte no. 7, through "... geben, auf daß un-".
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2 g'2 fis'2( g'2) g'2 \bar "||" g'2 g'2 g'2 g'2 g'2 e'2( g'2) g'\breve \bar "|" g'2 g'2 e'2 \break
  g'2 g'2 g'2 \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 e'2( fis'2) g'\breve \bar "|" g'2 g'2 g'2 \break
  g'2 g'2 e'2( g'2) g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 e'2( fis'2) g'\breve \bar "|" g'2 g'2 g'2 }
 }
 \new Lyrics \lyricsto "chant" { Laßt uns be __ ten! HErr Gott, himm -- li -- scher Va __ ter, der du hei -- \break li -- gen Muth, gu -- ten Rath und rech -- te Wer -- ke schaf __ fest: gib dei -- nen \break Die -- nern Frie __ de, wel -- chen die Welt nicht kann ge __ ben, auf daß "un-" }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
