\version "2.24.3"
\language "english"

% Scan 553: both printed underlays of the repeated opening are retained.
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
        \clef treble \key f \major \time 4/4
        \override Staff.TimeSignature.stencil = #ly:text-interface::print
        \override Staff.TimeSignature.text = \markup \number "4"
        \cadenzaOn \slurUp
        \accidentalStyle forget
        a'4 \bar "|"
        f'4 g'4 a'8[ g'8] f'4 \bar "|"
        e'4 f'8[ g'8] f'4( e'4) \bar "|"
        d'2^\fermata bf'4 a'4 \bar "|"
        d''4 c''4 a'4 g'4 \bar "|"
        f'2 e'4^\fermata \bar ":|."
        a'4 \bar "|"
        g'4 a'8[ f'8] g'4 a'4 \bar "|"
        c''4 a'8[ bf'8] a'4 g'4^\fermata \bar "|"
        r4 bf'4 a'4 cs''4 \bar "|"
        d''4 c''4 bf'4 f''4 \bar "|"
        e''8[ d''8] cs''4^\fermata r4 d''4 \bar "|"
        bf'4 g'4 f'4( e'4) \bar "|"
        d'2.^\fermata r4 \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      Gib dich zu -- frie _ -- den und sei _ stil -- le in dem
      Got -- te dei -- nes Le -- bens.
      Er ist dein _ Quell und dei -- ne _ Son -- ne,
      scheint täg -- lich hell zu dei -- ner Won _ -- ne.
      Gib dich zu -- frie -- den.
    }
    \new Lyrics \lyricsto "melody" {
      In ihm ruht al _ -- ler Freu _ -- den Fül -- le, ohn’ ihn
      mühst du dich ver -- ge -- bens.
    }
  >>
  \layout {
    ragged-right = ##f ragged-last = ##f
    \context { \Score \remove "Bar_number_engraver" }
  }
}
