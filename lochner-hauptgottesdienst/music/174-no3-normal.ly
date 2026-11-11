\version "2.24.3"
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'\breve \bar "|" g'2 g'\breve g'\breve g'\breve g'\breve \break
 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'\breve \bar "||"
 } }
 \new Lyrics \lyricsto "chant" { in rei -- nem Glau -- ben durch dei -- ne Gna -- de dir die -- ne, um JE -- su Chri -- sti, \break dei -- nes lie -- ben Soh -- nes, un -- se -- res HErrn, wil -- len. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
