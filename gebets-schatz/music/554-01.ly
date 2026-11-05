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
        \clef treble \key f \major \time 6/4
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "6"
        \cadenzaOn \slurUp
        r4 f'4 \bar "|"
        f'2 f'4 f'2 d'4 \bar "|"
        c'1( g'4) g'2\fermata g'4 \bar "|"
        a'2 bf'2 g'4 g'4 \bar "|"
        f'2^\fermata r4 a'4 \bar "|"
        bf'2 bf'4 bf'2 a'4 \bar "|"
        g'2.\fermata g'2 g'4 \bar "|"
        a'2 c''4 c''4.( bf'8) a'4 \bar "|"
        g'2^\fermata r4 g'4 \bar "|"
        a'2 bf'2 g'4 g'4 \bar "|"
        f'2^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      O Chri -- ste, Mor -- gen -- ster -- ne, leucht’ uns mit hel -- lem
      Schein. Schein’ uns von’s Him -- mels Thro -- ne an die -- sem dunk -- len
      Ort mit dei -- nem rei -- nen Wort.
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
