\version "2.24.3"
% Scan 175, Collecte no. 5, from "-sert" through the final cadence.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \accidentalStyle forget \omit Stem \slurUp
  f'2 e'2( g'2) g'\breve^\markup \tiny \italic "Komma." \bar "|" f'2 f'2 f'2 f'2 f'2 f'2 f'2 f'2 f'2^\markup \tiny \italic "Accent." g'2 g'2 g'2 g'\breve \break
  g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 e'2( fis'2^\markup \tiny \italic "Punkt.") g'\breve \break
  e'2 e'\breve e'\breve e'\breve e'\breve e'2 e'2 e'2 g'2^\markup \tiny \italic "Komma." g'2
  \bar "|" g'\breve^\markup \tiny \italic "Kadenz oder Schluß." a'2 g'\breve( f'\breve) e'\breve \bar "|." }
 }
 \new Lyrics \lyricsto "chant" { sert wer __ de: auf daß wir mit be -- stän -- di -- gem Glau -- ben dir die -- nen, \break und im Be -- kennt -- niß dei -- nes Na -- mens bis an un -- ser En -- de ver -- har __ ren, \break durch JE -- sum Chri -- stum, dei -- nen lie -- ben Sohn, un -- sern HEr __ ren. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
