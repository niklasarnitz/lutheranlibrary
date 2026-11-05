\version "2.24.3"
% Scan 111, printed p. 86: first tone, II. Chor, complete.
#(set-global-staff-size 18)
\header { piece = "II. Chor." tagline = ##f }
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
        <f' a'>1^\markup \small "Dominante." <f' a'>1 \bar "|"
        <e' g'>1^\markup \small "Termination oder Finale."
        <d' f'>1 <c' g'>1^.( <f' a'>1^.) <c' g'>1 \bar "|."
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \set stanza = "1."
      "Mein Gott :" ich hof -- fe auf \skip 1 "dich."
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \set stanza = "2."
      "Daß sich meine Feinde :" nicht freu -- en ü -- ber "mich."
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \set stanza = "3."
      "—" "—" der dein har -- \skip 1 "ret."
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \set stanza = "4."
      Und "lehre mich" dei -- ne Stei -- \skip 1 "ge."
    }
    \new PianoStaff <<
      \new Staff {
        \key f \major \cadenzaOn \slurUp
        <f' a'>1 <f' a'>1 \bar "|"
        <e' g'>1 <d' f'>1 <e' g'>1( <f' a'>1) <e' g'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key f \major \cadenzaOn
        \new Voice { \voiceOne c'1 c'1 c'1 a1 c'\breve c'1 }
        \new Voice { \voiceTwo \slurDown f1 f1 c1 d1 c1( f1) c1 }
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
