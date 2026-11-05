\version "2.24.3"
% Scan 112, printed p. 87: third tone, I. Chor, complete.
#(set-global-staff-size 18)
\header { piece = "I. Chor." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 4\mm
  right-margin = 0\mm
  top-margin = 0\mm
  bottom-margin = 0\mm
  indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new Staff <<
      \new Voice = "choir" {
        \key g \major \cadenzaOn \slurUp
        <b d'>1 <c' e'>1 <b g'>1 \bar "|" \break
        <b g'>1 <b g'>1 \bar "|" \break
        <d' a'>1 <e' g'>1 <d' fis'>1^.( <c' e'>1^.) <b g'>1 \bar "|."
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "1."
      Sei mir ein star -- ker Fels und ei -- ne "Burg,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 } \set stanza = "2."
      "Denn du" "bist mein" Fels und mei -- ne "Burg,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 } \set stanza = "3."
      \markup \center-column { "HErr : auf dich traue ich :" "laß mich nimmermehr zu" }
      \skip 1 Schan -- den wer -- \skip 1 "den."
    }
    \new PianoStaff <<
      \new Staff {
        \key g \major \cadenzaOn \slurUp
        <b d'>1 <c' e'>1 <d' g'>1 \bar "|"
        <d' g'>1 <d' g'>1 \bar "|"
        <d' a'>1 <e' g'>1 <d' fis'>1( <c' e'>1) <d' g'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key g \major \cadenzaOn
        \new Voice { \voiceOne g1 g1 b1 b1 b1 a1 b1 b1 g1 b1 }
        \new Voice { \voiceTwo \slurDown g,1 c1 g,1 g1 g1 fis1 e1 b,1( c1) g,1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-1 }
  }
}
