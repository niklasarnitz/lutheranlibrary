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
        \clef treble \key bf \major \time 6/4
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "6"
        \cadenzaOn \slurUp
        \accidentalStyle forget
        d''2 d''4 d''4( c''4) bf'4 \bar "|"
        a'4( bf'4) g'4 fs'2.^\fermata \bar "|"
        g'4( a'4) bf'4 c''2 d''4 \bar "|"
        ef''2 ef''4 d''2.\fermata \bar "|"
        f''2 f''4 ef''!4( d''4) c''4 \bar "|"
        d''4( c''4) bf'4 a'2.^\fermata \bar "|"
        bf'4( c''4) d''4 g'4( a'4) bf'4 \bar "|"
        c''4( a'4.) g'8 g'2.^\fermata \bar "|"
        c''2 c''4 a'2 f'4 \bar "|"
        f'2 ef'4 f'2.^\fermata \bar "|"
        g'2 g'4 a'4( f'4) bf'4 \bar "|"
        c''2 c''4 d''2.\fermata \bar "|"
        ef''4( d''4) c''4 bf'4( a'4) g'4 \bar "|"
        g'2 fs'4 g'2.^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Treu -- er Wäch -- ter Is -- ra -- el, deß sich freu -- et mei -- ne Seel’,
      ach, du wei -- ßest al -- les Leid dei -- ner ar -- men Chri -- sten -- heit.
      O du Wäch -- ter, der du nicht schläfst noch schlum -- merst,
      zu uns richt’ dein hilf -- rei -- ches An -- ge -- sicht.
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
