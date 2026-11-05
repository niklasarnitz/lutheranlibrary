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
        \clef treble \key g \major \time 4/4
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "4"
        \cadenzaOn \slurUp
        b'4 \bar "|"
        g'4 e''4 d''4 c''4 \bar "|"
        b'2\fermata r4 a'4 \bar "|"
        g'4 a'4 b'4 c''4 \bar "|"
        b'2 a'4^\fermata a'4 \bar "|"
        b'4 c''4 d''4 e''4 \bar "|"
        c''2 b'4^\fermata e''4 \bar "|"
        d''4 c''4 b'4 b'4 \bar "|"
        a'2^\fermata r4 fs'4 \bar "|"
        g'4 a'4 b'4 d''4 \bar "|"
        c''2 b'4^\fermata d''4 \bar "|"
        c''4 b'4 a'4 g'4 \bar "|"
        fs'4( g'4) a'4^\fermata g'4 \bar "|"
        e'4 c''4 b'4 a'4 \bar "|"
        g'2.^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Wird das nicht Freu -- de sein, nach gläu -- bi -- gem Ver -- trau -- en dort
      selbst den Hei -- land schau -- en in un -- serm Fleisch und Bein, mit sei -- nen
      hol -- den Blick -- en und Wor -- ten sich er -- quick -- en?
      Wird das nicht Freu -- de sein?
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
