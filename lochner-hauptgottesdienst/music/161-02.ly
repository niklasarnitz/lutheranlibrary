\version "2.24.3"
% Scan 161, printed p. 136: harmonized response to the one-member Versikel.
#(set-global-staff-size 18)
\header { piece = "G." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new PianoStaff <<
    \new Staff <<
      \clef treble \cadenzaOn
      \new Voice = "choir" {
        \voiceOne g'2 g'2 g'2. g'4 g'4 g'4 g'2 g'2 g'4 g'4 e'2 g'1 \bar "|."
      }
      \new Voice {
        \voiceTwo e'2 e'2 e'2. e'4 e'4 e'4 e'2 e'2 d'4 d'4 c'2 d'1
      }
    >>
    \new Lyrics \lyricsto "choir" {
      "Das :" "sel :" be ist "un :" sers "Her :" zens "Freu :" de und Trost.
    }
    \new Staff <<
      \clef bass \cadenzaOn
      \new Voice {
        \voiceOne c'2 c'2 c'2. c'4 c'4 c'4 c'2 c'2 a4 a4 g2 b1
      }
      \new Voice {
        \voiceTwo c2 c2 c2. c4 c4 c4 c2 c2 g,4 g,4 c2 g,1
      }
    >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
