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
        \clef treble \key bf \major \time 4/4
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "4"
        g'4 g'4 f'4 g'4 | bf'4 a'4 g'2^\fermata |
        bf'4 c''4 c''4 bf'4 | c''4 c''4 d''2\fermata |
        d''4 c''4 d''4 bf'4 | c''4 bf'4 a'4 g'4^\fermata |
        g'4 f'4 g'4 bf'4 | c''4 g'4 fs'4 g'4^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Höch -- ster Prie -- ster, der du dich selbst ge -- op -- fert hast für mich,
      laß doch, bitt’ ich, noch auf Er -- den auch mein Herz dein Op -- fer wer -- den.
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
