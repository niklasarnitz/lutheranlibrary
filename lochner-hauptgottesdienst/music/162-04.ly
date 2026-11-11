\version "2.24.3"
% Scan 162, printed p. 137: Dein guter Geist, with the printed alternate incipit.
#(set-global-staff-size 16)
\header { piece = "G." tagline = ##f }
\paper {
  paper-width = 115\mm
  left-margin = 3\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \cadenzaOn
      \new Voice = "choir" { \voiceOne e'2( g'2) g'4 g'4 g'2 \bar "|" g'4 g'4 g'4 g'4 g'2 e'2 g'1 \bar "||"
        g'2^\markup \tiny "Oder:" g'4 g'4 \bar "" }
      \new Voice { \voiceTwo c'2( e'2) e'4 e'4 e'2 e'4 e'4 e'4 e'4 e'2 c'2 d'1 e'2 e'4 e'4 }
    >>
    \new Lyrics \lyricsto "choir" { Dein gu -- ter Geist füh -- re mich auf eb -- ner Bahn. Dein gu -- "ter &c." }
    \new Staff <<
      \clef bass \cadenzaOn
      \new Voice { \voiceOne g2( c'2) c'4 c'4 c'2 c'4 c'4 c'4 c'4 c'2 g2 b1 c'2 c'4 c'4 }
      \new Voice { \voiceTwo c1 c4 c4 c2 c4 c4 c4 c4 c2 c2 g,1 c2 c4 c4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
