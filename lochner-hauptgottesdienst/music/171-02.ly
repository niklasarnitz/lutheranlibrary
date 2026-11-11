\version "2.24.3"
% Scan 171 lower edge: Herzog's example (Anfang, Accent, Komma oder Punkt, Kadenz).
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 115\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 \new Staff { \clef treble \key d \major \cadenzaOn \accidentalStyle forget \slurUp \omit Stem
  a'2^\markup \tiny "Anfang." a'2 fis'2 a'2 \bar "|"
  a'2^\markup \tiny "Accent." fis'\breve a'2 a'2 \bar "|"
  fis'2^\markup \tiny "Komma" a'2 \bar "|"
  fis'2^\markup \tiny "oder" ( a'2) a'2 \bar "|"
  a'2^\markup \tiny "Punkt." fis'2( gis'2) a'2 \bar "|"
  a'2^\markup \tiny "Kadenz." b'2 a'2( g'2) fis'\breve \bar "|." }
 \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
