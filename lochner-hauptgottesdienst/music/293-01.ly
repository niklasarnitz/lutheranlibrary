\version "2.24.3"
% Scan 293, printed p. 268: Dankcollecte, first pastoral versicle.
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
    \clef treble \cadenzaOn \omit Staff.TimeSignature
    e'1 g'1 g'1 g'1 \shortBar
    g'1 g'1 f'1 e'\breve g'\breve \bar "|"
    g'1 g'1 a'\breve g'\breve \bar "|."
  }
  \addlyrics {
    "Dan :" tet dem "HErrn," denn er ist "freund :" "lich."
    "Hal :" "le :" "lu :" "ja!"
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
