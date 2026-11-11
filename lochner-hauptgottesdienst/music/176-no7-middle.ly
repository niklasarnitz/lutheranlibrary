\version "2.24.3"
% Scan 176, Collecte no. 7, middle phrase through "leben".
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 e'2 g'2 g'2 g'2 \bar "|" g'2 g'2 g'2 g'2 g'2 \break
  g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 e'2( fis'2) g'\breve \bar "|" }
 }
 \new Lyrics \lyricsto "chant" { se -- re Her -- zen an dei -- nen Ge -- bo -- ten han -- gen, und wir un -- se -- re \break Zeit durch dei -- nen Schutz still und si -- cher vor Fein -- den le __ ben, }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
