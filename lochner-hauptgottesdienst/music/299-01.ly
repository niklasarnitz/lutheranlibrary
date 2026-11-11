\version "2.24.3"
% Scan 299, printed p. 274: Benedicamus, opening versicle.
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
  \new Staff {
    \clef treble \key g \major \cadenzaOn \omit Staff.TimeSignature \slurUp
    g'1 g'1 g'1 g'1 e'1( g'1) \bar "|"
  }
  \addlyrics { Der HErr sei mit "euch!" __ }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
