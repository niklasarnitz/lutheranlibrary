\version "2.24.3"
% Scan 173, Collecte no. 1: normal close and alternative Medius close.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 e'2 g'2 g'2 g'2 g'2 g'2 g'2 g'\breve \bar "||" \break
  e'2^\markup \tiny \italic "Oder:" g'2 g'2 g'2 g'2 g'2^\markup \tiny \italic "Medius." e'2 f'\breve \bar "||" } }
 \new Lyrics \lyricsto "chant" { Ei -- nig -- keit des Hei -- li -- gen Gei -- stes von nun an bis in E -- wig -- keit. \break von nun an bis in E -- wig -- keit. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
