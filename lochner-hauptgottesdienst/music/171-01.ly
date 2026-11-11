\version "2.24.3"
% Lochner scan 171, Parallel Latin and German Collecte, printed pp. 145–146.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 115\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }

shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }

\score {
  <<
    \new Staff {
      \new Voice = "chant" {
        \clef bass \cadenzaOn
        f2 f2 f2 f2 \bar "||" f2 \shortBar f2 f4 f2 \shortBar f2 f2 \shortBar f2 f2 \shortBar f2 f2 \bar "" \break
        f4 f2 f2 f2 \bar "||" f2 \shortBar f2 f4 \shortBar f2 \shortBar f2 f2 \shortBar f2 f2 \bar "" \break
        f2 f4 f2 \shortBar f2 ^\markup \tiny "Halbpunkt." e2 \bar "|" f2 \shortBar f2 f2 \shortBar f2 f2 \shortBar f2 \shortBar f2 f2 \shortBar f2 \bar "" \break
        f2 f2 e2 \bar "|" f2 \bar "|" f4 f2 \shortBar f2 f2 \shortBar f2 \shortBar f4 f2 f2 \shortBar f2 \bar "" \break
        f2 f4 f2 f2 \shortBar f2 f4 f2 \shortBar e2 ^\markup \tiny "Hauptpunkt." c2 \shortBar f2 f2 \bar "|" f2 \shortBar f2 f4 f2 \bar "" \break
        f2 f4 f2 \shortBar f2 \shortBar f2 f4 f2 \shortBar f2 f2 \shortBar e2 c2 \shortBar f2 \bar "|" f2 \shortBar f2 f4 f2 \bar "" \break
        f2 f4 f2 \shortBar f2 f2 f2 f2 \bar "||" f2 f2 \bar "|." \break
        f4 \shortBar f2 f2 f2 \bar "||" f2 f2 \bar "|."
      }
    }
    \new Lyrics \lyricsto "chant" {
      ex -- or -- di -- um. Per Do -- mi -- num no -- strum Je -- sum Chri -- stum
      ge -- nom -- men hat. Durch un -- sern HErrn JE -- sum Chri -- stum,
      fi -- li -- um tu -- um, qui te -- cum vi -- vit et re -- gnat in
      dei -- nen Sohn, der mit dir le -- bet und re -- gie -- ret in
      u -- ni -- ta -- te Spi -- ri -- tus san -- cti De -- us per om -- ni -- a
      Ei -- nig -- keit des Hei -- li -- gen Gei -- stes, wah -- rer Gott von E -- wig -- keit
      sae -- cu -- la sae -- cu -- lo -- rum. A -- men.
      zu E -- wig -- keit. A -- men.
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
