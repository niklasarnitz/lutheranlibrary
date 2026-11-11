\version "2.24.3"
% Scan 172, German Collecte no. 1, opening only; prayer continues on scan 173.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem
   g'2 g'2 g'2 g'2 \bar "||" e'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 e'2 \break
   g'2 g'2 g'2 g'2 g'2 \bar "|" e'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 \break
   e'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'\breve \bar "|" e'2 g'2 g'2 g'2 g'2 \break
   g'2 g'2 g'2 g'2 g'2 g'2 \bar "|" e'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'\breve g'2
 } }
 \new Lyrics \lyricsto "chant" { Laßt uns be -- ten! O Gott, von dem al -- le gu -- te Ga -- be kommt, hilf \break uns, wir bit -- ten dich, daß wir durch dei -- nen Geist be -- den -- ken dei -- nen Wil -- len, \break und lei -- te uns nach dei -- nem Wohl -- ge -- fal -- len, durch JE -- sum Chri -- stum, \break dei -- nen Sohn, un -- sern HErrn, der mit dir le -- bet und re -- gie -- ret in }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
