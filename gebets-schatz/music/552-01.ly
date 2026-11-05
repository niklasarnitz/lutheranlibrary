\version "2.24.3"
\language "english"

% Scan 552: Auf, ihr Heiden, lobet Gott. Both printed repeat underlays retained.
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  top-margin = 0\mm bottom-margin = 0\mm
  left-margin = 2\mm right-margin = 2\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 18)

\score {
  <<
  \new Staff {
    \clef treble \key g \major \time 4/4
    \override Staff.TimeSignature.stencil = #ly:text-interface::print
    \override Staff.TimeSignature.text = \markup \number "4"
    \new Voice = "melody" {
      d''4 g'4 fs'4 g'4 | c''4 b'4 a'2\fermata |
      a'4 a'4 b'4 cs''4 | d''4 e''4 cs''2 | d''1\fermata \bar ":|."
      a'4 a'4 b'4 b'4 | a'4. g'8 fs'2\fermata |
      a'4 a'4 b'4 cs''4 | d''4 d''4 cs''2\fermata |
      d''4 d''4 a'4 b'4 | a'4 g'4 fs'4 fs'4\fermata |
      g'4 g'4 a'4 b'4 | c''4 b'4 a'2 | g'1\fermata \bar "|."
    }
  }
  \new Lyrics \lyricsto "melody" {
    Auf ihr Hei -- den, lo -- bet Gott, der euch aus des To -- des Schat -- ten,
    zu dem wah -- ren Licht ge -- bracht, und euch Ar -- me nicht ver -- "acht’t!"
    Lo -- bet sol -- che gro -- ße Gü -- te stets mit dank -- ba -- rem Ge -- mü -- the.
  }
  \new Lyrics \lyricsto "melody" {
    so euch in der Fin -- ster -- niß vor -- mals ganz um -- ge -- ben hat -- ten,
  }
  >>
  \layout {
    ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
