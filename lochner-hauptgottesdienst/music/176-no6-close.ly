\version "2.24.3"
% Scan 176, Collecte no. 6, continuation and close.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \key f \major \cadenzaOn \omit Stem \slurUp
  a'2 a'2 a'2 g'2 a'2 \bar "|" a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'\breve a'2 a'2 a'2 \bar "" \break
  a'2 a'2 a'2 f'2 f'2 g'2 a'2 a'2 \bar "|" a'2 a'2 a'2 a'2 a'2 a'2 a'2 a'2 \bar "" \break
  g'2 a'2 a'2 a'2 f'2 f'2 g'2 a'2 a'\breve \bar "|" a'2 a'2 a'2 a'2 a'2 bes'2 a'2 \bar "" \break
  g'\breve f'\breve \bar "|" a'2 a'\breve a'\breve g'\breve f'\breve f'2 g'2 a'\breve g'2 a'2 g'\breve f'\breve \bar "|." 
 }
 }
 \new Lyrics \lyricsto "chant" { dig -- lich er -- hal -- ten, und durch dei -- nen Hei -- li -- gen Geist un -- se -- re \break Her -- zen so lei -- ten und füh -- ren, daß wir nim -- mer -- mehr da -- von ab -- \break wei -- chen, son -- dern fest dar -- an hal -- ten und end -- lich da -- durch se -- lig \break wer -- den, durch JE -- sum Chri -- stum, dei -- nen Sohn, un -- sern HEr -- ren. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
