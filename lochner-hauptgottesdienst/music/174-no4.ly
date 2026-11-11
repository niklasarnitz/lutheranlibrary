\version "2.24.3"
% Scan 174, German Collecte no. 4, Hommel 1851.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
  g'2 g'2 fis'2( g'2) e'\breve \bar "||" g'2 g'\breve g'2 g'2 g'\breve^\markup \tiny \italic "Komma." \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 \break
  g'2 g'2 g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 fis'2^\markup \tiny \italic "Acutus." e'2 g'2 g'\breve^\markup \tiny \italic "Doppel- oder Strichpunkt." \bar "|" g'2 g'2 g'\breve g'2 g'2 \break
  g'2 g'2 g'2 g'2 g'2 g'2 g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 fis'2^\markup \tiny \italic "Med."( g'2) g'\breve \bar "|" g'2 g'2 g'2 \break
  g'2 g'2 g'2 g'2 g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 \break
  g'2 g'2 g'\breve \bar "|" g'2^\markup \tiny \italic "Acutus." g'2 fis'2 e'2 g'2 g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 fis'2( g'2) g'2 g'\breve \bar "|." }
 }
 \new Lyrics \lyricsto "chant" { Laßt uns be __ ten! O HErr, wir bit -- ten, gib uns all -- zeit gnä -- dig -- lich \break ei -- nen Geist, zu ge -- den -- ken und zu thun, was recht ist: auf daß wir, die wir \break oh -- ne dich nicht sein kön -- nen, nach dir auch le -- ben mö __ gen, durch JE -- sum \break Chri -- stum, un -- sern HErrn, der mit dir in ver -- ei -- nig -- ter Gott -- heit des Hei -- li -- \break gen Gei -- stes le -- bet und re -- gie -- ret von E -- wig -- keit zu E __ wig -- keit. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
