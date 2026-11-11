\version "2.24.3"
% Scan 157, printed p. 132: second harmonized congregational response in D.
#(set-global-staff-size 18)
\header { piece = "Gem." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new PianoStaff <<
    \new Staff <<
      \clef treble \key d \major \cadenzaOn
      \new Voice = "choir" { \voiceOne a'2 a'2 fis'2 gis'2 a'1 a'1 \bar "|." }
      \new Voice { \voiceTwo fis'2 e'2 d'2 e'2 e'2( fis'2) e'1 }
    >>
    \new Lyrics \lyricsto "choir" { Und mit "dei :" -- nem "Gei : :" ste. }
    \new Staff <<
      \clef bass \key d \major \cadenzaOn
      \new Voice { \voiceOne d'2 cis'2 b2 b2 cis'2( d'2) cis'1 }
      \new Voice { \voiceTwo d2 a,2 b,2 e2 a,1 a,1 }
    >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
