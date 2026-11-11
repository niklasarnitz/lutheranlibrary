\version "2.24.3"
% Scan 202, printed p. 177. Nicene Creed intonation, Pastor.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 112\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \key d \major \cadenzaOn \slurUp
    a'\breve g'1( fis'1) fis'\breve
    fis'1( g'1 a'\breve) a'1( g'1 fis'1 e'1 fis'\breve)
    g'1( fis'1) e'1( d'1 e'\breve) \bar "|."
  }
  \addlyrics {
    \set ignoreMelismata = ##t
    Ich glau \skip 1 be an \skip 1 \skip 1 Ei \skip 1 \skip 1 \skip 1 \skip 1
    nen \skip 1 Gott. \skip 1 \skip 1
  }
  \layout {
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
