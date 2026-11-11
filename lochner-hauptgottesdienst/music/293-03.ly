\version "2.24.3"
% Scan 293, printed p. 268: Dankcollecte, alternate versicle.
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
        e'1 g'1 g'1 g'1 g'1 g'1 g'1 f'1 \allowBreak e'1 g'1 \shortBar
    g'1 g'1 g'1 g'1 g'1 a'1 g'\breve e'\breve \allowBreak \bar "|."
      }
    }
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t
      So oft ihr von "die :" sem "Bro :" de "eß :" set, und von "die :" sem "Kel :" che "trin :" ket,
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
