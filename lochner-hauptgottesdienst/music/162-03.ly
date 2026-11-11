\version "2.24.3"
% Scan 162, printed p. 137: traditional one-member Versikel.
#(set-global-staff-size 18)
\header { piece = "P. — Traditionell." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \cadenzaOn
    g'\breve g'1 g' g'\breve g'1 e' g'\breve \bar "|" \break
    g'1 g' g' g' g' g' f' e'\breve g'\breve \bar "|."
  }
  \addlyrics {
    "Wei :" -- se "mir," "HErr," "dei :" -- nen "Weg," daß ich "wand :" -- le in "dei :" -- ner "Wahr :" -- heit.
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
