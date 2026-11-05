\version "2.24.3"
\language "english"

% The parenthetical alternate title is a heading, not a second sung text.
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
    \new Staff <<
      \new Voice = "melody" {
        \clef treble \key c \major \time 3/2
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "3"
        \cadenzaOn
        \accidentalStyle forget
        a'4 b'4 c''2 c''2 \bar "|"
        d''4 c''4 b'2 b'2\fermata \bar "|"
        c''4 b'4 a'2 b'2 \bar "|"
        a'4 gs'4 a'2^\fermata \bar ":|."
        c''4 d''4 e''2 e''2 \bar "|"
        f''4 e''4 d''2 d''2\fermata \bar "|"
        e''4 d''4 c''2 c''2 \bar "|"
        d''4 c''4 b'2\fermata \bar "|"
        a'4 gs'4 a'2 c''2 \bar "|"
        b'4 a'4 b'2 b'2\fermata \bar "|"
        c''4 b'4 a'2 b'2 \bar "|"
        a'4 gs'4 a'2^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Wo ist JE -- sus, mein Ver -- lan -- gen, mein Ge -- lieb -- ter und mein Freund?
      Mei -- ne Seel’ ist sehr be -- trü -- bet, mit viel Sün -- den ab -- ge -- matt’t;
      wo ist JE -- sus, den sie lie -- bet? den be -- gehrt sie Tag und Nacht.
    }
    \new Lyrics \lyricsto "melody" {
      Wo ist er denn hin -- ge -- gan -- gen? Wo mag er zu fin -- den sein?
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
