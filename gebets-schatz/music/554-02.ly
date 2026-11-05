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
        \accidentalStyle forget
        g'2 e'4 fs'4 \bar "|"
        g'4 a'4 g'4 e'4 \bar "|"
        d'2^\fermata r4 d'4 \bar "|"
        g'4 a'4 b'4 g'4 \bar "|"
        a'2 g'2\fermata \bar ":|."
        r4 d''4 e''4 c''4 \bar "|"
        b'2^\fermata r4 a'4 \bar "|"
        b'4 cs''4 d''1\fermata \bar "|"
        r4 b'4 c''4 d''4 \bar "|"
        b'2^\fermata r4 a'4 \bar "|"
        g'4 fs'4 e'2^\fermata \bar "|"
        r4 a'4 a'4 fs'4 \bar "|"
        e'4 d'4 e'2^\fermata \bar "|"
        d'2 r4 a'4 \bar "|"
        fs'2 g'4 a'2 c''4 \bar "|"
        b'4 a'2 g'2\fermata d''4 \bar "|"
        c''2 b'4 a'2 g'4 \bar "|"
        c''4( b'4) a'2\fermata \bar "|"
        r4 b'4 a'4 d''4 \bar "|"
        b'4 a'4 g'2^\fermata \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Sie ist mir lieb, die wer -- the Magd, und kann ihr’r nicht ver -- ges -- sen.
      Ich bin ihr hold, und wenn ich sollt’ groß Un -- glück han, da liegt nicht an,
      sie will mich deß er -- göt -- zen mit ih -- rer Lieb’ und Treu’ an mir,
      die sie zu mir will setz -- en und thun all’ mein’ Be -- gier.
    }
    \new Lyrics \lyricsto "melody" {
      Lob, Ehr’ und Zucht von ihr man sagt, sie hat mein Herz be -- ses -- sen.
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
