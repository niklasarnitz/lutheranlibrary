\version "2.24.3"
\language "english"

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
        \clef treble \key ef \major \time 3/2
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "3"
        \cadenzaOn \slurUp
        \accidentalStyle forget
        bf'2 bf'2 af'2 \bar "|"
        g'2. f'4 ef'2^\fermata \bar "|"
        bf'2 c''2 d''2 \bar "|"
        ef''2 ef''2^\fermata \bar "|"
        bf'2 bf'2 c''2 \bar "|"
        bf'2. af'4 g'2\fermata \bar "|"
        f'2 g'2 bf'2 \bar "|"
        a'!2 bf'2\fermata \bar "|"
        f'2 f'2 g'2 \bar "|"
        f'2. ef'4 d'2^\fermata \bar "|"
        f'2 g'2 bf'2 \bar "|"
        a'!2 g'2^\fermata \bar "|"
        c''2 a'!2 bf'2 \bar "|"
        g'2. a'!4 bf'2\fermata \bar "|"
        ef'2 f'2 g'2 \bar "|"
        f'2 ef'2^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Wer JE -- sum bei sich hat, kann fe -- ste ste -- hen, wird auf dem
      Un -- glücks -- meer nicht un -- ter -- ge -- hen. Wer JE -- sum bei sich hat,
      was kann dem scha -- den? sein Herz ist ü -- ber -- all mit Trost be -- la -- den.
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
