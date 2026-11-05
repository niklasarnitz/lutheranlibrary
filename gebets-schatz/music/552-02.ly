\version "2.24.3"
\language "english"

% Scan 552: Christe, wahres Seelenlicht. Both printed repeat underlays retained.
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
    \clef treble \key c \major \time 4/4
    \override Staff.TimeSignature.stencil = #ly:text-interface::print
    \override Staff.TimeSignature.text = \markup \number "4"
    \new Voice = "melody" {
      c'4 e'4 g'4 g'4 | a'4 b'4 c''2\fermata |
      b'4 c''4 d''4 e''4 | d''2 c''2\fermata \bar ":|."
      b'4 c''4 d''4 c''4 | b'4 b'4 a'2\fermata |
      g'4 g'4 f'4 e'4 | d'2 c'2\fermata |
      g'4 g'4 a'4 b'4 | a'4 a'4 g'2\fermata |
      a'4 b'4 c''4 e''4 | d''2 c''2\fermata \bar "|."
    }
  }
  \new Lyrics \lyricsto "melody" {
    Chri -- "ste!" wah -- res See -- len -- licht, dei -- ner Chri -- sten Son -- ne,
    Dei -- ner Gü -- te Lieb -- lich -- keit ist neu al -- le Mor -- gen;
    in dir bin ich recht er -- freut, darf für gar nichts sor -- gen.
  }
  \new Lyrics \lyricsto "melody" {
    o du kla -- res An -- ge -- sicht, der Be -- trüb -- ten Won -- "ne!"
  }
  >>
  \layout {
    ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
