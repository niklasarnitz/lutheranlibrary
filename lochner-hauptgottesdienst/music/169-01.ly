\version "2.24.3"
\language "english"

% Scan 169, printed p. 144: Latin formula for the festive Collecte tone.
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  top-margin = 0\mm bottom-margin = 0\mm
  left-margin = 0\mm right-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 18)

\score {
  \new Staff \with { \omit TimeSignature } {
    \clef treble
    \cadenzaOn
    \stemDown
    c''2 \bar "|" c''2 b'4 c''2 \bar "|"
    c''2 c''2 b'4 c''2 \bar "|"
    c''2 \bar "|" c''2 b'4 c''2 \bar "|"
    c''2 c''2 \bar "|" \break
    b'2 a'2 c''2 c''2 \bar "|"
    c''2 \bar "|" c''2 c''2 \bar "|"
    c''2 c''2 c''2 b'2 \bar "|"
    c''2 \bar "|" c''2 \bar "|" \break
    c''2 c''2 c''2 \bar "|"
    c''2 c''2 b'4 c''2 \bar "||"
  }
  \addlyrics {
    Sic in -- ci -- pit O -- ra -- ti -- o, sic ca -- ni -- tur Pun -- ctum
    prin -- ci -- pa -- le: sic au -- tem Se -- mi -- pun -- ctum; et sic
    fi -- ni -- tur o -- ra -- ti -- o.
  }
  \layout { ragged-right = ##t }
}
