\version "2.24.3"
% Scan 175, Collecte no. 6, opening; continues scan 176.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \key f \major \cadenzaOn \omit Stem \slurUp
  f'2 g'2 a'2( g'2) a'\breve \bar "||" a'2 a'2 g'2 a'2 \bar "|" a'2 a'2 a'2 f'2 g'2 a'2 a'\breve \bar "|" a'2 a'2 \bar "" \break
  a'2 a'2 g'2 a'2 a'2 a'2 a'2 a'2 a'2 f'2 g'2 a'2 a'\breve \bar "|" a'2 a'2 g'2 a'2 \bar "" \break
  a'2 a'2 a'2 bes'2 \shortBar a'2 g'\breve a'2 g'\breve f'\breve \bar "|" a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'2 \bar "" \break
  a'2 f'2 g'2 a'\breve \bar "|" a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'2
 }
 }
 \new Lyrics \lyricsto "chant" { Laßt uns be __ ten! Wir dan -- ken dir, HErr Gott, himm -- li -- scher Va -- ter, daß du \break uns dein hei -- li -- ges E -- van -- ge -- li -- um ge -- ge -- ben, und dein vä -- "ter-" \break li -- ches Herz hast er -- ken -- nen las -- sen: Wir bit -- ten dei -- ne grund -- lo -- se \break Barm -- her -- zig -- keit, du wol -- lest solch se -- lig Licht dei -- nes Worts uns "gnä-" }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
