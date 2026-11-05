\version "2.24.3"
% Scan 111, printed p. 86: first tone, Beide Chöre, complete.
% The blank accompaniment columns beneath "Va-ter" are printed blanks,
% represented by skips, not additional notes or rests.
#(set-global-staff-size 18)
\header { piece = "Beide Chöre." tagline = ##f }
\paper {
  paper-width = 100\mm
  paper-height = 300\mm
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
        <d' f'>1 <c' g'>1( <f' a'>1) <f' a'>1 \bar "|"
        <f' a'>1 <f' a'>1 <f' a'>1 \bar "|" \break
        <d' bes'>1 <f' a'>1 <e' g'>1 <f' a'>1 \bar "|" \break
        <f' a'>1 <f' a'>1 <c' g'>1 <c' g'>1
        <d' f'>1 <c' g'>1( <f' a'>1) <c' g'>1 \bar "|."
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      Eh -- re \skip 1 "sei :" dem Va -- "ter :" und dem Soh -- "ne,"
      und dem Hei -- li -- gen Gei -- \skip 1 "ste,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 4 { \skip 1 }
      \markup \center-column { "wie es war" "im Anfang :" }
      \skip 1 \skip 1 "jetzt u." im -- mer -- "dar,"
      \markup \center-column { "u. v. Ewig-" "keit zu" }
      \skip 1 E -- wig -- "keit." A -- \skip 1 "men."
    }
    \new PianoStaff <<
      \new Staff {
        \key f \major \cadenzaOn \slurUp
        <d' f'>1 <e' g'>1( <f' a'>1) <e' a'>1 \bar "|"
        <f' a'>1 s1 s1 \bar "|"
        <f' bes'>1 <f' a'>1 <e' g'>1 <f' a'>1 \bar "|"
        <f' a'>1 <f' a'>1 <e' g'>1 <e' g'>1
        <d' f'>1 <e' g'>1( <f' a'>1) <e' g'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key f \major \cadenzaOn
        \new Voice {
          \voiceOne a1 c'\breve c'1
          c'1 s1 s1
          d'1 c'1 bes1 c'1
          c'1 c'1 c'1 c'1 a1 c'\breve c'1
        }
        \new Voice {
          \voiceTwo \slurDown d1 c1( f1) f1
          f1 s1 s1
          bes,1 f1 g1 f1
          f1 f1 c1 c1 d1 c1( f1) c1
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
