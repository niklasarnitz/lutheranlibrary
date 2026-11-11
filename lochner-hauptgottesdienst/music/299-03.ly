\version "2.24.3"
% Scan 299, printed p. 274: Benedicamus, second pastoral versicle.
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
    g'1 g'1 a'1 b'1 b'1 g'1 \shortBar
    a'1( b'1) c''1( b'1 a'1 g'1) g'1 \bar "|."
  }
  \addlyrics {
    Laßt uns "be :" "ne :" "dei :" en den __ "HEr : : : : : :" "ren!"
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
