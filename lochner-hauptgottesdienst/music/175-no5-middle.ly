\version "2.24.3"
% Scan 175, Collecte no. 5, continuation through "gebess-".
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 f'2 e'2( g'2) g'\breve^\markup \tiny \italic "Komma." \bar "|" f'2 f'2 f'2 f'2 \break
  f'2 f'2 e'2^\markup \tiny \italic "Komma." g'2 g'2 g'2 g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 \break
  g'2 e'2^\markup \tiny \italic "Komma." g'2 g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 }
 }
 \new Lyrics \lyricsto "chant" { ner Ge -- mei -- ne dei -- nen Geist und gött -- li -- che Weis __ heit: daß dein Wort "un-" \break ter uns lau -- fe und wach -- se, mit al -- ler Freu -- dig -- keit, wie sich's ge -- büh -- ret, \break ge -- pre -- di -- get, und dei -- ne christ -- li -- che Ge -- mei -- ne da -- durch ge -- "bess-" }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
