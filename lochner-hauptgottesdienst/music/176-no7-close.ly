\version "2.24.3"
% Scan 176, Collecte no. 7, normal close and alternative "Oder: unsern Herren".
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2 g'2 g'2 fis'2 g'\breve \bar "|" e'\breve fis'!\breve g'\breve \bar "|" fis'!2 g'2 a'2 g'\breve \bar "||" \break
  g'2^\markup \tiny \italic "Oder:" a'2 g'\breve e'\breve \bar "|." }
 }
 \new Lyrics \lyricsto "chant" { durch JE -- sum Chri -- stum, dei -- nen Sohn, un -- sern HEr -- ren. \break un -- sern HEr -- ren. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
