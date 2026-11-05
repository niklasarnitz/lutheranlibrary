\version "2.24.3"
% Scan 111, printed p. 86: first tone, I. Chor, complete.
#(set-global-staff-size 18)
\header { piece = "I. Chor." tagline = ##f }
\paper {
  paper-width = 100\mm
  paper-height = 250\mm
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
        \key f \major \cadenzaOn \slurUp
        <d' f'>1^\markup \small "Intonation."
        <c' g'>1( <f' a'>1) <f' a'>1 \bar "|" \break
        <f' a'>1^\markup \small "Dominante." \bar "|"
        <d' bes'>1^\markup \small "Mediante."
        <f' a'>1 <e' g'>1^.( <f' a'>1^.) \bar "|."
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \set stanza = "1."
      Nach "dir," \skip 1 "HErr," ver -- lan -- get "mich," \skip 1
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 4 { \skip 1 }
      \set stanza = "2."
      "Laß mich nicht zu" Schan -- den wer -- "den,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 4 { \skip 1 }
      \set stanza = "3."
      "Denn keiner" wird zu Schan -- "den,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 4 { \skip 1 }
      \set stanza = "4."
      "HErr, zeige mir" dei -- ne We -- "ge."
    }
    \new PianoStaff <<
      \new Staff {
        \key f \major \cadenzaOn \slurUp
        <d' f'>1 <e' g'>1( <f' a'>1) <f' a'>1 \bar "|"
        <f' a'>1 \bar "|"
        <f' bes'>1 <f' a'>1 <e' g'>1( <f' a'>1) \bar "|."
      }
      \new Staff <<
        \clef bass \key f \major \cadenzaOn
        \new Voice { \voiceOne a1 c'\breve c'1 c'1 d'1 c'1 bes1 c'1 }
        \new Voice { \voiceTwo \slurDown d1 c1( f1) f1 f1 bes,1 f1 g1( f1) }
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
