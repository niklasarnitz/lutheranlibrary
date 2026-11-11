\version "2.24.3"
% Scan 293, printed p. 268: Dankcollecte, prayer opening.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }

\score {
  <<
    \new Staff {
      \new Voice = "sung" {
        \clef treble \cadenzaOn \omit Staff.TimeSignature \slurUp
        g'1 g'1 g'1 g'1 g'1 g'1 f'1 e'1( g'1) g'1 \bar "|"
    e'1 e'1 g'1 g'1 f'1 e'1
        g'1 g'1 \allowBreak g'1 g'1 g'1 \bar "|"
    f'1 f'1 f'1 f'1 f'1 f'1 e'1 g'1 \allowBreak g'1 g'1 g'1
      }
    }
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t
      Laßt uns dem HErrn "dan :" ken und "be :" \skip 1 ten! Wir "dan :" ken dir, "all :" "mäch :"
      "ti :" ger "HEr :" re Gott, daß du uns durch "die :" se "heil :" "sa :" me "Ga :" be
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
