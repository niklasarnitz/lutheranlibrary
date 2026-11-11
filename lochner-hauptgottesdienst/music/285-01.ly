\version "2.24.3"
% Scan 285, printed p. 260, Pax Domini.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  <<
    \new Staff {
      \new Voice = "sung" {
        \clef treble \cadenzaOn \slurUp \omit Staff.TimeSignature
        f'1 f'1 f'1 g'1( a'1) a'1 a'1 g'1 a'1 g'1 f'1 \bar "|."
      }
    }
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t
      Der Fried des "HEr :" \skip 1 ren sei mit euch "al :" "len."
    }
  >>

  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
