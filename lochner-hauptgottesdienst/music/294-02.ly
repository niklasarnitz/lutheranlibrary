\version "2.24.3"
% Scan 294, printed p. 269: Dankcollecte, conclusion.
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
        e'1 e'1 e'1 e'1 e'1 g'1
    g'1 g'1 \allowBreak e'1 g'1 g'1 \bar "|"
    e'1 e'1 e'1 e'1 e'1 e'1 e'1 e'1 \allowBreak e'1 g'1 g'1
        g'1 g'1 e'1 g'1 g'1 \allowBreak \bar "|" g'1 g'1 g'1 g'1 g'1 g'1 a'1 g'\breve \allowBreak f'\breve e'\breve \bar "|."
      }
    }
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t
      Durch "un :" sern HErrn "JE :" sum "Chri :" stum, "dei :" nen Sohn, der mit dir in "Ei :" "nig :" keit des "Hei :" "li :" gen
      "Gei :" stes, "wah :" rer Gott, lebet und "herr :" schet "im :" mer und "e :" "wig :" lich.
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
