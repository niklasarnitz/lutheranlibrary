\version "2.24.3"
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 120\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," \noBreak }
\score { <<
 \new Staff { \new Voice = "chant" { \clef treble \cadenzaOn \omit Stem \slurUp
 g'2^\markup \tiny \italic "Oder:" g'2 g'2 g'2 g'\breve g'\breve \bar "" \break
 g'\breve g'\breve g'2 g'2 g'\breve \bar "|" g'2 g'2 g'2 \shortBar g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'\breve \bar "" \break
 g'2 g'2 g'2 g'2 g'2 fis'2^\markup \tiny \italic "Acutus." e'2 g'\breve \bar "|" g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'2 g'\breve \bar "|."
 } }
 \new Lyrics \lyricsto "chant" { durch un -- sern HErrn JE -- sum Chri -- stum, dei -- nen Sohn, der mit dir in Ei -- nig -- keit des Hei -- li -- gen Gei -- stes \break le -- bet und herr -- schet, wah -- rer Gott von E -- wig -- keit zu E -- wig -- keit. }
>> \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } } }
