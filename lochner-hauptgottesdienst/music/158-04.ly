\version "2.24.3"
% Scan 158, printed p. 133: Bayreuth Chorordnung 1755 response in D major.
#(set-global-staff-size 18)
\header { piece = "Bayreuth. Chorord. 1755." tagline = ##f }
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
      \new Voice = "choir" { \voiceOne fis'2 a'2 a'2 fis'2 a'1 a'1 \bar "|." }
      \new Voice { \voiceTwo d'2 fis'2 fis'2 d'2 e'1 e'1 }
    >>
    \new Lyrics \lyricsto "choir" { Und mit "dei :" -- nem "Gei :" ste. }
    \new Staff <<
      \clef bass \key d \major \cadenzaOn
      \new Voice { \voiceOne a2 d'2 d'2 a2 d'1 cis'1 }
      \new Voice { \voiceTwo d2 d2 d2 d2 a,1 a,1 }
    >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
  }
}
