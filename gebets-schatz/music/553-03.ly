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
        \clef treble \key ef \major \time 4/4
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "4"
        ef'2 g'4 af'4 | bf'2. c''4 |
        f'4 g'4 af'4 g'4 | f'2 f'2^\fermata |
        bf'2 bf'4 bf'4 | c''2. bf'4 |
        af'4 g'4 f'2^\fermata | f'2 g'4 a'!4 |
        bf'4 bf'4 a'!4 bf'4 | ef''4 d''4 c''2 |
        bf'2^\fermata r2 | bf'2 ef''4 ef''4 |
        bf'4 df''4 c''2\fermata | bf'2 af'4 g'4 |
        f'4 ef'4 f'2^\fermata | f'2 f'4 g'4 |
        af'4 bf'4 g'2^\fermata | bf'2 c''4 bf'4 |
        af'4 g'4 f'2 | f'2^\fermata r2 |
        ef'2 g'4 af'4 | bf'2 c''2 | g'2 f'2 |
        ef'1^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Ich laß dich nicht! du mußt mein JE -- sus blei -- ben.
      Will rau -- he Noth, Welt, Höll’ und Tod mich aus dem Feld’ er -- hitz -- ter
      Treu -- e trei -- ben? Nur her! ich hal -- te mich, mein star -- ker Held, an dich.
      Hör’, was mein Her -- ze spricht: Du mußt mein JE -- sus blei -- ben,
      ich laß dich nicht! ich laß dich nicht!
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
