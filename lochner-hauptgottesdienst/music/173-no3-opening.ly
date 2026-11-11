\version "2.24.3"
% Scan 173, Collecte no. 3, opening; continues on scan 174.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
   g'2 g'2 g'2 g'\breve \bar "||" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 \break
   g'2 g'2 g'2 \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 fis'2^\markup \tiny \italic "Acutus." e'2 g'2 g'\breve \bar "|" g'2 g'2 g'2 \break
   g'2 g'2 g'2 fis'2^\markup \tiny \italic "Med." \bar "|" g'2 g'2 g'2 g'2 g'2 \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2
 } }
 \new Lyrics \lyricsto "chant" { Laßt uns be -- ten! All -- mäch -- ti -- ger, e -- wi -- ger Gott, der du durch dei -- nen Hei -- \break li -- gen Geist die gan -- ze Chri -- sten -- heit hei -- li -- gest und re -- gie -- rest: er -- hö -- re \break uns -- re Bit -- te, und gib gnä -- dig -- lich, daß sie mit al -- len ih -- ren Glie -- dern }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
