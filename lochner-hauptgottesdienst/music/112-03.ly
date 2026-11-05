\version "2.24.3"
% Scan 112, printed p. 87: third tone, Beide Chöre, complete.
#(set-global-staff-size 18)
\header { piece = "Beide Chöre." tagline = ##f }
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
      \key g \major \cadenzaOn
      \new Voice = "choir" {
        \voiceOne \slurUp
        d'1 e'1 g'1 \bar "|" g'1 \bar "|" \break
        a'1 g'1 fis'1( e'1) g'1 \bar "||" \break
        g'1 \bar "|" e'1 e'1 g'1 fis'1
        \once \override NoteColumn.force-hshift = #-0.6 e'1 \bar "|."
      }
      \new Voice {
        \voiceTwo b1 c'1 b1 b1
        d'1 e'1 d'1 c'1 b1
        b1 c'1 c'1 e'1 dis'1
        \once \override NoteColumn.force-hshift = #0.6 e'1
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      Eh -- re "sei :" "dem Vater :"
      und dem Soh -- \skip 1 "ne :"
      "und dem" Hei -- li -- gen Gei -- "ste,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 }
      \markup \center-column { "wie es war" "im Anfang :" }
      jetzt und im -- mer -- "dar :"
      \markup \center-column { "u. von Ewig-" "keit zu" }
      E -- wig -- "keit." A -- "men."
    }
    \new PianoStaff <<
      \new Staff {
        \key g \major \cadenzaOn \slurUp
        <b d'>1 <c' e'>1 <d' g'>1 \bar "|" <d' g'>1 \bar "|"
        <d' a'>1 <e' g'>1 <d' fis'>1( <c' e'>1) <d' g'>1 \bar "||"
        <d' g'>1 \bar "|" <c' e'>1 <c' e'>1 <e' g'>1 <dis' fis'>1 <b e'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key g \major \cadenzaOn
        \new Voice {
          \voiceOne g1 g1 b1 b1 a1 b1 b1 g1 b1
          b1 g1 a1 b1 b1 g1
        }
        \new Voice {
          \voiceTwo \slurDown g,1 c1 g,1 g1 fis1 e1 b,1( c1) g,1
          g1 c1 a,1 e,1 b,1 e1
        }
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
