\version "2.24.3"
% Scan 157, printed p. 132: D-major intonation and pastoral salutation.
% Unlike the later scan-158 version, Der and HErr are both on A4, and mit is G-sharp.
#(set-global-staff-size 18)
\header { piece = "Inton. — Pastor." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \key d \major \cadenzaOn
    <d' fis' a'>\breve\fermata \bar "||"
    a'1 a'\breve fis'1 gis' a'\breve \bar "|"
  }
  \addlyrics { \skip 1 Der HErr sei mit "euch!" }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
