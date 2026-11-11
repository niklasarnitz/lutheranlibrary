\version "2.24.3"
% Scan 174, Collecte no. 5, beginning; continues scan 175.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2^\markup \tiny \italic "Anfang." f'2 e'2( g'2) g'\breve \bar "||"
  g'2 g'\breve g'2 f'2 e'2^\markup \tiny \italic "Accent." g'2 g'2 \bar "|"
  f'2 e'2 g'2^\markup \tiny \italic "Komma." g'2 \bar "|" g'2 g'2 }
 }
 \new Lyrics \lyricsto "chant" { Laßt uns be __ ten! All -- mäch -- ti -- ger HEr -- re Gott, wir bit -- ten dich, gib "dei-" }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
